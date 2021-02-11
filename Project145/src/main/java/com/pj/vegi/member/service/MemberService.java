package com.pj.vegi.member.service;

import java.sql.SQLException;


import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.SnsInfoVo;

public interface MemberService {

//	public List<MemberVO> getMemberList(MemberVO memberVO);
//	public void memberInsert(MemberVO memberVO);
	MemberVo memberSelect(MemberVo vo) throws SQLException;
	boolean memberLoginCheck(MemberVo vo) throws SQLException;	// 멤버 로그인 체크
	int memberInsert(MemberVo vo) throws SQLException;
	int naverInsert(MemberVo vo);
	
	int idDuplCheck(String data) throws SQLException; //아이디 중복 체크
	
	MemberVo idSearch(MemberVo vo);//아이디찾기
	MemberVo pwSearch(MemberVo vo);	//비밀번호 찾기
	public int updatePw(MemberVo pw) throws Exception; //새로운 비밀번호로 업데이트
	//public void sendEmail(MemberVo vo, String div) throws Exception; //이메일 보내는 메소드로 연결 
	public void naverMailSend(MemberVo vo) throws Exception;	
	

}