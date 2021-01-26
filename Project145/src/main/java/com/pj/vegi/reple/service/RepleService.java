package com.pj.vegi.reple.service;

import java.util.List;

import com.pj.vegi.reple.web.Criteria;
import com.pj.vegi.vo.RepleVo;

public interface RepleService {

	public List<RepleVo> readAll(RepleVo vo);//전체 조회
	
	public RepleVo read(int reId);//단건조회
	
	public int insert (RepleVo vo);

	public int delete(RepleVo vo);

	public int update(RepleVo vo);
	
	public List<RepleVo>getList(Criteria cri, int r_id);


}
