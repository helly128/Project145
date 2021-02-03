package com.pj.vegi.lesson.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;

public interface LessonService {

	List<Map> lessonList(LessonVO vo) throws SQLException;

	Map<String, Object> lessonSelectOne(LessonVO vo);
	List<Map> lessonSelectMember(LessonVO vo);

	int lessonHitUpdate(LessonVO vo);

	int countLessonMain(LessonVO vo);

	int likeFlagCount(LikeListVo vo);
	
	int likeInsert(LikeListVo vo);
	
	int likeDelete(LikeListVo vo);

}
