package com.pj.vegi.restaurant.mapper;


import java.util.List;

import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;


public interface RestaurantMapper {

	RestaurantVo restaurantSelect(RestaurantVo vo);
	int restInsert(RestaurantVo vo); //일반 유저 식당등록 
	int menuInsert(RestMenuVo vo); //일반 유저 식당등록(에 따른 메뉴등록)
	int restaurantUpdate(RestaurantVo vo); 
	int restaurantDelete(RestaurantVo vo);
	
	int restInsertNull(RestaurantVo vo);
	public List<RestaurantVo> bizCheckList(String restName);
	int bizInfoUpdate(RestaurantVo vo);
	
	List<RestaurantVo>getRestaurantList(RestaurantVo vo); //식당메인에 목록 불러오기
	List<RestaurantVo>restNameSerchList(String restName); //식당등록페이지에서 식당이름 검색 
	
	RestaurantVo getRestaurantDetail(RestaurantVo vo); //식당 상세 페이지
	List<RestMenuVo> getRestaurantMenu(RestMenuVo vo); //식당 메뉴 리스트
	
	int reservInsert(RestReservVo vo); //  식당 예약하기
	
	
}
