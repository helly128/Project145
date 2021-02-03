package com.pj.vegi.biz.mapper;

import java.util.List;

import com.pj.vegi.vo.LecturerVo;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;



public interface ClassBizMapper {
	List<LessonVO> classBizList(LessonVO vo);
	LessonVO classBizSelect(LessonVO vo);
	MemberVo classBizNum(MemberVo mvo);
	int classBizInsert(LessonVO cvo);
	int classLecturerInsert(LecturerVo lvo);
	LecturerVo lecBizSelect(LecturerVo lvo);
	int myCareerUpdate(MemberVo vo);
	List<MemberVo> getLecList(String bizNum);
	


	

	
}
