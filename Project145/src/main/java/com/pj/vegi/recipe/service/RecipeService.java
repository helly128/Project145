package com.pj.vegi.recipe.service;

import java.util.List;

import com.pj.vegi.vo.RecipeVo;

public interface RecipeService {

	public List<RecipeVo>getRecipeList(RecipeVo vo);
	public RecipeVo recipeSelect(RecipeVo vo);
//	public int recipeInsert(RecipeVo vo);
//	public int recipeUpdate(RecipeVo vo);
//	public int recipeDelete(RecipeVo vo);
}
