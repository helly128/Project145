package com.pj.vegi.recipeMaterial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.recipeMaterial.mapper.RecipeMaterialMapper;
import com.pj.vegi.recipeMaterial.service.RecipeMaterialService;
import com.pj.vegi.vo.RecipeMaterialVo;

@Service("recipeMaterialService")
public class RecipeMaterialServiceImpl implements RecipeMaterialService{

	@Autowired
	RecipeMaterialMapper dao;
	
	@Override
	public List<RecipeMaterialVo> getMaterialList(RecipeMaterialVo vo) {
		return dao.getMaterialList(vo);
	}

	@Override
	public List<RecipeMaterialVo> recipeMaterialSelect(RecipeMaterialVo vo) {
		return dao.recipeMaterialSelect(vo);
	}

	@Override
	public int recipeMaterialInsert(RecipeMaterialVo vo) {
		return dao.recipeMaterialInsert(vo);
	}

	@Override
	public int recipeMaterialUpdate(RecipeMaterialVo vo) {
		return dao.recipeMaterialUpdate(vo);
	}

	@Override
	public int recipeMaterialDelete(RecipeMaterialVo vo) {
		return dao.recipeMaterialDelete(vo);
	}

}
