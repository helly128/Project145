package com.pj.vegi.member.mapper;

import java.sql.SQLException;

import com.pj.vegi.vo.MemberVo;


public interface MemberMapper {

	MemberVo memberSelect(MemberVo vo);

	boolean memberLoginCheck(MemberVo vo) throws SQLException;
}
