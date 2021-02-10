package com.pj.vegi.member.mapper;


import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.SnsInfoVo;


public interface MemberMapper {

	MemberVo memberSelect(MemberVo vo);
	int memberInsert(MemberVo vo);
	int idDuplCheck(String data);
	MemberVo idSearch(MemberVo vo);
	MemberVo pwSearch(MemberVo vo);
	int updatePw(MemberVo vo);
	
	int naverInsert(SnsInfoVo svo);
	

}
