package com.pj.vegi.lesson.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.lesson.mapper.LessonMapper;
import com.pj.vegi.lesson.service.LessonService;
import com.pj.vegi.vo.LessonVO;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {

	@Autowired
	private LessonMapper dao;

	@Override
	public List<LessonVO> lessonList(LessonVO vo) throws SQLException {
		return dao.lessonList(vo);
	}

	@Override
	public LessonVO lessonSelectOne(LessonVO vo) {
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
}
