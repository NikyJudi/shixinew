package com.nk.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nk.entity.Functionary;
import com.nk.entity.LoginEntity;
import com.nk.service.FunctionaryService;
import com.nk.util.Msg;
import com.nk.util.Rename_String;
import org.apache.poi.hssf.usermodel.*;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * author: ningkun
 * date: 2021/01/05
 * 用户相关操作
 */
@Controller
public class FunctionaryHandler {

    private static final Logger LOG = Logger.getLogger(FunctionaryHandler.class);

    @Autowired
    private FunctionaryService functionaryService;

    @RequestMapping("/")
    public String index() {
        System.out.println("11111");
        return "homepage";
    }

    @ResponseBody
    @RequestMapping("/login")
    public Msg findFun(LoginEntity loginEntity, HttpSession session) {
        Functionary functionary = functionaryService.login(loginEntity.getJobId(), loginEntity.getPassword());
        if (functionary == null) {
            return Msg.fail().add("message", "账号或密码错误");
        }
        if (functionary.getStatus()==0 && functionary.getUsagee()==0){
            return Msg.faillogin();
        }
        session.setAttribute("user", functionary);
        return Msg.success().add("functionary", functionary);
    }


    @GetMapping("/logout")
    public Msg logout(HttpSession session) {
        session.invalidate();
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "/func/{jobIds}", method = RequestMethod.DELETE)
    public Msg deleteFun(@PathVariable("jobIds") String ids) {
        if (ids.contains(",")) {
            String[] strIds = ids.split(",");
            List<Integer> funIds = new ArrayList<>();
            for (String s : strIds) {
                funIds.add(Integer.parseInt(s));
            }
            functionaryService.deleteFunctionaryBatch(funIds);
        } else {
            Integer id = Integer.parseInt(ids);
            functionaryService.deleteFunctionary(id);
        }
        return Msg.success();
    }

    @ResponseBody
    @GetMapping(value = "/funs/{jobId}")
    public Msg getFun(@PathVariable("jobId") Integer id) {
        Functionary functionary = functionaryService.getFunctionary(id);
        return Msg.success().add("functionary", functionary);
    }

    @ResponseBody
    @RequestMapping("/checkName")
    public Msg checkName(@RequestParam("funName") String name) {
        boolean flag = functionaryService.validateName(name);
        return flag == true ? Msg.success() : Msg.fail();
    }

    @ResponseBody
    @RequestMapping(value = "/funccc/{jobId}", method = RequestMethod.PUT)
    public Msg update(@Valid Functionary functionary, BindingResult result) {
        System.out.println(functionary);
        if (result.getErrorCount() > 0) {
            Map<String, Object> errors = new HashMap<String, Object>();
            for (FieldError error : result.getFieldErrors()) {
                System.out.println(error.getField() + ":" + error.getDefaultMessage());
                errors.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add("errors", errors);
        }
        try {
            functionaryService.updateFunctionary(functionary);
            return Msg.success().add("functionary", functionary);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return Msg.fail().add("errors", e.getMessage());
        }
    }

    /**
     * @param functionary
     * @return
     */
    @ResponseBody
    @PostMapping("/func")
    public Msg save(@Valid Functionary functionary) {
        System.out.println(functionary);
        try {
            functionaryService.saveFunctionary(functionary);
            return Msg.success();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println();
            return Msg.fail().add("errors", e.getStackTrace());
        }
    }

    @ResponseBody
    @RequestMapping("/funcs")
    public Msg getfuncWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<Functionary> functionary = functionaryService.getAll();
        PageInfo<Functionary> pageInfo = new PageInfo<Functionary>(functionary, 5);
        return Msg.success().add("page", pageInfo);
    }

@PostMapping("/import")
@ResponseBody
public Msg importFun(@RequestParam("up_file") MultipartFile mfile) {
    if (mfile.isEmpty()) {
        return Msg.fail().add("message", "请选择非空文件!");
    }
    if (!"xls".equals(Rename_String.type(mfile.getOriginalFilename()))) {
        return Msg.fail().add("message", "请选择xls文件!");

    }
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    try {
        HSSFWorkbook workbook = new HSSFWorkbook(mfile.getInputStream());
        HSSFSheet sheet = workbook.getSheetAt(0);
        if (sheet != null) {
            HSSFRow row;
            for (int i = 1, len = sheet.getLastRowNum(); i <= len; i++) {
                Functionary functionary = new Functionary();
                row = sheet.getRow(i);
                if (row != null) {
                    int j = 0;
                    functionary.setName(row.getCell(j++).getStringCellValue());
                    functionary.setSex(row.getCell(j++).getStringCellValue());
                    functionary.setEmail(row.getCell(j++).getStringCellValue());
                    DecimalFormat df = new DecimalFormat("#");
                    functionary.setPhoneNum(df.format(row.getCell(j++).getNumericCellValue()));
                    Date date1 = row.getCell(j++).getDateCellValue();
                    Date date2 = row.getCell(j++).getDateCellValue();
                    functionary.setBirth(simpleDateFormat.parse(simpleDateFormat.format(new Date(date1.getTime()))));
                    functionary.setEntryTime(simpleDateFormat.parse(simpleDateFormat.format(new Date(date2.getTime()))));
                    functionary.setDepartmentId((int) row.getCell(j).getNumericCellValue());
                    functionaryService.saveFunctionary(functionary);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return Msg.success().add("message","插入成功");
}
}