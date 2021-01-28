package com.pj.vegi.vegimeet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.vegimeet.mapper.VegimeetMapper;
import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.VegimeetVo;

@Service("vegimeetService")
public class VegimeetServiceImpl implements VegimeetService {
	
	@Autowired
	VegimeetMapper dao;
	
	@Override
	public List<VegimeetVo> vegimeetList() {
		return dao.vegimeetList();
	}

	@Override
	public int getDday(VegimeetVo vo) {
		return dao.getDday(vo);
	}

	@Override
	public int likeInsert(LikeListVo vo) {
		return dao.likeInsert(vo);
	}

	@Override
	public int likeDelete(LikeListVo vo) {
		return dao.likeDelete(vo);
	}

	@Override
	public int likeFlagSelect(LikeListVo vo) {
		return dao.likeFlagSelect(vo);
	}

}
