package com.pj.vegi.restaurant.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantService {

	int restaurantInsert(RestaurantVo vo) throws SQLException;

	List<RestaurantVo> bizCheckList(String restName) throws SQLException; //사업자 회원가입에서 리스트
	int restInsertNull(RestaurantVo vo) throws SQLException;//사업자 회원가입에서 등록
	int bizInfoUpdate(RestaurantVo vo);//사업자 회원가입에서 수정  
	
	public List<RestaurantVo>getRestaurantList(RestaurantVo vo); //식당메인에서 리스트
	int restInsert(RestaurantVo vo) throws SQLException; //식당메인에서 식당등록
	int menuInsert(RestMenuVo vo) throws SQLException; //식당메인에서 식당등록(하면서 메뉴등록)
	public List<RestaurantVo> restNameSerchList(String restName); //식당등록페이지에서 식당이름 검색 
	
	RestaurantVo getRestaurantDetail(RestaurantVo vo); //식당 상세페이지
	List<RestMenuVo> getRestaurantMenu(RestMenuVo mVo); //식당 메뉴리스트
	
	int reservInsert(RestReservVo vo); //식당 예약
	
	
	


	


}