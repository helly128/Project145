package com.pj.vegi.member.web;

import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService; // MemberServiceImpl 객체 자동주입 -> @Service("memberService")와 같은이름

	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm() {

		return "login/loginForm";
	}

	@RequestMapping("/loginResult.do")
	public String loginResult(MemberVo vo, Model model, HttpSession session) throws SQLException {
		String viewPath = null;
		boolean check = memberService.memberLoginCheck(vo);

		session.setAttribute("mId", vo.getMId());
		String mId = (String) session.getAttribute("mId");
		model.addAttribute("mId", mId);

		if (check == true) {
			viewPath = "redirect:/main.do";

		} else {
			viewPath = "login/loginFail";
		}

		return viewPath;
	}

	@RequestMapping("/logout.do")
	public String logout(MemberVo vo, Model model, HttpSession session) throws SQLException {
		session.invalidate();
		return "redirect:/";

	}
}

