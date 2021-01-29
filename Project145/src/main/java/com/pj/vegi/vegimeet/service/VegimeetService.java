package com.pj.vegi.vegimeet.service;

import java.util.List;

import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.VegimeetVo;

public interface VegimeetService {
	List<VegimeetVo> vegimeetList();
	int getDday(VegimeetVo vo);
	int likeInsert(LikeListVo vo);
	int likeDelete(LikeListVo vo);
	int likeFlagSelect(LikeListVo vo);
	VegimeetVo vegimeetSelect(VegimeetVo vo);
	MeetParticipantVo meetPartiList(VegimeetVo vo);
}
