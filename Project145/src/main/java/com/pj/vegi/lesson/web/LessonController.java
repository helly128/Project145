package com.pj.vegi.lesson.web;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pj.vegi.common.Paging;
import com.pj.vegi.lesson.service.LessonService;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vo.LessonReservVO;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.enquiryVO;

@Controller
public class LessonController {

	@Autowired
	private LessonService lessonService;
	@Autowired
	private MemberService memberService;

	@RequestMapping("/lessonMain.do")
	public String lessonMain(@ModelAttribute("vo") LessonVO vo, Model model, Paging paging, HttpSession session)
			throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		// 페이징 설정
		paging.setPageUnit(8);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		if (vo.getVegType() == null || vo.getVegType() == "") {
			vo.setVegType((String) session.getAttribute("vType"));
			List<LessonVO> lessons = lessonService.lessonList(vo);
			model.addAttribute("lessons", lessons);
		}

		List<LessonVO> lessons = lessonService.lessonList(vo);

		int cnt = lessonService.countLessonMain(vo);
		paging.setTotalRecord(cnt);

		for (LessonVO lesson_vo : lessons) {

			LikeListVo like_vo = new LikeListVo();
			like_vo.setMId(mid);
			like_vo.setOriginId(((LessonVO) lesson_vo).getCId());

			((LessonVO) lesson_vo).setLikeFlag(lessonService.likeFlagCount(like_vo));

		}

		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(date);
		try {
			date = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("today", date);

		model.addAttribute("paging", paging);

		model.addAttribute("lessons", lessons);

		return "lesson/lessonMain";
	}

	@RequestMapping("/lessonProduct.do")
	public String lessonProduct(LessonVO vo, Model model) {

		Map<String, Object> lesson = lessonService.lessonSelectOne(vo);
		List<Map> memberDetail = lessonService.lessonSelectMember(vo);
		model.addAttribute("lesson", lesson);
		model.addAttribute("mDetail", memberDetail);

		lessonService.lessonHitUpdate(vo);

		return "lesson/lessonDetail";
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

	@RequestMapping("/lessonEnq.do")
	public String lessonEnq(enquiryVO vo, HttpSession session) {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		lessonService.lessonEnqSubmit(vo);

		// 알림+1

		return "redirect:lessonProduct.do?cId=" + vo.getOriginId();
	}

	@RequestMapping("/lessonJoin.do")
	public String lessonJoin(Model model, HttpSession session, LessonVO l_vo, MemberVo m_vo) {

		String mid = (String) session.getAttribute("mId");
		m_vo.setMId(mid);
		try {
			m_vo = memberService.memberSelect(m_vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		Map<String, Object> lesson = lessonService.lessonSelectOne(l_vo);

		model.addAttribute("member", m_vo);
		model.addAttribute("lesson", lesson);

		return "lesson/lessonPayPage";
	}

	@RequestMapping("/payAfter.do")

	public String payAfter(Model model, HttpSession session, @RequestParam int totalPoint, LessonVO l_vo,
			LessonReservVO r_vo, MemberVo m_vo, WalletHistoryVO w_vo) {

		String mid = (String) session.getAttribute("mId");
		r_vo.setMId(mid);
		r_vo.setCId(l_vo.getCId());
		lessonService.lessonReservInsert(r_vo);

		lessonService.lessonJoinUpdate(l_vo);

		w_vo.setMId(mid);

		if (totalPoint != 0) {
			m_vo.setMId(mid);
			try {
				m_vo = memberService.memberSelect(m_vo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			int diff = 0;
			int point = m_vo.getWalletPoint(); // 기존 적립금
			int cash = m_vo.getWalletCash(); // 기존 충전금
			if (point >= totalPoint) {
				m_vo.setWalletPoint(point - totalPoint); // 적립금 사용한만큼 차감
				w_vo.setWalletMoney(totalPoint);
				w_vo.setWalletType("적립금사용");
				lessonService.pointHistoryInsert(w_vo); // 사용한 적립금 내역 wallet_history에 추가
			} else {
				diff = totalPoint - point;
				m_vo.setWalletPoint(0);
				m_vo.setWalletCash(cash - diff); // 사용한만큼 충전금 차감
			}
			lessonService.pointDeduct(m_vo); // 적립금, 충전금 차감 쿼리 실행

			if (diff != 0) { // 보유한 적립금 이상 사용 시 적립금 내역 wallet_history에 추가
				if (point != 0) {
					w_vo.setWalletMoney(point);
					w_vo.setWalletType("적립금사용");
					lessonService.pointHistoryInsert(w_vo);
				}
				w_vo.setWalletMoney(diff);
				w_vo.setWalletType("충전금사용");
				lessonService.pointHistoryInsert(w_vo);
			}
		}

		return "redirect:lessonProduct.do?cId=" + l_vo.getCId();
	}

}
