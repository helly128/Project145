package com.pj.vegi.restaurant.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantService {

	int restaurantInsert(RestaurantVo vo) throws SQLException;

	List<RestaurantVo> bizCheckList(String restName) throws SQLException; //멤버 로그인에서 한번 씀
	int restaurantEdit(RestaurantVo vo) throws SQLException; //멤버 로그인에서 한번 씀

	


}