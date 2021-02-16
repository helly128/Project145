package com.pj.vegi.reple.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pj.vegi.reple.mapper.RepleMapper;
import com.pj.vegi.reple.service.RepleService;
import com.pj.vegi.reple.web.Criteria;
import com.pj.vegi.vo.RepleVo;


@Service
public class RepleServiceImpl implements RepleService{

	@Autowired
	private RepleMapper dao;
	
	@Override
	public int insert(RepleVo vo) {
		System.out.println("댓글 등록"+ vo);
		return dao.insert(vo);
	}

	@Override
	public RepleVo read(int reId) {
		System.out.println("댓글 단건 조회"+ reId);
		return dao.read(reId);
	}


	@Override
	public int update(RepleVo vo) {
		System.out.println("댓글 수정"+ vo);
		return dao.update(vo);
	}

	@Override
	public int delete(RepleVo vo) {
		System.out.println("댓글 삭제"+ vo);
		return dao.delete(vo);
	}

	@Override
	public List<RepleVo> readAll(RepleVo vo) {
		System.out.println("댓글 전체 조회"+vo);
		return dao.readAll(vo);
	}

	@Override
	public List<RepleVo> getList(Criteria cri, int rId) {
		System.out.println("get reple list of a recipe");
		return dao.getListWithPaging(cri, rId);
	}

	@Override
	public int repleInsert(RepleVo vo) {
		System.out.println("대댓글 입력"+ vo);
		return dao.repleInsert(vo);
	}

	@Override
	public int countReple(RepleVo vo) {
		return dao.countReple(vo);
	}


}
