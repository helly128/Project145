package com.pj.vegi.biz.service;

import java.util.List;

import com.pj.vegi.vo.LecturerVo;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;

public interface ClassBizService {

	List<LessonVO> classBizList(LessonVO vo);

	MemberVo classBizNum(MemberVo mvo);

	int classBizInsert(LessonVO cvo);

	int classLecturerInsert(LecturerVo lvo);

	LessonVO classBizSelect(LessonVO cvo);

	LecturerVo lecBizSelect(LecturerVo lvo);

	int myCareerUpdate(MemberVo vo);

	List<MemberVo> getLecList(String bizNum);

	int applyCollabo(LessonVO vo);

}
