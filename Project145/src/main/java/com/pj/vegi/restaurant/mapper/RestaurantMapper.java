package com.pj.vegi.restaurant.mapper;

import java.util.List;

import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantMapper {

	RestaurantVo restaurantSelect(RestaurantVo vo);
	int restaurantInsert(RestaurantVo vo);
	int restaurantUpdate(RestaurantVo vo); 
	int restaurantDelete(RestaurantVo vo);
	public List<RestaurantVo> bizCheckList(String restName);
	
	List<RestaurantVo>getRestaurantList(RestaurantVo vo); //식당 전체 조회
}
