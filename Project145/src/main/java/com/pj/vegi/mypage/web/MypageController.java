package com.pj.vegi.mypage.web;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.mypage.service.MypageService;
import com.pj.vegi.vo.MemberVo;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;

	// 마이페이지 홈, 세션
	@RequestMapping("/mypage.do")
	public String mypage(MemberVo vo, Model model, HttpSession session) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		model.addAttribute("mid", mid);

		vo.setMId(mid);
		MemberVo member = mypageService.myPageSelect(vo);
		model.addAttribute("member", member);

		return "mypage/mypageMain";
	}

	@RequestMapping("/myBegiContact.do")
	public String myBegiContact() {

		return "mypage/myBegiContact";
	}

	@RequestMapping("/myBegiUntact.do")
	public String myBegiUntact() {

		return "mypage/myBegiUntact";
	}

	@RequestMapping("/myMeet.do")
	public String myMeet() {

		return "mypage/myMeet";
	}

	@RequestMapping("/myLikeMeet.do")
	public String myLikeMeet() {

		return "mypage/myLikeMeet";
	}

	@RequestMapping("/myLikeRecipe.do")
	public String myLikeRecipe() {

		return "mypage/myLikeRecipe";
	}

	@RequestMapping("/myLikeClass.do")
	public String myLikeClass() {

		return "mypage/myLikeClass";
	}

	@RequestMapping("/myRecipe.do")
	public String myRecipe() {
		
		return "mypage/myRecipe";
	}

	@RequestMapping("/myClass.do")
	public String myClass() {

		return "mypage/myClass";
	}

	// 회원정보수정
	@RequestMapping("/myPageEdit.do")
	public String myPageEdit(MemberVo vo, Model model) throws SQLException {

		MemberVo member = mypageService.myPageSelect(vo);
		model.addAttribute("member", member);

		return "mypage/myPageEdit";
	}

	@RequestMapping("/myPageEditResult.do")
	public String myPageEditResult(MemberVo vo, Model model, HttpSession session) throws SQLException {

		vo.setMId((String) session.getAttribute("mId"));
		mypageService.myPageUpdate(vo);

		return "redirect:mypage.do";
	}

	@RequestMapping("/myWallet.do")
	public String myWallet() {

		return "mypage/myWallet";
	}
}
