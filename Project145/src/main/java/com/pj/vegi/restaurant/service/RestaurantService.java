package com.pj.vegi.restaurant.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestReviewVo;
import com.pj.vegi.vo.RestaurantVo;

public interface RestaurantService {

	int restaurantInsert(RestaurantVo vo) throws SQLException;

	List<RestaurantVo> bizCheckList(String restName) throws SQLException; //사업자 회원가입에서 리스트
	int restInsertNull(RestaurantVo vo) throws SQLException;//사업자 회원가입에서 등록
	int bizInfoUpdate(RestaurantVo vo);//사업자 회원가입에서 수정  
	
	List<RestaurantVo>getRestaurantList(RestaurantVo vo) throws SQLException; //식당메인에 목록 불러오기
	int countRestaurantList(RestaurantVo vo); //식당 메인 페이징
	int restInsert(RestaurantVo vo) throws SQLException; //식당메인에서 식당등록
	int menuInsert(RestMenuVo vo) throws SQLException; //식당메인에서 식당등록(하면서 메뉴등록)
	public List<RestaurantVo> restNameSerchList(String restName); //식당등록페이지에서 식당이름 검색 
	
	RestaurantVo getRestaurantDetail(RestaurantVo vo); //식당 상세페이지
	List<RestMenuVo> getRestaurantMenu(RestMenuVo mVo); //식당 메뉴리스트
	
	int reservInsert(RestReservVo vo); //식당 예약
	
	int restLikeInsert(LikeListVo vo); //좋아요 선택
	int restLikeDelete(LikeListVo vo); //좋아요 취소
	int restLikeFlagSelect(LikeListVo vo); //좋아요 여보 확인
	
<<<<<<< HEAD
	List<RestReviewVo> restReview(RestReviewVo vo); //식당 리뷰
	int countRestReview (RestReviewVo vo); //삭당 리뷰 카운트
	
=======
	int reservCountUp(RestaurantVo vo);
	


	

>>>>>>> branch 'main' of https://github.com/helly128/Project145.git

}