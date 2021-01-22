package com.pj.vegi.restaurant.mapper;


import com.pj.vegi.vo.RestaurantVo;


public interface RestaurantMapper {

	RestaurantVo restaurantSelect(RestaurantVo vo);
	int restaurantInsert(RestaurantVo vo);
	int restaurantUpdate(RestaurantVo vo); //회원가입하면서 미리 만들어뒀음
	int restaurantDelete(RestaurantVo vo); //회원가입하면서 미리 만들어뒀음
}
