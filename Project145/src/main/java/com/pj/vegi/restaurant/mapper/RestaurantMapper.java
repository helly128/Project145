package com.pj.vegi.restaurant.mapper;


import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestReviewVo;
import com.pj.vegi.vo.RestaurantVo;


public interface RestaurantMapper {

	RestaurantVo restaurantSelect(RestaurantVo vo);
	int restInsert(RestaurantVo vo); //일반 유저 식당등록 
	int menuInsert(RestMenuVo vo); //일반 유저 식당등록(에 따른 메뉴등록)
	int restaurantUpdate(RestaurantVo vo); 
	int restaurantDelete(RestaurantVo vo);
	
	int restInsertNull(RestaurantVo vo);
	public List<RestaurantVo> bizCheckList(String restName);
	int bizInfoUpdate(RestaurantVo vo);
	
	List<RestaurantVo>getRestaurantList(RestaurantVo vo) throws SQLException; //식당메인에 목록 불러오기
	int countRestaurantList(RestaurantVo vo); //식당 메인 페이징
	List<RestaurantVo>restNameSerchList(String restName); //식당등록페이지에서 식당이름 검색 
	
	RestaurantVo getRestaurantDetail(RestaurantVo vo); //식당 상세 페이지
	List<RestMenuVo> getRestaurantMenu(RestMenuVo vo); //식당 메뉴 리스트
	
	int reservInsert(RestReservVo vo); //  식당 예약하기
	
	int restLikeInsert(LikeListVo vo); //좋아요 누름
	int restLikeDelete(LikeListVo vo); //좋아요 취소 
	int restLikeFlagSelect(LikeListVo vo); //좋아요 여부 확인용
	
<<<<<<< HEAD
	List<RestReviewVo> restReview(RestReviewVo vo); //식당 리뷰
	int countRestReview (RestReviewVo vo); //삭당 리뷰 카운트
	
=======
	int reservCountUp(RestaurantVo vo);	//식당 테이블의 예약 카운트 증가
>>>>>>> branch 'main' of https://github.com/helly128/Project145.git
}
