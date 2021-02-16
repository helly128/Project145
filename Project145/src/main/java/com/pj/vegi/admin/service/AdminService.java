package com.pj.vegi.admin.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.ReportVo;
import com.pj.vegi.vo.RestaurantVo;
import com.pj.vegi.vo.enquiryVO;

public interface AdminService {
	
	List<MemberVo> adminMemberSelect(MemberVo vo) throws SQLException; //관리자 페이지 회원전체 목록
	int countMember(MemberVo vo); //페이징 게시물 카운트 
	int changAvailable(MemberVo vo); //회원 이용현황 unable로 변경
	
	List<RestaurantVo> adminRestaurant(RestaurantVo vo); //관리자 페이지 식당조회 
	int countAdminRestaurant(RestaurantVo vo); //페이징 게시물 카운트(식당)
	
	List<ReportVo> adminBegiMeetReportList(ReportVo vo); //챌린지 신고
	int countAdminBegiMeetReportList(ReportVo vo);
	
	List<enquiryVO> adminBegiMeetQuestionList(enquiryVO vo); //챌린지 문의
	int countAdminBegiMeetQuestionList(enquiryVO vo);
	
	List<enquiryVO> adminEnquiryList(enquiryVO vo); // 일반 문의
	int countAdminEnquiryList(enquiryVO vo);
}
