package com.pj.vegi.member.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.member.service.biznonet;
import com.pj.vegi.restaurant.service.RestaurantService;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RestaurantVo;




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
	
	public String bizNumber(RestaurantVo vo, Model model, HttpSession session) throws SQLException {

		return "login/bizNumber";
	}
	


	@RequestMapping("/bizNumCheck.do")
	@ResponseBody
	public HashMap<String, String> bizNum(@RequestParam String data) {

		HashMap<String,String> map=biznonet.checkBiz(data);
		map.get("bizname");
		map.get("bizaddress");
		return map;
	}

	
	
	
	@Autowired
	RestaurantService restaurantService;
	
	@RequestMapping("/bizCheck.do")
	@ResponseBody
	public List<RestaurantVo> bizCheckList(@RequestParam String restName,Model model) throws SQLException {
			System.out.println(restName);
		
			return restaurantService.bizCheckList(restName);
	}
	
	
	@RequestMapping("/bizRestEdit.do")
	@ResponseBody
	public int restUpdate(@RequestParam String restId,Model model, RestaurantVo vo) throws SQLException{
		System.out.println(restId +"받아옴");
		vo.setRestId(restId);
		int n = restaurantService.restaurantEdit(vo);
		return n;
	
	}
	
	
	
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

