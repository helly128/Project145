package com.pj.vegi.mypage.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypage.do")
	public String mypage() {

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
}
