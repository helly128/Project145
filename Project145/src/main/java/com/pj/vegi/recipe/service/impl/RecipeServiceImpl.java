package com.pj.vegi.recipe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.pj.vegi.recipe.mapper.RecipeMapper;
import com.pj.vegi.recipe.service.RecipeService;
import com.pj.vegi.vo.RecipeVo;

public class RecipeServiceImpl implements RecipeService {

	@Autowired
	private RecipeMapper dao;
	
	@Override
	public List<RecipeVo> getRecipeList(RecipeVo recipeVo) {
		// TODO Auto-generated method stub
		return dao.recipeSelectList(recipeVo);
	}

	@Override
	public RecipeVo getRecipe(RecipeVo recipeVo) {
		// TODO Auto-generated method stub
		return dao.recipeSelect(recipeVo);
	}

	@Override
	public int recipeInsert(RecipeVo recipeVo) {
		// TODO Auto-generated method stub
		return dao.recipeInsert(recipeVo);
	}

	@Override
	public RecipeVo recipeSelect(RecipeVo recipeVo) {
		// TODO Auto-generated method stub
		return dao.recipeSelect(recipeVo);
	}

	@Override
	public int recipeUpdate(RecipeVo recipeVo) {
		// TODO Auto-generated method stub
		return dao.recipeUpdate(recipeVo);
	}

	@Override
	public int recipeDelete(RecipeVo recipeVo) {
		// TODO Auto-generated method stub
		return dao.recipeDelete(recipeVo);
	}

}
