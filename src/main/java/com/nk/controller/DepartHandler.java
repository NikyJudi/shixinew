package com.nk.controller;


import com.nk.entity.Department;
import com.nk.service.DepartmentService;
import com.nk.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
/**
 * author: ningkun
 * date: 2021/01/05
 * 部门操作
 */
@Controller
public class DepartHandler {
	@Autowired
	private DepartmentService departService;

	/**
	 * 获取所有部门
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/departs")
	public Msg getDeparts() {
		List<Department> departs = departService.getAll();
		return Msg.success().add("departs",departs);
	}
	
}
