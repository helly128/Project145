package com.pj.vegi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.biz.mapper.RestaurantBizMapper;
import com.pj.vegi.biz.service.RestaurantBizService;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

@Service("restBizService")
public class RestaurantBizServiceImpl implements RestaurantBizService {
	@Autowired
	RestaurantBizMapper dao;
	
	@Override
	public List<RestaurantVo> restBizList(RestaurantVo vo) {
		return dao.restBizList(vo);
	}

	@Override
	public RestaurantVo restBizSelect(RestaurantVo vo) {
		return dao.restBizSelect(vo);
	}

	@Override
	public int restBizInsert(RestaurantVo vo) {
		return dao.restBizInsert(vo);
	}

	@Override
	public int restBizUpdate(RestaurantVo vo) {
		return dao.restBizUpdate(vo);
	}

	@Override
	public int restBizDelete(RestaurantVo vo) {
		return dao.restBizDelete(vo);
	}

	@Override
	public List<RestMenuVo> restMenuList(RestMenuVo vo) {
		return dao.restMenuList(vo);
	}

	@Override
	public List<RestReservVo> restReservList(RestReservVo vo) {
		return dao.restReservList(vo);
	}

	@Override
	public int restMenuDelete(RestMenuVo vo) {
		return dao.restMenuDelete(vo);
	}
	
	@Override
	public int restMenuUpdate(RestMenuVo menuVo) {
		return dao.restMenuUpdate(menuVo);
	}

	@Override
	public int restMenuInsert(RestMenuVo vo) {
		return dao.restMenuInsert(vo);
	}
}
