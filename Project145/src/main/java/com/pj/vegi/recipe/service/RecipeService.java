package com.pj.vegi.recipe.service;

import java.util.List;

import com.pj.vegi.vo.RecipeVo;

public interface RecipeService {

	public List<RecipeVo> getRecipeList(RecipeVo recipeVo);
	RecipeVo recipeSelect(RecipeVo recipeVo);
	public RecipeVo getRecipe(RecipeVo recipeVo);
	
	public int recipeInsert(RecipeVo recipeVo) ;
	public int recipeUpdate(RecipeVo recipeVo) ;
	public int recipeDelete(RecipeVo recipeVo) ;
}
