package com.pj.vegi.vegimeet.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vegimeet.mapper.VegimeetMapper;
import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetDataVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.VegimeetVo;

@Service("vegimeetService")
public class VegimeetServiceImpl implements VegimeetService {
	
	@Autowired
	VegimeetMapper dao;
	
	@Override
	public List<VegimeetVo> vegimeetList(VegimeetVo vo) {
		return dao.vegimeetList(vo);
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

	@Override
	public List<Map> myMeetList(String mId) {
		return dao.myMeetList(mId);
	}
	
	@Override
	public Map myMeetOne(MeetParticipantVo vo) {
		return dao.myMeetOne(vo);
	}

	@Override
	public MeetParticipantVo meetpSelect(MeetParticipantVo vo) {
		return dao.meetpSelect(vo);
	}

	@Override
	public int uploadMeetDataPic(MeetDataVo vo) {
		return dao.uploadMeetDataPic(vo);
	}

	@Override
	public int meetPartiUpdate(MeetParticipantVo vo) {
		return dao.meetPartiUpdate(vo);
	}

	@Override
	public List<MeetDataVo> meetDataList(MeetDataVo vo) {
		return dao.meetDataList(vo);
	}

	@Override
	public List<VegimeetVo> ongoingMeetList() {
		return dao.ongoingMeetList();
	}

	@Override
	public int addFailCount(MeetParticipantVo vo) {
		return dao.addFailCount(vo);
	}

	@Override
	public int allFalseSet(MeetParticipantVo vo) {
		return dao.allFalseSet(vo);
	}

	@Override
	public List<VegimeetVo> endMeetSelect() {
		return dao.endMeetSelect();
	}

	@Override
	public int cashUpdate(MeetParticipantVo vo) {
		return dao.cashUpdate(vo);
	}

	@Override
	public int pointUpdate(MeetParticipantVo vo) {
		return dao.pointUpdate(vo);
	}

	@Override
	public int vegimeetInsert(VegimeetVo vo) {
		return dao.vegimeetInsert(vo);
	}

	@Override
	public int calcTotalDay() {
		return dao.calcTotalDay();
	}

	@Override
	public int countMeetList(VegimeetVo vo) {
		return dao.countMeetList(vo);
	}

	@Override
	public int vegimeetDelete(VegimeetVo vo) {
		return dao.vegimeetDelete(vo);
	}
}
