package com.pj.vegi.mypage.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.mypage.mapper.MypageMapper;
import com.pj.vegi.mypage.service.MypageService;
import com.pj.vegi.vo.LessonReservVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;
import com.pj.vegi.vo.VegimeetVo;

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

	@Override
	public List<Map> restSelect(RestReservVo vo) throws SQLException {
		return dao.restSelect(vo);
	}

	@Override
	public List<Map> lessonSelect(LessonReservVO vo) throws SQLException {
		return dao.lessonSelect(vo);
	}

	@Override
	public int countRest(RestReservVo vo) {
		return dao.countRest(vo);
	}

	@Override
	public int countRecipe(RecipeVo vo) {
		return dao.countRecipe(vo);
	}

	@Override
	public int countLesson(LessonReservVO vo) {
		return dao.countLesson(vo);
	}

	@Override
	public List<Map> meetLikeList(LikeListVo vo) {
		return dao.meetLikeList(vo);
	}

	@Override
	public List<Map> lessonLikeList(LikeListVo vo) {
		return dao.lessonLikeList(vo);
	}

	@Override
	public List<Map> recipeLikeList(LikeListVo vo) {
		return dao.recipeLikeList(vo);
	}

	@Override
	public List<Map> restLikeList(LikeListVo vo) {
		return dao.restLikeList(vo);
	}

	@Override
	public int heartCancel(LikeListVo vo) {
		return dao.heartCancel(vo);
	}
	
	@Override
	public List<Map> meetSelect(MeetParticipantVo vo) {
		return dao.meetSelect(vo);
	}

	@Override
	public List<Map> myCreateMeet(VegimeetVo vo) {
		return dao.myCreateMeet(vo);
	}

	@Override
	public int countUntact(MeetParticipantVo vo) {
		return dao.countUntact(vo);
	}

	@Override
	public int countCreateMeet(VegimeetVo vo) {
		return dao.countCreateMeet(vo);
	}


//	@Override
//	public int recipeHitUpdate(RecipeVo vo) throws SQLException {
//		return dao.recipeHitUpdate(vo);
//	}

}
