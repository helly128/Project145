package com.pj.vegi.search.mapper;

import java.util.List;

import com.pj.vegi.vo.RecipeMaterialVo;

public interface NaverSearchMapper {

	List<RecipeMaterialVo> getMaterialList(RecipeMaterialVo vo);// 한 레시피의 재료 전체 조회

//	RecipeVo recipeMaterialSelect(RecipeVo vo); // 재료 한 건 조회

}
