package com.pj.vegi.member.service;

import java.sql.SQLException;
<<<<<<< HEAD
import java.util.List;
import java.util.Map;

import com.pj.vegi.vo.LessonVO;
=======
>>>>>>> branch 'main' of https://github.com/helly128/Project145.git
import com.pj.vegi.vo.MemberVo;
<<<<<<< HEAD
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestaurantVo;
import com.pj.vegi.vo.SnsInfoVo;
import com.pj.vegi.vo.VegimeetVo;
=======
>>>>>>> branch 'main' of https://github.com/helly128/Project145.git

public interface MemberService {

//	public List<MemberVO> getMemberList(MemberVO memberVO);
//	public void memberInsert(MemberVO memberVO);
	MemberVo memberSelect(MemberVo vo) throws SQLException;
	boolean memberLoginCheck(MemberVo vo) throws SQLException;	// 멤버 로그인 체크
	boolean naverLoginCheck(MemberVo vo);	
	int memberInsert(MemberVo vo) throws SQLException;
	int naverInsert(MemberVo vo);
	
	int idDuplCheck(String data) throws SQLException; //아이디 중복 체크
	
	MemberVo idSearch(MemberVo vo);//아이디찾기
	MemberVo pwSearch(MemberVo vo);	//비밀번호 찾기
	public int updatePw(MemberVo pw) throws Exception; //새로운 비밀번호로 업데이트
	//public void sendEmail(MemberVo vo, String div) throws Exception; //이메일 보내는 메소드로 연결 
	public void naverMailSend(MemberVo vo) throws Exception;
	
	
	
	List<Map> mainLesson (LessonVO vo);
	List<Map> mainMeet (VegimeetVo vo);
	List<Map> mainRest(RestaurantVo vo);
	List<Map> mainRecipe(RecipeVo vo);

}