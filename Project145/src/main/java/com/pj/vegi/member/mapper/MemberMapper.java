package com.pj.vegi.member.mapper;


import java.util.HashMap;

import com.pj.vegi.vo.MemberVo;


public interface MemberMapper {

	MemberVo memberSelect(MemberVo vo);
	int memberInsert(MemberVo vo);
	int idDuplCheck(String data);

}
