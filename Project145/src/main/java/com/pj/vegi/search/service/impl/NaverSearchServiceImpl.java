package com.pj.vegi.search.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.search.mapper.NaverSearchMapper;
import com.pj.vegi.search.service.NaverSearchService;
import com.pj.vegi.vo.RecipeMaterialVo;

@Service
public class NaverSearchServiceImpl implements NaverSearchService {

	@Autowired
	NaverSearchMapper dao;
	
	@Override
	public List<RecipeMaterialVo> getMaterialList(RecipeMaterialVo vo) {
		// TODO Auto-generated method stub
		return dao.getMaterialList(vo);
	}

//	@Override
//	public RecipeVo recipeMaterialSelect(RecipeVo vo) {
//		// TODO Auto-generated method stub
//		return dao.recipeMaterialSelect(vo);
//	}
//	

}
