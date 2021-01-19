package com.pj.vegi.biz.service.impl;

import java.util.List;

import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantBizMapper {
	List<RestaurantVo> restList(RestaurantVo vo);
	RestaurantVo restSelect(RestaurantVo vo);
	int restInsert(RestaurantVo vo);
	int restUpdate(RestaurantVo vo);
	int restDelete(RestaurantVo vo);
}
