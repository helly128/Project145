package com.pj.vegi.mypage.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.common.Paging;
import com.pj.vegi.mypage.service.MypageService;
import com.pj.vegi.vo.LessonReservVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;

	// 마이페이지 홈, 세션
	@RequestMapping("/mypage.do")
	public String mypage(MemberVo vo, Model model, HttpSession session) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		model.addAttribute("mid", mid);
		vo.setMId(mid);

		MemberVo member = mypageService.myPageSelect(vo);
		model.addAttribute("member", member);

		return "mypage/mypageMain";
	}

	@RequestMapping("/myBegiContact.do")
	public String myBegiContact() {

		return "mypage/myBegiContact";
	}

	@RequestMapping("/myBegiUntact.do")
	public String myBegiUntact() {

		return "mypage/myBegiUntact";
	}

	@RequestMapping("/myMeet.do")
	public String myMeet() {

		return "mypage/myMeet";
	}

	@RequestMapping("/myLikeMeet.do")
	public String myLikeMeet() {

		return "mypage/myLikeMeet";
	}

	@RequestMapping("/myLikeRecipe.do")
	public String myLikeRecipe() {

		return "mypage/myLikeRecipe";
	}

	@RequestMapping("/myLikeClass.do")
	public String myLikeClass() {

		return "mypage/myLikeClass";
	}

	@RequestMapping("/myRecipe.do")
	public String myRecipe(RecipeVo vo, Model model, HttpSession session) throws SQLException {

		vo.setMId((String) session.getAttribute("mId"));
		List<RecipeVo> recipes = mypageService.recipeSelect(vo);
		model.addAttribute("recipes", recipes);

		return "mypage/myRecipe";
	}

	@RequestMapping("/myClass.do")
	public String myClass(Model model, LessonReservVO vo, HttpSession session) throws SQLException {

		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);
		
		List<Map> classList = mypageService.lessonSelect(vo);
		model.addAttribute("list", classList);
		
		return "mypage/myClass";
	}

	// 회원정보수정
	@RequestMapping("/myPageEdit.do")
	public String myPageEdit(MemberVo vo, Model model) throws SQLException {

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
		
		// 페이징처리
				paging.setPageUnit(5); // 목록2개
				paging.setPageSize(5); // 페이징박스3개
				// 페이지번호 파라미터
				if (paging.getPage() == null) {
					paging.setPage(1);
				}
				// 시작/마지막 레코드 번호
				vo.setStart(paging.getFirst());
				vo.setEnd(paging.getLast());
				
				// 전체건수 카운트
				int cnt = mypageService.countRest(vo);
				paging.setTotalRecord(cnt);
		
		List<Map> reservList = mypageService.restSelect(vo);
		model.addAttribute("list", reservList);
		model.addAttribute("paging", paging);
		
		return "mypage/myRestaurant";
	}
	
	
}
