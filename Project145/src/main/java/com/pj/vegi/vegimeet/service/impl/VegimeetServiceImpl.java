package com.pj.vegi.vegimeet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.vegimeet.mapper.VegimeetMapper;
import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.VegimeetVo;

@Service("vegimeetService")
public class VegimeetServiceImpl implements VegimeetService {
	
	@Autowired
	VegimeetMapper dao;
	
	@Override
	public List<VegimeetVo> vegimeetList() {
		return dao.vegimeetList();
	}

}
