package com.nk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nk.entity.Myfile;
import com.nk.entity.SearchUtilEntity;
import com.nk.service.MyFileService;
import com.nk.util.BucketObjectUtil;
import com.nk.util.Msg;
import com.nk.util.Rename_String;
import com.obs.services.model.ObsObject;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * author: ningkun
 * date: 2021/01/05
 * 文件相关操作
 */
@Controller
@RequestMapping("/file")
public class FileController {
    BucketObjectUtil objectUtil = new BucketObjectUtil();

    private static final Logger LOG = Logger.getLogger(FileController.class);

    @Autowired
    public MyFileService myFileService;

    /**
     * 获取某用户的文件
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    @ResponseBody
    public Msg getFile(@PathVariable("id") Long id, @RequestParam(value = "pn", defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<Myfile> myfiles = myFileService.selectByFunId(id);
        if (Objects.nonNull(myfiles)) {
            PageInfo<Myfile> pageInfo = new PageInfo<>(myfiles, 5);
            return Msg.success().add("page", pageInfo);
        }
        return Msg.success().add("myfiles", "列表为空");
    }

    /**
     * 获取所有文件
     *
     * @param
     * @return
     */
    @GetMapping
    @ResponseBody
    public Msg getFile(@RequestParam(value = "pn", defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<Myfile> myfiles = myFileService.selectAll();
        if (Objects.nonNull(myfiles)) {
            PageInfo<Myfile> pageInfo = new PageInfo<>(myfiles, 5);
            return Msg.success().add("page", pageInfo);
        }
        return Msg.success().add("page", "列表为空");
    }

    /**
     * 上传文件
     * @param jobid 上传者id
     * @param request
     * @param mfile 文件信息封装类
     * @return
     * @throws Exception
     */
    @Transactional
    @PostMapping("/{jobid}")
    @ResponseBody
    public Msg upload(@PathVariable("jobid") Integer jobid, HttpServletRequest request,
                      @RequestParam("up_file") MultipartFile mfile) throws Exception {
        if (mfile.isEmpty()) {
            return Msg.fail().add("message", "请选择文件!");
        }
//		String url = "https://nkdetong.obs.cn-east-3.myhuaweicloud.com/test1obj?versionId=null";
        String originalFilename = mfile.getOriginalFilename();
        Myfile myfile = new Myfile();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        myfile.setCdate(simpleDateFormat.format(new Date()));
        try {
//            Integer statusCode =
            myfile.setFsize(mfile.getSize());
            myfile.setFunid(jobid);
            myfile.setFname(originalFilename);
            myfile.setFtype(Rename_String.type(originalFilename));
            objectUtil.uploadFile(mfile.getInputStream(), originalFilename);
            myFileService.insert(myfile);
            return Msg.success().add("message", "上传成功");
        } catch (IOException e) {
            LOG.error(e.toString(), e);
        }
        return Msg.fail().add("message", "上传失败!");
    }

    /**
     * 文件下载
     * @param id 文件id
     * @param request
     * @param resp
     * @param session
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @GetMapping("/download/{id}")
    @ResponseBody
    public Msg download(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse resp, HttpSession session)
            throws IllegalStateException, IOException {

        LOG.info("download...");
        Myfile myfile = myFileService.selectByPrimaryKey(id);
        if (Objects.isNull(myfile)) {
            return Msg.fail().add("message", "该文件异常，请联系管理员");
        }
        String fileKey = myfile.getFname();
        ObsObject object = objectUtil.getFile(fileKey);
        if (object != null) {
            InputStream is = object.getObjectContent();
//            // 下载时文件名会乱码或不显示，进行转码
//            String downloadFielName = new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
            // 设置响应的内容类型为流的方式
            resp.setContentType("application/octet-stream");
            // 让服务器告诉浏览器它发送的数据属于什么文件类型（流）
            resp.setHeader("content-type", "application/octet-stream");
//            // 告诉浏览器这个文件的类型和名字(attachment--以附件的方式)
//            resp.setHeader("Content-Disposition", "attachment;filename=" + downloadFielName);
            String realPath = request.getServletContext().getRealPath("myfile");
            File myf = new File(realPath);
            if(!myf.exists()){//如果文件夹不存在
                myf.mkdir();//创建文件夹
            }
            FileOutputStream fos = new FileOutputStream(realPath + "/" + fileKey);
            System.out.println(request.getServletContext().getRealPath(fileKey));
            // 自定义缓冲流经典写法
            // 自定义缓冲区 1024
            byte[] b = new byte[1024];
            int len;
            // 从字节数组里读
            while ((len = is.read(b)) != -1) {
                // 往出写，读多少写多少
                fos.write(b, 0, len);
            }
            // 正向打开，逆向关闭
            fos.close();
            is.close();
            return Msg.success().add("message", realPath + "/" + fileKey);
        }
        return Msg.fail().add("message", "该文件异常，请联系管理员");
    }

    /**
     * 文件预览
     * @param id 文件id
     * @param request
     * @param resp
     * @return
     * @throws IOException
     */
    @GetMapping("/preview/{id}")
    @ResponseBody
    public Msg preview(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse resp) throws IOException {
        Myfile myfile = myFileService.selectByPrimaryKey(id);
        if (Objects.isNull(myfile)) {
            return Msg.fail().add("message", "该文件异常，请联系管理员");
        }
        System.out.println(objectUtil.preview(myfile.getFname()));
        return Msg.success().add("stream", objectUtil.preview(myfile.getFname()));
    }

    /**
     * 某文件删除（真的删除了）
     * @param id
     * @return
     * @throws IOException
     */
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    @Transactional
    public Msg delete(@PathVariable("id") Long id) throws IOException {
        Myfile myfile = myFileService.selectByPrimaryKey(id);
        if (Objects.isNull(myfile)) {
            return Msg.fail().add("message", "该文件异常，请联系管理员");
        }
        objectUtil.removeFile(myfile.getFname());
        myFileService.deleteByPrimaryKey(id);
        return Msg.success().add("message","删除成功");
    }

    /**
     * 所有文件删除（真的删除了）
     * @param jobid
     * @return
     * @throws IOException
     */
    @DeleteMapping("/delete/{jobid}")
    @ResponseBody
    @Transactional
    public Msg delete2(@PathVariable("jobid") Long jobid)  {
        return myFileService.deleteByFunId(jobid);
    }

    /**
     * 放入回收站
     * @param id
     * @return
     */
    @PutMapping("/todelete")
    @ResponseBody
    public Msg toDelete(@RequestParam("id") Long id,@RequestParam("jobid") Long jobid){
        return myFileService.updateDeleteStatus(id, jobid);
    }

    /**
     * 单个文件恢复
     * @param id
     * @return
     */
    @PutMapping("/recover")
    @ResponseBody
    public Msg recover(@RequestParam("id") Long id){
        return myFileService.recover(id);
    }

    /**
     * 所有文件恢复
     * @param jobid
     * @return
     */
    @PutMapping("/recover")
    @ResponseBody
    public Msg recover2(@RequestParam("jobid") Long jobid){
        return myFileService.recover2(jobid);
    }

    /**
     * 获取某用户的回收站列表
     */
    @GetMapping("/garbage")
    @ResponseBody
    public Msg selectAllGarbage(@RequestParam(value = "jobid",required = false) Long jobid, @RequestParam(value = "pn", defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum, 8);
        List<Myfile> myfiles = myFileService.selectAllGarbage(jobid);
        if (Objects.nonNull(myfiles)) {
            PageInfo<Myfile> pageInfo = new PageInfo<>(myfiles, 5);
            return Msg.success().add("page", pageInfo);
        }
        return Msg.success().add("message", "没有文件");
    }

//    /**
//     * 查找字符串 key 匹配上传者或文件名（公共资源池）
//     * @param key
//     * @return
//     */
//    @GetMapping("/search")
//    @ResponseBody
//    public Msg search(@RequestParam(value = "key",required = false) String key){
//        List<Myfile> myfiles = myFileService.selectByKey(key);
//        if (Objects.nonNull(myfiles)) {
//            PageInfo<Myfile> pageInfo = new PageInfo<>(myfiles, 5);
//            return Msg.success().add("page", pageInfo);
//        }
//        return Msg.fail().add("message", "无对应文件");
//    }
//
//
//    /**
//     * 查找字符串 key 匹配上传者或文件名(个人资源)
//     * @param key
//     * @return
//     */
//    @GetMapping("/search2/{id}")
//    @ResponseBody
//    public Msg search2(@RequestParam(value = "key",required = false) String key,@PathVariable("id")Long id){
//        SearchUtilEntity searchUtilEntity = new SearchUtilEntity();
//        searchUtilEntity.setId(id);
//        searchUtilEntity.setKey(key);
//        List<Myfile> myfiles = myFileService.selectByKey2(searchUtilEntity);
//        if (Objects.nonNull(myfiles)) {
//            PageInfo<Myfile> pageInfo = new PageInfo<>(myfiles, 5);
//            return Msg.success().add("page", pageInfo);
//        }
//        return Msg.fail().add("message", "无对应文件");
//    }
}
