package com.pj.vegi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.biz.mapper.ClassBizMapper;
import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.vo.LecturerVo;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;

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
	public int classLecturerInsert(LecturerVo lvo) {
		int n =dao.classLecturerInsert(lvo);
		return n;
	}

	@Override
	public LessonVO classBizSelect(LessonVO cvo) {
		// TODO Auto-generated method stub
		return dao.classBizSelect(cvo);
	}

	@Override
	public LecturerVo lecBizSelect(LecturerVo lvo) {
		// TODO Auto-generated method stub
		return dao.lecBizSelect(lvo);
	}

}
