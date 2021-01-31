package com.pj.vegi.vegimeet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vegimeet.mapper.VegimeetMapper;
import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
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

	@Override
	public VegimeetVo vegimeetSelect(VegimeetVo vo) {
		return dao.vegimeetSelect(vo);
	}

	@Override
	public List<MeetParticipantVo> meetPartiList(VegimeetVo vo) {
		return dao.meetPartiList(vo);
	}

	@Override
	public int meetPartiInsert(MeetParticipantVo vo) {
		return dao.meetPartiInsert(vo);
	}
	
	@Override
	public int pointDeduct(MemberVo vo) {
		return dao.pointDeduct(vo);
	}

	@Override
	public int meetUpdate(MeetParticipantVo vo) {
		return dao.meetUpdate(vo);
	}

	@Override
	public int pointHistoryInsert(WalletHistoryVO vo) {
		return dao.pointHistoryInsert(vo);
	}
}
