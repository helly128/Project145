package com.pj.vegi.biz.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.vo.LecturerVo;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;
@Controller
public class ClassBizController {

	@Autowired
	ClassBizService classBizService;
	
	@RequestMapping("/classBizList.do")
	public String classBizList(Model model, HttpSession session, LessonVO vo){
		System.out.println("리스트 찾아오기");
		String mId = (String) session.getAttribute("mId");
		System.out.println(mId);
		vo.setMId(mId);
		List<LessonVO> classList = classBizService.classBizList(vo);
		model.addAttribute("classList",classList);
		
		return "biz/classList";
	}
	
	@RequestMapping("/classRegForm.do")
	public String classRegForm() {
		System.out.println("클래스 등록폼");
	
		return "biz/classRegForm";	
		
	}
	
	@RequestMapping("/classBizInsert.do") 
	public String classBizInsert(Model model, 
			HttpSession session, LessonVO cvo, 
			MemberVo mvo, LecturerVo lvo ) {
		
		System.out.println("클래스를 생성한다.");
		System.out.println(cvo +"클래스");
//		System.out.println(lvo + "강사" );
//		System.out.println(mvo + "멤버");
		
		System.out.println("강사를 생성한다.");
		
		
		return null;
	}
}