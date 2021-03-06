package com.pj.vegi.biz.mapper;

import java.util.List;

import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantBizMapper {
	List<RestaurantVo> restBizList(RestaurantVo vo);
	RestaurantVo restBizSelect(RestaurantVo vo);
	List<RestMenuVo> restMenuList(RestMenuVo vo);
	List<RestReservVo> restReservList(RestReservVo vo);	//예약대기자명단
	
	int restBizInsert(RestaurantVo vo);
	int restBizUpdate(RestaurantVo vo);
	int restBizDelete(RestaurantVo vo);
	int getCount(RestaurantVo vo);
	
	int restMenuDelete(RestMenuVo vo);
	int restMenuUpdate(RestMenuVo vo);
	int restMenuInsert(RestMenuVo vo);
	int restAllMenuDelete(RestaurantVo vo);
	
	int restBizReservUpdate(RestReservVo vo);
	int reservRestUpdate(RestReservVo vo);
	
	//매 정각에 예약완료 건 중 예약시간을 지난 건을 지난예약으로 변경
	List<RestReservVo> reservEndList();
	int reservEndUpdate(RestReservVo vo);
	int reservEndMinus(RestReservVo vo);
}
