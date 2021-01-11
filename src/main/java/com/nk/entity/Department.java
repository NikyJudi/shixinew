package com.nk.entity;

import lombok.Data;
/**
 * author: ningkun
 * date: 2020/01/05
 * 部门实体
 */
@Data
public class Department {
    private Integer departmentId;

    private String departName;


	@Override
	public String toString() {
		return "Department [departmentId=" + departmentId + ", departName=" + departName + "]";
	}

}