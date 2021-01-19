package com.pj.vegi.member.service;

import java.sql.SQLException;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.NaverVo;

public interface MemberService {

//	public MemberVO getEmp(memberVO memberVO);
//	public List<MemberVO> getMemberList(MemberVO memberVO);
//	public void memberInsert(MemberVO memberVO);
//	MemberVo memberSelect(MemberVo vo) throws SQLException;
	boolean memberLoginCheck(MemberVo vo) throws SQLException;	// 멤버 로그인 체크
	
}
