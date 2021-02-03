package com.pj.vegi.admin.mapper;

import java.util.List;

import com.pj.vegi.vo.MemberVo;

public interface AdminMapper {
	
	List<MemberVo> adminMemberSelect(MemberVo vo); //관리자 페이지 회원조회 
	
	int countMember(MemberVo vo); //페이징 게시물 카운트 
	
	int changUnable(MemberVo vo); //회원 이용현황 unable로 변경
	
	int changAble(MemberVo vo); //회원 이용현황 able로 변경
	


}
