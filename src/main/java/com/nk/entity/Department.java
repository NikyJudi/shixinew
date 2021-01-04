package com.nk.entity;

import lombok.Data;

@Data
public class Department {
    private Integer departmentId;

    private String departName;


	@Override
	public String toString() {
		return "Department [departmentId=" + departmentId + ", departName=" + departName + "]";
	}

}