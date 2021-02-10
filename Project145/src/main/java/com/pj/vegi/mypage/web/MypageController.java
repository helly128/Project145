package com.pj.vegi.mypage.web;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.common.Paging;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.mypage.service.MypageService;
import com.pj.vegi.vo.LessonReservVO;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.VegimeetVo;
import com.pj.vegi.vo.enquiryVO;

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ClassBizService classBizService;
	
	@RequestMapping("/mypage.do")
	public String mypage(MemberVo vo, Model model, HttpSession session) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		model.addAttribute("mid", mid);
		vo.setMId(mid);

		MemberVo member = mypageService.myPageSelect(vo);
		model.addAttribute("member", member);

		return "mypage/mypageMain";
	}

//	@RequestMapping("/myBegiContact.do")
//	public String myBegiContact() {
//
//		return "mypage/myBegiContact";
//	}

	@RequestMapping("/myBegiUntact.do")
	public String myBegiUntact(Model model, HttpSession session, MeetParticipantVo vo, Paging paging) {

		String mid = (String) session.getAttribute("mId");
		model.addAttribute("mid", mid);
		vo.setMId(mid);

		// 페이징 설정
		paging.setPageUnit(8);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		int cnt = mypageService.countUntact(vo);
		paging.setTotalRecord(cnt);

		List<Map> list = mypageService.meetSelect(vo);

		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(date);
		try {
			date = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("today", date);

		model.addAttribute("list", list);

		return "mypage/myBegiUntact";
	}

	@RequestMapping("/myMeet.do")
	public String myMeet(Model model, HttpSession session, VegimeetVo vo, Paging paging) {

		String mid = (String) session.getAttribute("mId");
		model.addAttribute("mid", mid);
		vo.setMId(mid);

		// 페이징 설정
		paging.setPageUnit(8);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		int cnt = mypageService.countCreateMeet(vo);
		paging.setTotalRecord(cnt);

		List<Map> list = mypageService.myCreateMeet(vo);

		model.addAttribute("list", list);

		return "mypage/myMeet";
	}

	@RequestMapping("/myLikeMeet.do")
	public String myLikeMeet(Model model, LikeListVo vo, HttpSession session) {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		List<Map> likeList = mypageService.meetLikeList(vo);

		model.addAttribute("list", likeList);

		return "mypage/myLikeMeet";
	}

	@RequestMapping("/myLikeRecipe.do")
	public String myLikeRecipe(Model model, LikeListVo vo, HttpSession session) {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		List<Map> likeList = mypageService.recipeLikeList(vo);

		model.addAttribute("list", likeList);

		return "mypage/myLikeRecipe";
	}

	@RequestMapping("/myLikeClass.do")
	public String myLikeClass(Model model, LikeListVo vo, LessonVO lesson_vo, HttpSession session) {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		List<Map> likeList = mypageService.lessonLikeList(vo);

		model.addAttribute("list", likeList);

		return "mypage/myLikeClass";

	}

	@ResponseBody
	@RequestMapping("/HeartCancel.do/{originId}")
	public void HeartCancel(Model model, LikeListVo vo, @PathVariable String originId, HttpSession session) {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		vo.setOriginId(originId);

		mypageService.heartCancel(vo);

	}

	@RequestMapping("/myLikeRestaurant.do")
	public String myLikeRestaurant(Model model, LikeListVo vo, HttpSession session) {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		List<Map> likeList = mypageService.restLikeList(vo);
		model.addAttribute("list", likeList);

		return "mypage/myLikeRestaurant";
	}

	@RequestMapping("/myRecipe.do")
	public String myRecipe(RecipeVo vo, Model model, HttpSession session, Paging paging) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		paging.setPageUnit(8);
		paging.setPageSize(5);

		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		int cnt = mypageService.countRecipe(vo);
		paging.setTotalRecord(cnt);

		List<RecipeVo> recipes = mypageService.recipeSelect(vo);
		model.addAttribute("recipes", recipes);
		model.addAttribute("paging", paging);

		return "mypage/myRecipe";
	}

	@RequestMapping("/myClass.do")
	public String myClass(Model model, LessonReservVO vo, HttpSession session, Paging paging) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		paging.setPageUnit(8);
		paging.setPageSize(5);

		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		int cnt = mypageService.countLesson(vo);
		paging.setTotalRecord(cnt);

		List<Map> classList = mypageService.lessonSelect(vo);
		model.addAttribute("list", classList);
		model.addAttribute("paging", paging);

		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String time = format.format(date);
		try {
			date = format.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("today", date);

		return "mypage/myClass";
	}

	@RequestMapping("/myPageEditCheck.do")
	public String myPageEditCheck(MemberVo vo, Model model, HttpSession session) {

		return "mypage/myPageEditCheck";
	}

	@ResponseBody
	@RequestMapping("/EditCheck.do")
	public String EditCheck(Model model, HttpSession session, MemberVo vo) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		boolean check = memberService.memberLoginCheck(vo);
		String result = null;

		if (check == true) {
			result = "true";
		} else {
			result = "false";
		}

		System.out.println("result값" + result);

		return result;
	}

	// 회원정보수정
	@RequestMapping("/myPageEdit.do")
	public String myPageEdit(MemberVo vo, Model model, HttpSession session) throws SQLException {

		vo.setMId((String) session.getAttribute("mId"));
		MemberVo member = mypageService.myPageSelect(vo);
		model.addAttribute("member", member);

		return "mypage/myPageEdit";
	}

	@RequestMapping("/myPageEditResult.do")
	public String myPageEditResult(MemberVo vo, Model model, HttpSession session) throws SQLException {

		vo.setMId((String) session.getAttribute("mId"));
		mypageService.myPageUpdate(vo);

		return "redirect:mypage.do";
	}

	@RequestMapping("/myWalletCheck.do")
	public String myWalletCheck(MemberVo vo, Model model, HttpSession session) {

		return "mypage/myWalletCheck";
	}

	@RequestMapping("/myWallet.do")
	public String myWallet(MemberVo vo, Model model, HttpSession session) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		MemberVo member = mypageService.myPageSelect(vo);
		model.addAttribute("member", member);

		return "mypage/myWallet";
	}

	@RequestMapping("/myRestaurant.do")
	public String myRestaurant(Paging paging, RestReservVo vo, Model model, HttpSession session) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);

		paging.setPageUnit(5);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		int cnt = mypageService.countRest(vo);
		paging.setTotalRecord(cnt);

		List<Map> reservList = mypageService.restSelect(vo);
		model.addAttribute("list", reservList);
		model.addAttribute("paging", paging);

		return "mypage/myRestaurant";
	}

	@RequestMapping("/myQuestion.do")
	public String myQuestion(Model model, HttpSession session, enquiryVO vo) {

		String mId = (String) session.getAttribute("mId");
		System.out.println("받은 목록 리스트 찾아오기");
		vo.setMId(mId);
		List<enquiryVO> cEnqList = classBizService.classEnquiryList(vo);
		model.addAttribute("cEnqList", cEnqList);

		List<enquiryVO> myEnqList = classBizService.myEnquiryList(vo);
		model.addAttribute("myEnqList", myEnqList);

		return "mypage/myQuestionList";
	}

}
