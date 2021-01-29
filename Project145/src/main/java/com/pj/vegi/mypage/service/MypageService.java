package com.pj.vegi.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.pj.vegi.vo.LessonReservVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

public interface MypageService {

	MemberVo myPageSelect(MemberVo vo) throws SQLException;
	int myPageUpdate(MemberVo vo) throws SQLException;
	
	List<RecipeVo> recipeSelect(RecipeVo vo) throws SQLException;
	//int recipeHitUpdate(RecipeVo vo) throws SQLException;
	
	List<Map> restSelect(RestReservVo vo) throws SQLException;
	
	List<Map> lessonSelect(LessonReservVO vo) throws SQLException;
	
	int countRest(RestReservVo vo);
}
