package com.pj.vegi.lesson.mapper;

import java.util.List;
import java.util.Map;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vo.LessonReservVO;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.enquiryVO;

public interface LessonMapper {

	public List<LessonVO> lessonList(LessonVO vo);

	public Map<String, Object> lessonSelectOne(LessonVO vo);
	public List<Map> lessonSelectMember(LessonVO vo);

	public int lessonHitUpdate(LessonVO vo);

	public int countLessonMain(LessonVO vo);
	
	public int likeFlagCount(LikeListVo vo);
	
	public int likeInsert(LikeListVo vo);
	
	public int likeDelete(LikeListVo vo);
	
	public int lessonEnqSubmit(enquiryVO vo);

	public int lessonReservInsert(LessonReservVO vo);
	
	public int lessonJoinUpdate(LessonVO vo);
	
	public int pointHistoryInsert(WalletHistoryVO vo);
	
	public int pointDeduct(MemberVo vo);
}
