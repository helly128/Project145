package com.pj.vegi.mypage.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;

public interface MypageService {

	MemberVo myPageSelect(MemberVo vo) throws SQLException;
	int myPageUpdate(MemberVo vo) throws SQLException;
	
	List<RecipeVo> recipeSelect(RecipeVo vo) throws SQLException;
	//int recipeHitUpdate(RecipeVo vo) throws SQLException;
}
