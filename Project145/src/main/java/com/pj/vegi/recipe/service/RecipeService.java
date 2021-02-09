package com.pj.vegi.recipe.service;

import java.util.List;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.RecipeVo;

public interface RecipeService {

	public List<RecipeVo>getRecipeList(RecipeVo vo);
	public RecipeVo recipeSelect(RecipeVo vo);
	public int recipeCount(RecipeVo vo);
	public int recipeInsert(RecipeVo vo);
	public int recipeUpdate(RecipeVo vo);
	public int recipeDelete(RecipeVo vo);
	
	public List<LessonVO>searchlessonList(LessonVO lvo);
	public List<LessonVO> lessonSearch(LessonVO lVo);
	public List<LessonVO> recipeLessonSearch(LessonVO lvo);
	int likeInsert(LikeListVo vo);
	int likeDelete(LikeListVo vo);
	int likeFlagSelect(LikeListVo vo);
}
