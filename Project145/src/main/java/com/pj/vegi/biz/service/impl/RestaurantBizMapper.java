package com.pj.vegi.biz.service.impl;

import java.util.List;

import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantBizMapper {
	List<RestaurantVo> restBizList(RestaurantVo vo);
	RestaurantVo restBizSelect(RestaurantVo vo);
	int restBizInsert(RestaurantVo vo);
	int restBizUpdate(RestaurantVo vo);
	int restBizDelete(RestaurantVo vo);
}
