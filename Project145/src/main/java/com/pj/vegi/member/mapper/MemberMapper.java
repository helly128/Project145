package com.pj.vegi.member.mapper;


import com.pj.vegi.vo.MemberVo;


public interface MemberMapper {

	MemberVo memberSelect(MemberVo vo);
	int memberInsert(MemberVo vo);

}
