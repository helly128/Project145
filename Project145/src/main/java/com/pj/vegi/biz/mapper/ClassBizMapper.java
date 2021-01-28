package com.pj.vegi.biz.mapper;

import java.util.List;

import com.pj.vegi.vo.LessonVO;



public interface ClassBizMapper {
	List<LessonVO> classBizList(LessonVO vo);
	LessonVO classBizSelect(LessonVO vo);

	int restBizInsert(LessonVO vo);
	int restBizUpdate(LessonVO vo);
	int restBizDelete(LessonVO vo);
	int getCount(LessonVO vo);
	
	

	
}
