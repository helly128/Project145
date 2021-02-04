package com.pj.vegi.lesson.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.lesson.mapper.LessonMapper;
import com.pj.vegi.lesson.service.LessonService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.enquiryVO;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {

	@Autowired
	private LessonMapper dao;

	@Override
	public List<LessonVO> lessonList(LessonVO vo) throws SQLException {
		return dao.lessonList(vo);
	}

	@Override
	public Map<String, Object> lessonSelectOne(LessonVO vo) {
		return dao.lessonSelectOne(vo);
	}

	@Override
	public int lessonHitUpdate(LessonVO vo) {
		return dao.lessonHitUpdate(vo);
	}

	@Override
	public int countLessonMain(LessonVO vo) {
		return dao.countLessonMain(vo);
	}

	@Override
	public int likeFlagCount(LikeListVo vo) {
		return dao.likeFlagCount(vo);
	}

	@Override
	public int likeInsert(LikeListVo vo) {
		return dao.likeInsert(vo);
	}

	@Override
	public int likeDelete(LikeListVo vo) {
		return dao.likeDelete(vo);
	}

	@Override
	public List<Map> lessonSelectMember(LessonVO vo) {
		return dao.lessonSelectMember(vo);
	}

	@Override
	public int lessonEnqSubmit(enquiryVO vo) {
		return dao.lessonEnqSubmit(vo);
	}
}
