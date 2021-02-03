package com.pj.vegi.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.admin.mapper.AdminMapper;
import com.pj.vegi.admin.service.AdminService;
import com.pj.vegi.vo.MemberVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper dao;

	@Override
	public List<MemberVo> adminMemberSelect(MemberVo vo) {
		// 관리자 페이지 회원 전체 조회
		return dao.adminMemberSelect(vo);
	}

	@Override
	public int countMember(MemberVo vo) {
		// 페이징 카운트
		return dao.countMember(vo);
	}

	@Override
	public int changUnable(MemberVo vo) {
		// 회원 이용현황 unable로 변경
		return dao.changUnable(vo);
	}

	@Override
	public int changAble(MemberVo vo) {
		// 회원 이용현황 able로 변경
		return dao.changAble(vo);
	}

}
