package com.pj.vegi.mypage.mapper;

import java.util.List;
import java.util.Map;

import com.pj.vegi.vo.LessonReservVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

public interface MypageMapper {

	public MemberVo myPageSelect(MemberVo vo);

	public int myPageUpdate(MemberVo vo);

	public List<RecipeVo> recipeSelect(RecipeVo vo);
	public int countRecipe(RecipeVo vo);

	// public int recipeHitUpdate(RecipeVo vo);
	
	public List<Map> restSelect(RestReservVo vo);
	public int countRest(RestReservVo vo);

	public List<Map> lessonSelect(LessonReservVO vo);
	public int countLesson(LessonReservVO vo);

	public List<Map> meetLikeList(LikeListVo vo);

	public List<Map> lessonLikeList(LikeListVo vo);
	public int heartCancel(LikeListVo vo);

	public List<Map> recipeLikeList(LikeListVo vo);
	
	public List<Map> restLikeList(LikeListVo vo);
}
