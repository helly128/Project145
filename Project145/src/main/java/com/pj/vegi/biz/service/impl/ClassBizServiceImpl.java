package com.pj.vegi.biz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.biz.mapper.ClassBizMapper;
import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.vo.LessonVO;

@Service("classBizService")
public class ClassBizServiceImpl implements ClassBizService{
		
	@Autowired
	ClassBizMapper dao;
	
	@Override
	public List<LessonVO> classBizList(LessonVO vo) {
		
		return dao.classBizList(vo);
	}

}
