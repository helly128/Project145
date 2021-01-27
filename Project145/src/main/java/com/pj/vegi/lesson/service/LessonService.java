package com.pj.vegi.lesson.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.LessonVO;

public interface LessonService {

	List<LessonVO> lessonList(LessonVO vo) throws SQLException;
	LessonVO lessonSelectOne(LessonVO vo);
	int lessonHitUpdate(LessonVO vo);
	
	
}
