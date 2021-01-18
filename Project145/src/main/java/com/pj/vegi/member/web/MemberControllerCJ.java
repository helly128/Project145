package com.pj.vegi.member.web;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberControllerCJ {
//	  @Autowired
//	    MemberService memberService;
	    
	  @RequestMapping("/login.do")
		public String login() {
					
			return "login/login";
		}
	  
	  @RequestMapping("/memberRegister.do")
		public String memberRegister() {
					
			return "login/memberRegister";
		}
	  
	  @RequestMapping("/userRegister.do")
			public String userRegister() {
						
				return "login/userRegister";
			}
	  
	  @RequestMapping("/bizRegister.do")
			public String bizRegister() {
						
				return "login/bizRegister";
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
