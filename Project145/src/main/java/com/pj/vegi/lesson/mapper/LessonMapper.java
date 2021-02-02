package com.pj.vegi.lesson.mapper;

import java.util.List;

import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;

public interface LessonMapper {

	public List<LessonVO> lessonList(LessonVO vo);

	public LessonVO lessonSelectOne(LessonVO vo);

	public int lessonHitUpdate(LessonVO vo);

	public int countLessonMain(LessonVO vo);
	
	public int likeFlagCount(LikeListVo vo);
	
	public int likeInsert(LikeListVo vo);
	
	public int likeDelete(LikeListVo vo);

}
