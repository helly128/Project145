package com.pj.vegi.admin.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.MemberVo;

public interface AdminService {
	
	List<MemberVo> adminMemberSelect(MemberVo vo) throws SQLException; //관리자 페이지 회원전체 목록
	
	int countMember(MemberVo vo); //페이징 게시물 카운트 
	
	int changUnable(MemberVo vo); //회원 이용현황 unable로 변경
	
	int changAble(MemberVo vo); //회원 이용현황 able로 변경
}
