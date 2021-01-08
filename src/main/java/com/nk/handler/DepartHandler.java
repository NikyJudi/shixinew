package com.nk.handler;


import com.nk.entity.Department;
import com.nk.service.DepartmentService;
import com.nk.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartHandler {
	@Autowired
	private DepartmentService departService;
	@ResponseBody
	@RequestMapping("/departs")
	public Msg getDeparts() {
		List<Department> departs = departService.getAll();
		return Msg.success().add("departs",departs);
	}
	
}
