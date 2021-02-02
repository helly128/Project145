package com.pj.vegi.lesson.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.common.Paging;
import com.pj.vegi.lesson.service.LessonService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;

@Controller
public class LessonController {

	@Autowired
	private LessonService lessonService;

	@RequestMapping("/lessonMain.do")
	public String lessonMain(@ModelAttribute("vo") LessonVO vo, Model model, Paging paging, HttpSession session)
			throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		paging.setPageUnit(8);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		int cnt = lessonService.countLessonMain(vo);
		paging.setTotalRecord(cnt);

		List<LessonVO> lessons = lessonService.lessonList(vo);
		for (LessonVO lesson_vo : lessons) {
			
			LikeListVo like_vo = new LikeListVo();
			like_vo.setMId(mid);
			like_vo.setOriginId(lesson_vo.getCId());
			
			lesson_vo.setLikeFlag(lessonService.likeFlagCount(like_vo));
			
		}

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

	@ResponseBody
	@RequestMapping("/lessonLike.do/{classId}")
	public void lessonLike(LikeListVo vo, @PathVariable String classId, HttpSession session) {
		
		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);
		
		vo.setOriginId(classId);
		lessonService.likeInsert(vo);
		
	}
	
	@ResponseBody
	@RequestMapping("/lessonUnLike.do/{classId}")
	public void lessonUnLike(LikeListVo vo, @PathVariable String classId, HttpSession session) {
		
		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);
		
		vo.setOriginId(classId);
		lessonService.likeDelete(vo);
		
	}
}
