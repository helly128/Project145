package com.pj.vegi.biz.service;

import java.util.List;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.enquiryVO;

public interface ClassBizService {

	List<LessonVO> classBizList(LessonVO vo);

	MemberVo classBizNum(MemberVo mvo);

	int classBizInsert(LessonVO cvo);

	int myCareerUpdate(MemberVo vo);

	List<MemberVo> getLecList(String bizNum);

	int applyCollabo(LessonVO vo);

	int classBizDelete(LessonVO vo);

	LessonVO classBizSelect(LessonVO cvo);

	List<enquiryVO> classEnquiryList(enquiryVO vo);
	
	List<enquiryVO> myEnquiryList(enquiryVO vo);

}
