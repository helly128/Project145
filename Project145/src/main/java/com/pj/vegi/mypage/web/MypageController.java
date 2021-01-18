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
}
