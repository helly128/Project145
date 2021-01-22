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
	
//	@Override
//	public List<RecipeMaterialVo> getMaterialList(RecipeMaterialVo vo) {
//		// TODO Auto-generated method stub
//		return dao.getMaterialList(vo);
//	}

	@Override
	public List<RecipeMaterialVo> recipeMaterialSelect(RecipeMaterialVo vo) {
		// TODO Auto-generated method stub
		return dao.recipeMaterialSelect(vo);
	}

//	@Override
//	public int RecipeMaterialInsert(RecipeMaterialVo vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int RecipeMaterialUpdate(RecipeMaterialVo vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public int RecipeMaterialDelete(RecipeMaterialVo vo) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

}
