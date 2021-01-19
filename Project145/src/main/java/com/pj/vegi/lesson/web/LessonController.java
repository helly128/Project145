package com.pj.vegi.lesson.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LessonController {
	
	@RequestMapping("/lessonMain.do")
	public String lessonMain() {
		
		return "lesson/lessonMain";
	}
	
	@RequestMapping("/lessonProduct.do")
	public String lessonProduct() {
		
		return "lesson/lessonProduct";
	}
}
