package com.pj.vegi.recipe.mapper;

import java.util.List;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.RecipeVo;

public interface RecipeMapper {

	List<RecipeVo> getRecipeList(RecipeVo vo);// 레시피 전체 조회

	int recipeCount(RecipeVo vo);// 갯수 카운트

	RecipeVo recipeSelect(RecipeVo vo);// 한 건 조회
	int recipeInsert(RecipeVo vo);//추가

	int recipeUpdate(RecipeVo vo);// 수정

	int recipeDelete(RecipeVo vo);// 삭제
	
	List<LessonVO> searchlessonList(LessonVO lvo);//클래스 전체 조회
	
	List<LessonVO> lessonSearch(LessonVO lVo);//클래스 검색

	List<LessonVO> recipeLessonSearch(LessonVO lvo);//레시피수정클래스검색
	Object recipeUnlike(LikeListVo vo);

	int likeInsert(LikeListVo vo);
	int likeDelete(LikeListVo vo);
	int likeFlagSelect(LikeListVo vo);
}
