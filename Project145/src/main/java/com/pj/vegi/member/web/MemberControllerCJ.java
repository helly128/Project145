package com.pj.vegi.member.web;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	
	@RequestMapping("/memberRegister.do")//회원가입 
	public String memberRegister() {
		return "login/memberRegister";
	}

	@RequestMapping("/userRegister.do") //일반회원가입 
	public String userRegister() {
		return "login/userRegister";
	}
	
	@RequestMapping("/idDuplCheck.do" ) //아이디 중복 체크 
	@ResponseBody
	public int idDuplCheck(@RequestParam String data, Model model) throws SQLException {
		int result = 0;
		System.out.println(data +"가 db에 등록되어 있는지 찾는 중");
		int n = memberService.idDuplCheck(data);
		System.out.println(n +"개가 검색됨");
		model.addAttribute("result", "사용가능");
		if(n == 0) {
			System.out.println("사용가능");
			 result=0;
			
		}
		else {
			System.out.println("이미 사용중임 사용불가");
			result=1;
			
		}
		return result;
	}

	@PostMapping("/memberInsert.do") // 일반 회원 등록 
	public String memberInsert(@RequestParam String mName,@RequestParam String vegtype, MemberVo vo, Model model) throws SQLException {
		System.out.println(mName+vegtype);
		String viewPath = null;
		// 비건타입 눌일 값주기 
		if(vegtype=="") {
			System.out.println("눌이구만!");
			vo.setVegtype("비건");
		} 
		
		int n = memberService.memberInsert(vo);
		if (n != 0)
			viewPath = "redirect:loginForm.do"; // 매핑메소드를 호출할때
		else
			viewPath = "login/loginFail"; // jsp페이지를 호출할때
		return viewPath;
	}

	@RequestMapping("/bizNumber.do") // 사업자 회원 등록 
	public String bizNumber(RestaurantVo vo, Model model, HttpSession session) throws SQLException {
		
		return "login/bizNumber";
	}
	


	@RequestMapping("/bizNumCheck.do") //사업자 번호 불러오기 
	@ResponseBody
	public HashMap<String, String> bizNum(@RequestParam String data) {
		data = data.replaceAll("-","");
		System.out.println(data +"하이픈빼고");
		HashMap<String,String> map=biznonet.checkBiz(data);
		map.get("bizname");
		map.get("bizaddress");
		String bizNum=map.get("bizNum");
//		if(bizNum!="") {bizNum ="번호없음";
//		}else if(bizNum==data) {
//			bizNum = "같은 번호";
//		}else{
//			bizNum = "다른 번호";
//		}
		map.put("bizNum", bizNum); //번호보여주기 
		map.get("bizNum");
		return map;
	}

	@RequestMapping("/idSearch.do")
	@ResponseBody
	public MemberVo idSearch( 
			@RequestParam(value="email") String email,
			@RequestParam(value="mName") String mName,
			MemberVo vo){
		System.out.println(email+mName);//성공 
		vo.setMName(mName);
		vo.setEmail(email);
		
		return memberService.idSearch(vo);
	}
	
	
	
	@Autowired
	RestaurantService restaurantService;
	
	@RequestMapping("/bizCheck.do") //식당리스트 찾기 
	@ResponseBody
	public List<RestaurantVo> bizCheckList(@RequestParam String restName,Model model) throws SQLException {
			System.out.println(restName);
		
			return restaurantService.bizCheckList(restName);
	}
	
	
	//새식당 생성, biz num받아와서 멤버 회원가입할때 넣기.
	@RequestMapping(value="/bizRegister.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bizRegister(@RequestParam("bizNum") String bizNum,RestaurantVo vo, Model model, HttpSession session) throws SQLException {
		System.out.println(bizNum +"새식당 입니다");
		String viewPath = null;
		model.addAttribute("bizNum", bizNum);
		model.addAttribute("auth", "rbiz");
		System.out.println(vo.getBizNum() +"보 결과입니당.");
		
		int n = restaurantService.restInsertNull(vo);
		if (n != 0)

			viewPath = "login/bizRegister"; // 매핑메소드를 호출할때
			 
			return viewPath;
	}
	
	
	//내식당 정보 식당에 biz Num 업데이트, biz num받아와서 멤버 회원가입할때 넣기.
	@RequestMapping(value="/bizInfoUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bizInfoUpdate(@RequestParam("bizNum") String bizNum,RestaurantVo vo, Model model, HttpSession session) throws SQLException {
		//비즈넘 받아온당. 스트링우로 ? 
		System.out.println(bizNum +" 식당 사업자 입니다");
		String viewPath = null;
		model.addAttribute("bizNum", bizNum);
		model.addAttribute("auth", "rbiz");
		System.out.println(vo.getBizNum() +"식당 사업자 보 결과입니당.");
		
		int n = restaurantService.bizInfoUpdate(vo);
		if (n != 0)
			viewPath = "login/bizRegister"; // 매핑메소드를 호출할때
			return viewPath;
	}

	//클래스 사업자 등록 페이지
		@RequestMapping(value="/classRegister.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String classRegister(@RequestParam("bizNum") String bizNum,RestaurantVo vo, Model model, HttpSession session) throws SQLException {
			System.out.println(bizNum +"클래스 사업자 입니다");
			model.addAttribute("bizNum", bizNum);
			model.addAttribute("auth", "cbiz");
			System.out.println(vo.getBizNum() +"보 결과입니당.");	 
			return "login/bizRegister";
		}

		@RequestMapping("/searchIDPW.do")//회원가입 
		public String searchIDPW() {
			return "login/searchIDPW";
		}

		


//@RequestMapping("/bizRestEdit.do")
//@ResponseBody
//public int restUpdate(@RequestParam String restId,Model model, RestaurantVo vo) throws SQLException{
//	System.out.println(restId +"받아옴");
//	vo.setRestId(restId);
//	int n = restaurantService.restaurantEdit(vo);
//	return n;
//
//}





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
