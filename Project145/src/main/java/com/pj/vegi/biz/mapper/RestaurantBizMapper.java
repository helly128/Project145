package com.pj.vegi.biz.mapper;

import java.util.List;

import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantBizMapper {
	List<RestaurantVo> restBizList(RestaurantVo vo);
	RestaurantVo restBizSelect(RestaurantVo vo);
	List<RestMenuVo> restMenuList(RestMenuVo vo);
	List<RestReservVo> restReservList(RestReservVo vo);
	
	int restBizInsert(RestaurantVo vo);
	int restBizUpdate(RestaurantVo vo);
	int restBizDelete(RestaurantVo vo);
}
