package com.pj.vegi.lesson.mapper;

import java.util.List;

import com.pj.vegi.vo.LessonVO;

public interface LessonMapper {
	
	public List<LessonVO> lessonList(LessonVO vo);
	public LessonVO lessonSelectOne(LessonVO vo);
	public int lessonHitUpdate(LessonVO vo);

}
