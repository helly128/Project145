package com.pj.vegi.mypage.mapper;

import java.util.List;

import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;

public interface MypageMapper {

	public MemberVo myPageSelect(MemberVo vo);
	public int myPageUpdate(MemberVo vo);
	
	public List<RecipeVo> recipeSelect(RecipeVo vo);
	//public int recipeHitUpdate(RecipeVo vo);
}
