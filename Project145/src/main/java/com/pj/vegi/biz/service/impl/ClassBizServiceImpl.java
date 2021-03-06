package com.pj.vegi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.biz.mapper.ClassBizMapper;
import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.enquiryVO;

@Service("classBizService")
public class ClassBizServiceImpl implements ClassBizService{
		
	@Autowired
	ClassBizMapper dao;
	
	@Override
	public List<LessonVO> classBizList(LessonVO vo) {
		return dao.classBizList(vo);
	}

	@Override
	public MemberVo classBizNum(MemberVo mvo) {
		// TODO Auto-generated method stub
		return dao.classBizNum(mvo);
	}

	@Override
	public int classBizInsert(LessonVO cvo) {
		int n = dao.classBizInsert(cvo);
		return n;
	}

	@Override
	public int myCareerUpdate(MemberVo vo) {
		// TODO Auto-generated method stub
		return dao.myCareerUpdate(vo);
	}

	@Override
	public List<MemberVo> getLecList(String bizNum) {
		return dao.getLecList(bizNum);
	}

	

	@Override
	public int classBizDelete(LessonVO vo) {
		dao.enqBizDelete(vo);
		return dao.classBizDelete(vo);
	}

	@Override
	public LessonVO classBizSelect(LessonVO cvo) {
		return dao.classBizSelect(cvo);
	}

	@Override
	public List<enquiryVO> classEnquiryList(enquiryVO vo) {
		return dao.classEnquiryList(vo);
	}
	
	@Override
	public List<enquiryVO> myEnquiryList(enquiryVO vo) {
		return dao.myEnquiryList(vo);
	}

	@Override
	public int classBizUpdate(LessonVO cvo) {
		// TODO Auto-generated method stub
		return dao.classBizUpdate(cvo);
	}

	@Override
	public int applyCollabo(enquiryVO enqvo) {
		
		return dao.applyCollabo(enqvo);
	}

	@Override
	public int applyCollabo(LessonVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int enqAccepted(enquiryVO evo) {
		
		return dao.enqAccepted(evo);
	}

	@Override
	public int enqRefused(enquiryVO evo) {
		dao.collaboRefused(evo);
		
		return dao.enqRefused(evo);
	}

	@Override
	public int lecIdUpdate(LessonVO cvo) {
		
		return dao.lecIdUpdate(cvo);		
	}

	@Override
	public int enqBizDelete(LessonVO cvo) {
		// TODO Auto-generated method stub
		return dao.enqBizDelete(cvo);
	}

}
