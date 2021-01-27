package com.pj.vegi.recipe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.recipe.mapper.RecipeMapper;
import com.pj.vegi.recipe.service.RecipeService;
import com.pj.vegi.vo.RecipeVo;

@Service("recipeService")
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	RecipeMapper dao;
	
	@Override
	public List<RecipeVo> getRecipeList(RecipeVo vo) {
		// TODO Auto-generated method stub
		return dao.getRecipeList(vo);
	}

	@Override
	public RecipeVo recipeSelect(RecipeVo vo) {
		// TODO Auto-generated method stub
		return dao.recipeSelect(vo);
	}

//	@Override
//	public int recipeInsert(RecipeVo vo) {
//		// TODO Auto-generated method stub
//		return dao.recipeInsert(vo);
//	}
//
//	@Override
//	public int recipeUpdate(RecipeVo vo) {
//		// TODO Auto-generated method stub
//		return dao.recipeUpdate(vo);
//	}
//
//	@Override
//	public int recipeDelete(RecipeVo vo) {
//		// TODO Auto-generated method stub
//		return dao.recipeDelete(vo);
//	}
	/*
	 * @Autowired private RecipeMapper dao;
	 */
}
