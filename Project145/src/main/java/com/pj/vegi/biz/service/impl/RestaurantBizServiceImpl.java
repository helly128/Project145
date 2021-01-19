package com.pj.vegi.biz.service.impl;

import java.util.List;

import com.pj.vegi.biz.service.RestaurantBizService;
import com.pj.vegi.vo.RestaurantVo;

public class RestaurantBizServiceImpl implements RestaurantBizService {

	private RestaurantBizMapper dao;
	
	@Override
	public List<RestaurantVo> restList(RestaurantVo vo) {
		return dao.restList(vo);
	}

	@Override
	public RestaurantVo restSelect(RestaurantVo vo) {
		return dao.restSelect(vo);
	}

	@Override
	public int restInsert(RestaurantVo vo) {
		return dao.restInsert(vo);
	}

	@Override
	public int restUpdate(RestaurantVo vo) {
		return dao.restUpdate(vo);
	}

	@Override
	public int restDelete(RestaurantVo vo) {
		return dao.restDelete(vo);
	}
	
}
