package com.pj.vegi.crawling.mapper;

import java.util.ArrayList;

import com.pj.vegi.vo.RecipeMaterialVo;
import com.pj.vegi.vo.RecipeVo;

public interface CrawlingMapper {
	public int insertRecipe(RecipeVo vo);
	public int insertMaterial(RecipeMaterialVo mlist);
}
