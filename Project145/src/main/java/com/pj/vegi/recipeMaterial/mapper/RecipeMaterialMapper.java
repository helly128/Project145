package com.pj.vegi.recipeMaterial.mapper;

import java.util.List;

import com.pj.vegi.vo.RecipeMaterialVo;

public interface RecipeMaterialMapper {

	List<RecipeMaterialVo>getMaterialList(RecipeMaterialVo vo);
	List<RecipeMaterialVo> recipeMaterialSelect(RecipeMaterialVo vo);
	int recipeMaterialInsert(RecipeMaterialVo vo);
	int recipeMaterialUpdate(RecipeMaterialVo vo);
	int recipeMaterialDelete(RecipeMaterialVo vo);
}
