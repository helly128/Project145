package com.dbal.app.emp.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dbal.app.emp.EmpVO;

@Repository
public class EmpDAO {

	@Autowired private SqlSessionTemplate mybatis;
	
	public EmpVO getEmp(EmpVO empVO) {
		return mybatis.selectOne("com.dbal.app.emp.mapper.EmpDAO.getEmp",empVO );
	}	
	public List<EmpVO> getEmpList(EmpVO empVO) {
		return mybatis.selectList("com.dbal.app.emp.mapper.EmpDAO.getEmpList",empVO);
	}
	public void insertEmp(EmpVO empVO) {
		mybatis.insert("com.dbal.app.emp.mapper.EmpDAO.insertEmp", empVO);
	}
	//getName 메서드 선언
	//getCnt 메서드 선언
	//getEmpMap 메서드 선언
}
