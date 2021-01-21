package com.pj.vegi.mypage.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.mypage.mapper.MypageMapper;
import com.pj.vegi.mypage.service.MypageService;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageMapper dao;

	@Override
	public MemberVo myPageSelect(MemberVo vo) throws SQLException {
		return dao.myPageSelect(vo);
	}

	@Override
	public int myPageUpdate(MemberVo vo) throws SQLException {
		return dao.myPageUpdate(vo);
	}

	@Override
	public List<RecipeVo> recipeSelect(RecipeVo vo) throws SQLException {
		return dao.recipeSelect(vo);
	}

	
//	@Override
//	public int recipeHitUpdate(RecipeVo vo) throws SQLException {
//		return dao.recipeHitUpdate(vo);
//	}

}
