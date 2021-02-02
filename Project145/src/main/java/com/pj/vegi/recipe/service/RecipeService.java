package com.pj.vegi.recipe.service;

import java.util.List;
import java.util.Map;

import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.RecipeVo;

public interface RecipeService {

	public List<RecipeVo>getRecipeList(RecipeVo vo);
	public RecipeVo recipeSelect(RecipeVo vo);
	public int recipeCount(RecipeVo vo);
//	public int recipeInsert(RecipeVo vo);
	public int recipeUpdate(RecipeVo vo);
	public int recipeDelete(RecipeVo vo);
	
	public List<LessonVO>searchlessonList(LessonVO lvo);
	public List<LessonVO> lessonSearch(Map<String,Object>map);
}
