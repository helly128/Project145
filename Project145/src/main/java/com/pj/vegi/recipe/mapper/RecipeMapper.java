package com.pj.vegi.recipe.mapper;

import java.util.List;

import com.pj.vegi.vo.RecipeVo;

public interface RecipeMapper {

	List<RecipeVo>getRecipeList(RecipeVo vo);//레시피 전체 조회
	
	  RecipeVo recipeSelect(RecipeVo vo);//한 건 조회 
	 // int recipeInsert(RecipeVo  vo);//추가 
	  //int recipeUpdate(RecipeVo vo);//수정 
	  //int recipeDelete(RecipeVo vo);//삭제
	}
