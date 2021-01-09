package com.nk.controller;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageInfo;
import com.nk.entity.Functionary;
import com.nk.entity.Myfile;
import com.nk.service.MyFileService;
import com.nk.util.BucketObjectUtil;
import com.nk.util.Msg;
import com.nk.util.Rename_String;
import com.obs.services.model.ObsObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.obs.services.model.ObsObject;



@Controller
@RequestMapping("/file")
public class FileController {
    private static final Logger LOG = Logger.getLogger(FileController.class);

    @Autowired
    public MyFileService myFileService;

    @RequestMapping("/personalPhoto_upload")
    @ResponseBody
    public String personalPhoto_upload(String photo_name, HttpServletRequest request,
                                       @RequestParam("file") MultipartFile mfile) throws Exception {
        LOG.info("personalPhoto_upload...............   " + photo_name);
        String originalFilename = mfile.getOriginalFilename();
        String realPath = request.getSession().getServletContext().getRealPath("/images");
        String rename = Rename_String.rename(originalFilename);
        System.out.println(rename + "  -------------");
        String target = realPath + "/" + rename;
        LOG.info(mfile.getOriginalFilename() + "     新文件");
        // String target = realPath + "/" + rename;
        mfile.transferTo(new File(target));
        return rename;
    }


    /**
     * 获取某用户的文件
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Msg getFile(@PathVariable("id") Integer id) {
        List<Myfile> myfiles = myFileService.selectByFunId(id);
        if (Objects.nonNull(myfiles)) {
            PageInfo<Myfile> pageInfo = new PageInfo<>(myfiles, 5);
            return Msg.success().add("myfiles", pageInfo);
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
    public Msg getFile() {
        List<Myfile> myfiles = myFileService.selectAll();
        System.out.println(myfiles);
        if (Objects.nonNull(myfiles)) {
            PageInfo<Myfile> pageInfo = new PageInfo<>(myfiles, 5);
            return Msg.success().add("page", pageInfo);
        }
        return Msg.success().add("page", "列表为空");
    }

    //	@GetMapping("/")
    @PostMapping("/{jobid}")
    @ResponseBody
    public Msg upload(@PathVariable("jobid") Integer jobid, HttpServletRequest request,
                                       @RequestParam("up_file") MultipartFile mfile) throws Exception {
		if (mfile.isEmpty()) {
			return Msg.fail().add("message", "请选择文件!");
		}
//		String url = "https://nkdetong.obs.cn-east-3.myhuaweicloud.com/test1obj?versionId=null";
        String originalFilename = mfile.getOriginalFilename();
        String filePath  = request.getSession().getServletContext().getRealPath("/images");
		System.out.println(filePath);
//		File dest = new File(filePath + originalFilename);
        String rename = Rename_String.rename(originalFilename);
        Myfile myfile = new Myfile();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        myfile.setCdate(simpleDateFormat.format(new Date()));
		try {
            BucketObjectUtil objectUtil = new BucketObjectUtil();
//            url += originalFilename;
            // 上传
//			mfile.transferTo(dest);
//            Integer statusCode =
            objectUtil.uploadFile(mfile.getInputStream(),originalFilename);
			myfile.setFtype(Rename_String.type(originalFilename));
			myfile.setFsize(mfile.getSize());
			myfile.setFunid(jobid);
			myfile.setFname(originalFilename);
            myFileService.insert(myfile);
			LOG.info("上传成功-{}" + Files.probeContentType(Paths.get(filePath)) );
			return Msg.success().add("message","上传成功");
		} catch (IOException e) {
			LOG.error(e.toString(), e);
		}
        return Msg.fail().add("message", "上传失败!");
    }

//    // 下载（更加通用的方法）
//    @RequestMapping("/download")
//    public void download(String fileName, HttpServletResponse resp, HttpSession session)
//            throws IllegalStateException, IOException {
//        LOG.info("download...");
//
//        ObsObject object = objectUtil.getFile("test1obj");
//        if (object != null) {
//            InputStream is = object.getObjectContent();
//            FileOutputStream fos = new FileOutputStream(new
//                    File("C:\\Users\\nk182\\Desktop\\pom.xml"));
//            // 自定义缓冲流经典写法
//            // 自定义缓冲区 1024
//            byte[] b = new byte[1024];
//            int len;
//            // 从字节数组里读
//            while ((len = is.read(b)) != -1) {
//                // 往出写，读多少写多少
//                fos.write(b, 0, len);
//            }
//            System.out.println("完成");
//            // 正向打开，逆向关闭
//            fos.close();
//            is.close();
//        } else {
//            Sys
//        // 下载时文件名会乱码或不显示，进行转码
//        String downloadFielName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
//        // 设置响应的内容类型为流的方式
//        resp.setContentType("application/octet-stream");
//        // 让服务器告诉浏览器它发送的数据属于什么文件类型（流）
//        resp.setHeader("content-type", "application/octet-stream");
//        // 告诉浏览器这个文件的类型和名字(attachment--以附件的方式)
//        resp.setHeader("Content-Disposition", "attachment;filename=" + downloadFielName);
//        String realPath = session.getServletContext().getRealPath("images");
//        // 有文件上传
//        FileInputStream fis = new FileInputStream(realPath + "/" + fileName);
//        ServletOutputStream os = resp.getOutputStream();
//        int len = 0;
//        // 自定义缓冲区（缓冲区的大小为1024）,经典写法
//        byte[] b = new byte[1024];
//        while ((len = fis.read(b)) != -1) {
//            os.write(b, 0, len);
//        }
//        os.close();
//        fis.close();
//    }


}
