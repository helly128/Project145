package com.pj.vegi.member.web;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.member.service.BizNumHomeTax;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.vo.MemberVo;

@Controller
public class MemberControllerCJ {
	@Autowired
	MemberService memberService;

	@RequestMapping("/memberRegister.do")
	public String memberRegister() {

		return "login/memberRegister";
	}

	@RequestMapping("/userRegister.do")
	public String userRegister() {

		return "login/userRegister";
	}

	@PostMapping("/memberInsert.do")
	public String memberInsert(MemberVo vo, Model model) throws SQLException {
		String viewPath = null;
		int n = memberService.memberInsert(vo);
		if (n != 0)
			viewPath = "redirect:loginForm.do"; // 매핑메소드를 호출할때
		else
			viewPath = "login/loginFail"; // jsp페이지를 호출할때
		return viewPath;
	}

	@RequestMapping("/bizRegister.do")
	public String bizRegister() {

		return "login/bizRegister";
	}

	@RequestMapping("/bizNumber.do")
	public String bizNumber() {

		return "login/bizNumber";
	}

	@RequestMapping("/bizNumCheck.do")
	@ResponseBody
	public String bizNum(@RequestParam String data) {
		data = BizNumHomeTax.checkBiz(data);
		return data;
	}

//	    //등록폼
//	    @RequestMapping("insertFormEmp")
//	    public String insertFormEmp(EmpVO vo) {
//	        return "emp/insertEmp";
//	    }
//
//	    //등록처리
//	    @RequestMapping("insertEmp")
//	    public String insertEmp(EmpVO vo) {
//	    	memberService.empInsert(vo);
//	        return "redirect:empList";
//	    }
//	    
//	    //목록조회 
//	    @RequestMapping("empList")
//	    public String empList(Model model) {
//	        model.addAttribute("empList", memberService.getEmpList(null));
//	        return "emp/empList";
//	    }
}
