package com.pj.vegi.lesson.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.lesson.service.LessonService;

@Controller
public class LessonController {
	
	@Autowired
	private LessonService lessonService;
	
	@RequestMapping("/lessonMain.do")
	public String lessonMain() {
		//vo, medel 객체
		//서비스에 lessonList()가져와서 vo에담아 addattr
		return "lesson/lessonMain";
	}
	
	@RequestMapping("/lessonProduct.do")
	public String lessonProduct() {
		
		return "lesson/lessonProduct";
	}
}
