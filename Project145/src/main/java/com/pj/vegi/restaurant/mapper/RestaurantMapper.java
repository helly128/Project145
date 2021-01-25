package com.pj.vegi.restaurant.mapper;


import java.util.List;

import com.pj.vegi.vo.RestaurantVo;


public interface RestaurantMapper {

	RestaurantVo restaurantSelect(RestaurantVo vo);
	int restaurantInsert(RestaurantVo vo);
	int restaurantUpdate(RestaurantVo vo); 
	int restaurantDelete(RestaurantVo vo);
	
	int restInsertNull(RestaurantVo vo);
	public List<RestaurantVo> bizCheckList(String restName);
	int bizInfoUpdate(RestaurantVo vo);
	
	List<RestaurantVo>getRestaurantList(RestaurantVo vo);
	
	
}
