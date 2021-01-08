package com.nk.service;


import com.nk.dao.DepartmentMapper;
import com.nk.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
		@Autowired
		private DepartmentMapper departmentMapper;

		public List<Department> getAll(){
			return departmentMapper.selectByExample(null);
			
		}
		public Department getDepartment(Integer id) {
			return departmentMapper.selectByPrimaryKey(id);
		}
}
