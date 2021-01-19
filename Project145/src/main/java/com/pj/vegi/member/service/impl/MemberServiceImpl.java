package com.pj.vegi.member.service.impl;

import java.sql.SQLException;

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


}
