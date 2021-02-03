package com.pj.vegi.restaurant.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pj.vegi.restaurant.mapper.RestaurantMapper;
import com.pj.vegi.restaurant.service.RestaurantService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

@Service("restaurantService")
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantMapper dao;	

	@Override
	public int restInsert(RestaurantVo vo) throws SQLException {
		// 일반 이용자 식당 등록
		return dao.restInsert(vo);
	}
	
	@Override
	public int menuInsert(RestMenuVo vo) throws SQLException {
		// 일반 이용자 식당 등록(메뉴)
		return dao.menuInsert(vo);
	}

	@Override
	public List<RestaurantVo> bizCheckList(String restName) throws SQLException {
		return dao.bizCheckList(restName);
	}

	@Override
	public int bizInfoUpdate(RestaurantVo vo) {	
		return dao.bizInfoUpdate(vo);	
	}
	

	@Override
	public int restInsertNull(RestaurantVo vo) throws SQLException {
		return dao.restInsertNull(vo);
	}

	@Override
	public List<RestaurantVo> getRestaurantList() {
		// 식당 목록페이지
		return dao.getRestaurantList();
	}

	@Override
	public int restaurantInsert(RestaurantVo vo) throws SQLException {
		// 식당 등록
		return 0;
	}
	
	@Override
	public List<RestaurantVo> restNameSerchList(String restName) {
		//일반사용자 식당 입력페이지에서 식당 이름 검색
		return dao.restNameSerchList(restName);
	}

	@Override
	public RestaurantVo getRestaurantDetail(RestaurantVo vo) {
		// 식당 상세 페이지 
		return dao.getRestaurantDetail(vo);
	}

	@Override
	public List<RestMenuVo> getRestaurantMenu(RestMenuVo mVo) {
		//식당 메뉴
		return dao.getRestaurantMenu(mVo);
	}

	@Override
	public int reservInsert(RestReservVo vo) {
		//식당 에약
		return dao.reservInsert(vo);
	}

	@Override
	public int restLikeInsert(LikeListVo vo) {
		//좋아요 선택
		return dao.restLikeInsert(vo);
	}

	@Override
	public int restLikeDelete(LikeListVo vo) {
		//좋아요 취소
		return dao.restLikeDelete(vo);
	}

	@Override
	public int restLikeFlagSelect(LikeListVo vo) {
		//좋아요 여부 확인
		return dao.restLikeFlagSelect(vo);
	}
	
	






	
}
