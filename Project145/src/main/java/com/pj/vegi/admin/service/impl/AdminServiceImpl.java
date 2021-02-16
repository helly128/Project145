package com.pj.vegi.admin.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.admin.mapper.AdminMapper;
import com.pj.vegi.admin.service.AdminService;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.ReportVo;
import com.pj.vegi.vo.RestaurantVo;
import com.pj.vegi.vo.enquiryVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper dao;

	@Override
	public List<MemberVo> adminMemberSelect(MemberVo vo) throws SQLException {
		// 관리자 페이지 회원 전체 조회
		return dao.adminMemberSelect(vo);
	}

	@Override
	public int countMember(MemberVo vo) {
		// 페이징 카운트(멤버)
		return dao.countMember(vo);
	}

	@Override
	public int changAvailable(MemberVo vo) {
		// 회원 이용현황 unable로 변경
		return dao.changAvailable(vo);
	}

	@Override
	public List<RestaurantVo> adminRestaurant(RestaurantVo vo) {
		//관리자 페이지 식당 전체 조회
		return dao.adminRestaurant(vo);
	}

	@Override
	public int countAdminRestaurant(RestaurantVo vo) {
		// 페이징 카운트(식당)
		return dao.countAdminRestaurant(vo);
	}

	@Override
	public List<ReportVo> adminBegiMeetReportList(ReportVo vo) {
		//챌린지 신고 
		return dao.adminBegiMeetReportList(vo);
	}

	@Override
	public int countAdminBegiMeetReportList(ReportVo vo) {
		//
		return dao.countAdminBegiMeetReportList(vo);
	}

	@Override
	public List<enquiryVO> adminBegiMeetQuestionList(enquiryVO vo) {
		//챌린지문의 목록
		return dao.adminBegiMeetQuestionList(vo);
	}

	@Override
	public int countAdminBegiMeetQuestionList(enquiryVO vo) {
		// 
		return dao.countAdminBegiMeetQuestionList(vo);
	}

	@Override
	public List<enquiryVO> adminEnquiryList(enquiryVO vo) {
		// 일반 관리자 문의
		return dao.adminEnquiryList(vo);
	}

	@Override
	public int countAdminEnquiryList(enquiryVO vo) {
		//
		return dao.countAdminEnquiryList(vo);
	}



}
