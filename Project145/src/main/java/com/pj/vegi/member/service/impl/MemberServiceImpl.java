package com.pj.vegi.member.service.impl;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.pj.vegi.member.mapper.MemberMapper;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper dao;

	@Override
	public boolean memberLoginCheck(MemberVo vo) throws SQLException {

		MemberVo resultVO = dao.memberSelect(vo);
		if (vo != null && vo.getPassword().equals(resultVO.getPassword())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int memberInsert(MemberVo vo) throws SQLException {
		
		return dao.memberInsert(vo);
	}

	@Override
	public MemberVo memberSelect(MemberVo vo) throws SQLException {
		return dao.memberSelect(vo);
	}

	@Override
	public int idDuplCheck(String data) throws SQLException {
		return dao.idDuplCheck(data);
	}

	@Override
	public MemberVo idSearch(MemberVo vo) {
		return dao.idSearch(vo);
	}

	

	

	
}
