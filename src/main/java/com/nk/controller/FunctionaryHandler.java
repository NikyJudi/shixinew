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
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.*;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        session.setAttribute("user", functionary);
        LOG.info(functionary);
        return Msg.success().add("message", "登陆成功");
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
            return Msg.success();
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
            return Msg.fail().add("errors", e.getStackTrace());
        }
    }

    //	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		dateFormat.setLenient(false);
//		binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
//	}
    @ResponseBody
    @RequestMapping("/funcs")
    public Msg getfuncWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, 8);
        List<Functionary> functionary = functionaryService.getAll();
        PageInfo<Functionary> pageInfo = new PageInfo<Functionary>(functionary, 5);
        return Msg.success().add("page", pageInfo);
    }

//    @PostMapping("/import")
//    @ResponseBody
//    public Msg importFun(@RequestParam("up_file") MultipartFile mfile) {
//        if (mfile.isEmpty()) {
//            return Msg.fail().add("message", "请选择非空文件!");
//        }
//        if (!"xls".equals(Rename_String.type(mfile.getOriginalFilename()))) {
//            return Msg.fail().add("message", "请选择xls文件!");
//
//        }
//        File file = new File("/temp.xls");
//		JSONArray jarr = new JSONArray();
//        try {
//            HSSFWorkbook workbook = new HSSFWorkbook(mfile.getInputStream());
//            HSSFSheet sheet = workbook.getSheetAt(0);
//			int cols = 0;
//            if (sheet != null) {
//                HSSFRow row = sheet.getRow(0);
//                if (row != null)
//                    cols = row.getLastCellNum();
//
//                for (int i = 1, len = sheet.getLastRowNum(); i <= len; i++) {
//                    row = sheet.getRow(i);
//                    Functionary functionary =
//                    if (row != null) {
//                        JSONObject jo = new JSONObject();
//                        for (int j = 0; j < cols; j++) {
//                            HSSFCell cell = row.getCell(j);
//                            if (cell != null) {
//                                Object v = null;
//                                HSSFCellStyle type = cell.getCellStyle();
//                                switch (cell.getCellType()) {
//                                    case HSSFCell.CELL_TYPE_NUMERIC:
//                                        v = cell.getNumericCellValue();
//                                        break;
//                                    case HSSFCell.CELL_TYPE_STRING:
//                                        v = cell.getStringCellValue();
//                                        break;
//                                    case HSSFCell.CELL_TYPE_BOOLEAN:
//                                        v = cell.getBooleanCellValue();
//                                        break;
//                                    case HSSFCell.CELL_TYPE_FORMULA:
//                                        v = cell.getCellFormula();
//                                        break;
//                                    default:
//                                        System.out.println("unsuported sell type");
//                                        break;
//                                }
//                                jo.put(fields[j], v);
//
//                            }
//                        }
//                        jarr.add(jo);
//                    }
//                }
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        mfile.transferTo();
//    }

}