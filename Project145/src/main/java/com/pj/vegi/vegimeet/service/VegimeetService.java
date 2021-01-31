package com.pj.vegi.vegimeet.service;

import java.util.List;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.VegimeetVo;

public interface VegimeetService {
	List<VegimeetVo> vegimeetList();
	int getDday(VegimeetVo vo);
	int likeInsert(LikeListVo vo);
	int likeDelete(LikeListVo vo);
	int likeFlagSelect(LikeListVo vo);
	VegimeetVo vegimeetSelect(VegimeetVo vo);
	List<MeetParticipantVo> meetPartiList(VegimeetVo vo);
	int meetPartiInsert(MeetParticipantVo vo);
	int meetUpdate(MeetParticipantVo vo);
	int pointDeduct(MemberVo vo);
	int pointHistoryInsert(WalletHistoryVO vo);
}
