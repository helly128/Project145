package com.pj.vegi.recipeMaterial.service;

import java.util.List;

import com.pj.vegi.vo.RecipeMaterialVo;

public interface RecipeMaterialService {

	public List<RecipeMaterialVo>getMaterialList(RecipeMaterialVo vo);
	public List<RecipeMaterialVo> recipeMaterialSelect(RecipeMaterialVo rmVo);
//	public int RecipeMaterialInsert(RecipeMaterialVo vo);
	public RecipeMaterialVo recipeMaterialUpdate(RecipeMaterialVo vo);
//	public int RecipeMaterialDelete(RecipeMaterialVo vo);
}
