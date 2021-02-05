package com.pj.vegi.biz.mapper;

import java.util.List;

import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;



public interface ClassBizMapper {
	List<LessonVO> classBizList(LessonVO vo);
	LessonVO classBizSelect(LessonVO vo);
	int classBizInsert(LessonVO cvo);
	int classBizDelete(LessonVO vo);
	
	MemberVo classBizNum(MemberVo mvo);
	int myCareerUpdate(MemberVo vo);
	
	List<MemberVo> getLecList(String bizNum);
	
	int applyCollabo(LessonVO vo);
	
	


	

	
}
