package com.pj.vegi.lesson.service;

import java.sql.SQLException;
import java.util.List;

import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;

public interface LessonService {

	List<LessonVO> lessonList(LessonVO vo) throws SQLException;

	LessonVO lessonSelectOne(LessonVO vo);

	int lessonHitUpdate(LessonVO vo);

	int countLessonMain(LessonVO vo);

	int likeFlagCount(LikeListVo vo);
	
	int likeInsert(LikeListVo vo);
	
	int likeDelete(LikeListVo vo);

}
