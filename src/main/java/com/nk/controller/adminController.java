package com.nk.controller;

import com.nk.entity.Functionary;
import com.nk.entity.LoginEntity;
import com.nk.entity.Manager;
import com.nk.service.FunctionaryService;
import com.nk.service.ManagerService;
import com.nk.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;
/**
 * author: ningkun
 * date: 2021/01/05
 *
 */
@Controller
@RequestMapping("/admin")
public class adminController {

    @Autowired
    private FunctionaryService functionaryService;

    @Autowired
    private ManagerService managerService;

    /**
     *  获取个人信息
     * @param id jobid
     * @return
     */
    @ResponseBody
    @GetMapping(value="/{jobId}")
    public Msg getFun(@PathVariable("jobId") Integer id) {
        Functionary functionary=functionaryService.getFunctionary(id);
        return Msg.success().add("functionary", functionary);
    }

    /**
     * 只能修改 部分属性 其它前端disabled
     * @param functionary
     * @return
     */
    @ResponseBody
    @PutMapping
    public Msg updateFun(@RequestBody Functionary functionary){
        functionaryService.updateByPrimaryKey(functionary);
        return Msg.success().add("message","修改成功");
    }

    /**
     * 登录
     * @param loginEntity
     * @return
     */
    @ResponseBody
    @GetMapping("/login")
    public Msg login(LoginEntity loginEntity){
        if (Objects.isNull(loginEntity.getPassword()) || Objects.isNull(loginEntity.getJobId())){
            return Msg.fail().add("message", "请输入正确的账号和密码！");
        }
//        Manager manager = managerService.
        return null;
    }

}
