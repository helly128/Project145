package com.dbal.app.emp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dbal.app.emp.EmpVO;


public interface EmpService {

	public EmpVO getEmp(EmpVO empVO);
	public List<EmpVO> getEmpList(EmpVO empVO);
	public void empInsert(EmpVO empVO);
	
}
