package com.pj.vegi.recipe.mapper;

import java.util.List;

import com.pj.vegi.vo.RecipeVo;

public interface RecipeMapper {

	RecipeVo recipeSelect(RecipeVo recipeVo);
	List<RecipeVo> recipeSelectList(RecipeVo recipeVo);
	
	int recipeInsert(RecipeVo recipeVo);
	int recipeUpdate(RecipeVo recipeVo);
	int recipeDelete(RecipeVo recipeVo);
}
