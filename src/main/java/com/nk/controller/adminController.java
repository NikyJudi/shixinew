package com.nk.controller;

import com.nk.entity.Functionary;
import com.nk.service.FunctionaryService;
import com.nk.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class adminController {

    @Autowired
    FunctionaryService functionaryService;

    @ResponseBody
    @GetMapping(value="/{jobId}")
    public Msg getFun(@PathVariable("jobId") Integer id) {
        Functionary functionary=functionaryService.getFunctionary(id);
        return Msg.success().add("functionary", functionary);
    }

    @ResponseBody
    @PutMapping
    public Msg updateFun(@RequestBody Functionary functionary){
        functionaryService.updateByPrimaryKey(functionary);
        return Msg.success().add("message","修改成功");
    }
}
