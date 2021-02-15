package com.pj.vegi.recipe.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.recipe.mapper.RecipeMapper;
import com.pj.vegi.recipe.service.RecipeService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;

@Service("recipeService")
public class RecipeServiceImpl implements RecipeService {

	@Autowired
	RecipeMapper dao;

	@Override
	public List<RecipeVo> getRecipeList(RecipeVo vo) {
		return dao.getRecipeList(vo);
	}

	@Override
	public RecipeVo recipeSelect(RecipeVo vo) {
		return dao.recipeSelect(vo);
	}

	@Override
	public int recipeInsert(RecipeVo vo) {
		return dao.recipeInsert(vo);
	}

	@Override
	public int recipeUpdate(RecipeVo vo) {
		return dao.recipeUpdate(vo);
	}

	@Override
	public int recipeDelete(RecipeVo vo) {
		return dao.recipeDelete(vo);
	}
	/*
	 * @Autowired private RecipeMapper dao;
	 */

	@Override
	public int recipeCount(RecipeVo vo) {

		return dao.recipeCount(vo);
	}

	@Override
	public List<LessonVO> searchlessonList(LessonVO lvo) {

		return dao.searchlessonList(lvo);
	}

	@Override
	public List<LessonVO> lessonSearch(LessonVO lVo) {
		return dao.lessonSearch(lVo);
	}

	@Override
	public int likeDelete(LikeListVo vo) {
		return dao.likeDelete(vo);
	}

	@Override
	public int likeInsert(LikeListVo vo) {
		return dao.likeInsert(vo);
	}

	@Override
	public int likeFlagSelect(LikeListVo vo) {
		return dao.likeFlagSelect(vo);
	}

	@Override
	public List<LessonVO> recipeLessonSearch(LessonVO lvo) {
		return dao.recipeLessonSearch(lvo);
	}

	@Override
	public LessonVO relatedClass(LessonVO vo) {
		return dao.relatedClass(vo);
	}

	@Override
	public int recipePointUpdate(MemberVo vo) {
		return dao.recipePointUpdate(vo);
	}

	@Override
	public int recipeWalletHistory(WalletHistoryVO vo) {
		return dao.recipeWalletHistory(vo);
	}

	@Override
	public int recipeInsertCount(MemberVo vo) {
		return dao.recipeInsertCount(vo);
	}
}
