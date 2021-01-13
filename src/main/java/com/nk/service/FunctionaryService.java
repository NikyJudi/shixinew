package com.nk.service;

import com.nk.dao.FunctionaryMapper;
import com.nk.entity.Functionary;
import com.nk.entity.FunctionaryExample;
import com.nk.util.ChineseCharToEn;
import com.nk.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * author: ningkun
 * date: 2021/01/05
 */
@Service
public class FunctionaryService {
	@Autowired
	private FunctionaryMapper functionaryMapper;

	public List<Functionary> getAll(){
		FunctionaryExample functionaryExample=new FunctionaryExample();
		functionaryExample.setOrderByClause("Job_id ASC");
		return functionaryMapper.selectByExampleWithDepart(functionaryExample);
	}
	public Functionary getFunctionary(Integer id) {
		return functionaryMapper.selectByPrimaryKeyWithDepart(id);
	}
	public boolean validateName(String name) {
		FunctionaryExample functionaryExample=new FunctionaryExample();
		FunctionaryExample.Criteria criteria = functionaryExample.createCriteria();
		criteria.andNameEqualTo(name);
		long count = functionaryMapper.countByExample(functionaryExample);
		return count == 0;
	}

	public void saveFunctionary(Functionary functionary) {
		String pw = functionary.getDepartmentId() + ChineseCharToEn.getAllFirstLetter(functionary.getName());
		pw += functionary.getPhoneNum();
		functionary.setPassword(pw);
		functionaryMapper.insertSelective(functionary);
		
	}
	public void updateFunctionary(Functionary functionary) {
		functionaryMapper.updateByPrimaryKeySelective(functionary);
	}

	public void deleteFunctionary(Integer id) {
		functionaryMapper.deleteByPrimaryKey(id);
	}

	public void deleteFunctionaryBatch(List<Integer> ids) {
		FunctionaryExample functionaryExample=new FunctionaryExample();
		FunctionaryExample.Criteria criteria = functionaryExample.createCriteria();
		criteria.andJobIdIn(ids);
		functionaryMapper.deleteByExample(functionaryExample);
	}

	public Functionary login(Integer jobId, String password) {
		return functionaryMapper.login(jobId, password);
	}

	public void updateByPrimaryKey(Functionary functionary) {
		functionaryMapper.updateByPrimaryKeySelective(functionary);
	}
}
