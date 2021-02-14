package com.pj.vegi.vegimeet.mapper;

import java.util.List;
import java.util.Map;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetDataVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.ReportVo;
import com.pj.vegi.vo.VegimeetVo;
import com.pj.vegi.vo.enquiryVO;

public interface VegimeetMapper {
	List<VegimeetVo> vegimeetList(VegimeetVo vo);
	int getDday(VegimeetVo vo);
	List<Map> myMeetList(String mId);
	Map myMeetOne(MeetParticipantVo vo);
	int countMeetList(VegimeetVo vo);	//페이징
	
	int likeInsert(LikeListVo vo);
	int likeDelete(LikeListVo vo);
	int likeFlagSelect(LikeListVo vo);
	VegimeetVo vegimeetSelect(VegimeetVo vo);
	List<MeetParticipantVo> meetPartiList(VegimeetVo vo);
	
	//결제
	int meetPartiInsert(MeetParticipantVo vo);
	int meetUpdate(MeetParticipantVo vo);
	int pointDeduct(MemberVo vo);
	int pointHistoryInsert(WalletHistoryVO vo);
	
	//사진 업로드
	MeetParticipantVo meetpSelect(MeetParticipantVo vo);
	int uploadMeetDataPic(MeetDataVo vo);
	int meetPartiUpdate(MeetParticipantVo vo);
	
	//다른 참가자의 사진 목록
	List<MeetDataVo> meetDataList(MeetDataVo vo);
	
	//자정 후 인증샷 미업로드시 fail+1 
	List<VegimeetVo> ongoingMeetList();
	int addFailCount(MeetParticipantVo vo);
	int allFalseSet(MeetParticipantVo vo);
	
	//보상금 처리
	List<VegimeetVo> endMeetSelect();
	int cashUpdate(MeetParticipantVo vo);
	int pointUpdate(MeetParticipantVo vo);
	
	//새 베지밋 생성
	int vegimeetInsert(VegimeetVo vo);
	int calcTotalDay();
	
	//베지밋 삭제
	int vegimeetDelete(VegimeetVo vo);
	
	//참가자 사진 신고
	int reportImage(ReportVo vo);
	
	//베지밋 문의하기
	int enquiryVegimeet(enquiryVO vo);
}
