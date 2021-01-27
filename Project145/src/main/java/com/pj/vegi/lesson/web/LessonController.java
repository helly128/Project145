package com.pj.vegi.lesson.web;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.lesson.service.LessonService;
import com.pj.vegi.vo.LessonVO;

@Controller
public class LessonController {

	@Autowired
	private LessonService lessonService;

	@RequestMapping("/lessonMain.do")
	public String lessonMain(LessonVO vo, Model model) throws SQLException {

		List<LessonVO> lessons = lessonService.lessonList(vo);
		model.addAttribute("lessons", lessons);

		return "lesson/lessonMain";
	}

	@RequestMapping("/lessonProduct.do")
	public String lessonProduct(LessonVO vo, Model model) {

		LessonVO lesson = lessonService.lessonSelectOne(vo);
		model.addAttribute("lesson", lesson);
		
		lessonService.lessonHitUpdate(vo);

		return "lesson/lessonProduct";
	}
}
