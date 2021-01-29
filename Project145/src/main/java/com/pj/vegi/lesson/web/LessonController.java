package com.pj.vegi.lesson.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.common.Paging;
import com.pj.vegi.lesson.service.LessonService;
import com.pj.vegi.vo.LessonVO;

@Controller
public class LessonController {

	@Autowired
	private LessonService lessonService;

	@RequestMapping("/lessonMain.do")
	public String lessonMain(LessonVO vo, Model model, Paging paging, HttpSession session) throws SQLException {
		
		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);
		
		paging.setPageUnit(4);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		
		int cnt = lessonService.countLessonMain(vo);
		paging.setTotalRecord(cnt);
		
		List<LessonVO> lessons = lessonService.lessonList(vo);
		model.addAttribute("lessons", lessons);
		model.addAttribute("paging", paging);
		
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
