package com.pj.vegi.biz.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.vo.LessonVO;
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
}