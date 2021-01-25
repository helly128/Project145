package com.pj.vegi.restaurant.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantService {


	boolean restaurantCheck(RestaurantVo vo) throws SQLException;	// 멤버 로그인 체크
	int restaurantInsert(RestaurantVo vo) throws SQLException;
	List<RestaurantVo> bizCheckList(String restName) throws SQLException;
	
	public List<RestaurantVo>getRestaurantList(RestaurantVo vo); //식당 목록
	

}