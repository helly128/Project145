package com.pj.vegi.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RestaurantVo;

public interface AdminMapper {
	
	List<MemberVo> adminMemberSelect(MemberVo vo) throws SQLException; //관리자 페이지 회원조회 
	int countMember(MemberVo vo); //페이징 게시물 카운트(멤버)
	int changAvailable(MemberVo vo); //회원 이용현황 변경
	
	List<RestaurantVo> adminRestaurant(RestaurantVo vo); //관리자 페이지 식당조회 
	int countAdminRestaurant(RestaurantVo vo); //페이징 게시물 카운트(식당)
	


}
