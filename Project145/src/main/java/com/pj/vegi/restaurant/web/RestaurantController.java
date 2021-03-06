package com.pj.vegi.restaurant.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.common.Paging;
import com.pj.vegi.restaurant.service.RestaurantService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.RepleVo;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestReviewVo;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantService restaurantService;

	// 식당 메인 페이지
	@RequestMapping("/restaurant.do")
	public String restaurantMain(RestaurantVo vo, Model model, Paging paging, HttpSession session) throws SQLException {
		String mId = (String) session.getAttribute("mId");		
		vo.setMId(mId);
		
		paging.setPageUnit(8);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		
		int cnt = restaurantService.countRestaurantList(vo);
		paging.setTotalRecord(cnt);
		
		List<RestaurantVo> restaurants = restaurantService.getRestaurantList(vo);
		
		model.addAttribute("restaurants", restaurants);
		model.addAttribute("vo", vo);
		model.addAttribute("paging", paging);
		
		for (RestaurantVo Rvo : restaurants) {
			LikeListVo likeVo = new LikeListVo();
			likeVo.setMId(mId);
			likeVo.setOriginId(Rvo.getRestId());
			Rvo.setLikeFlag(restaurantService.restLikeFlagSelect(likeVo));
		}
		
		return "restaurant/restaurantList";
	}

	@RequestMapping("/restaurantForm.do")
	public String restaurantForm() {

		return "restaurant/restaurantInsert";
	}

	@ResponseBody
	// ajax 로 받아 올 때 @ResponseBody 필요
	@RequestMapping("/restNameSerchList.do")
	public List<RestaurantVo> restChek(@RequestParam String restName, RestaurantVo vo) {
		// 일반 사용자 식당등록 페이지에서 식당이름 검색

		System.out.println(restName + "식당이름");
		return restaurantService.restNameSerchList(restName);
	}

	@RequestMapping("/restInsert.do")
	public String restaurantInsert(RestaurantVo vo, RestMenuVo menuListVo, Model model, HttpSession session)
			throws SQLException {
		System.out.println(menuListVo);
		int n = restaurantService.restInsert(vo);
		if (n != 0) {
			List<RestMenuVo> menuList = menuListVo.getMenuVoList();
			for (RestMenuVo menuVo : menuList) {
				menuVo.setRestId(vo.getRestId());
				System.out.println(menuVo);
				restaurantService.menuInsert(menuVo);
			}
			model.addAttribute("result", "성공");
			return "redirect:/restaurant.do";
		} else {
			model.addAttribute("result", "실패");
			return "redirect:/restaurant.do";

		}

	}

	// 식당 한 건 상세페이지
	@RequestMapping("/restaurantDetail.do")
	public String restaurantDetail(RestaurantVo rVo, RestReviewVo rRVo, Paging paging, Model model, HttpSession session) {
		RestaurantVo restaurantVo = restaurantService.getRestaurantDetail(rVo);

		RestMenuVo mVo = new RestMenuVo();
		mVo.setRestId(restaurantVo.getRestId());
		List<RestMenuVo> menuList = restaurantService.getRestaurantMenu(mVo);
		
		paging.setPageUnit(10);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		rRVo.setStart(paging.getFirst());
		rRVo.setEnd(paging.getLast());
		
		int cnt = restaurantService.countRestReview(rRVo);
		paging.setTotalRecord(cnt);
		
		List<RestReviewVo> restReview = restaurantService.restReview(rRVo);

		model.addAttribute("rVo", restaurantVo);
		model.addAttribute("menuList", menuList);
		model.addAttribute("restReview", restReview );

		return "restaurant/restaurantImformation";
	}
	//식당 예약
	@RequestMapping("/reservInsert.do")
	public String reservInsert(RestReservVo vo, RestaurantVo rVo, Model model, HttpServletResponse response) throws IOException {
		Timestamp timeStamp = Timestamp.valueOf(vo.getReservDate().replace("T", " ") + ":00");
		Date reservDate = new Date(timeStamp.getTime());
		System.out.println(reservDate);
		vo.setRestReservDate(reservDate);
		int n = restaurantService.reservInsert(vo);
		int m = restaurantService.reservCountUp(rVo);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (n != 0 && m != 0) {

			out.println("<script>alert('예약대기 상태입니다. 마이페이지에서 예약을 확인해주세요.'); location.href='restaurant.do';</script>");
			out.flush();
			return null;
		} else {

			out.println("<script>alert('예약실패'); location.href='restaurant.do';</script>");
			out.flush();
			return null;
		}

	}

	// 좋아요
	@ResponseBody
	@RequestMapping("/restaurantLike.do/{restId}")
	public void restaurantLike(@PathVariable String restId, HttpSession session) {
		LikeListVo vo = new LikeListVo();
		vo.setMId((String) session.getAttribute("mId"));
		vo.setOriginId(restId);
		restaurantService.restLikeInsert(vo);
	}

	// 좋아요 취소
	@ResponseBody
	@RequestMapping("/restaurantUnlike.do/{restId}")
	public void restaurantUnlike(@PathVariable String restId, HttpSession session) {
		LikeListVo vo = new LikeListVo();
		vo.setMId((String) session.getAttribute("mId"));
		vo.setOriginId(restId);
		restaurantService.restLikeDelete(vo);
	}
	
	
	// 리뷰 등록
	@ResponseBody
	@RequestMapping("/restReviewInsert.do")
	public String restReviewInsert(RestReviewVo vo, Model model, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int n = restaurantService.restReviewInsert(vo);
		if (n != 0) {
			out.println("<script>alert('리뷰가 등록 되었습니다.'); location.href='restaurantDetail.do?restId=" + vo.getRestId() + "'; </script>");
			out.flush();
			return null;
		} else {
			out.println("<script>alert('리뷰가 등록되지 못했습니다.');  location.href='restaurantDetail.do?restId=" + vo.getRestId() + "'; </script>");
			out.flush();
			return null;
		}
		
		
	}

	// 리뷰 삭제
	@ResponseBody
	@RequestMapping("/restReviewDelete.do")
	public int restReviewDelete(RestReviewVo vo, Model model, HttpServletResponse response) throws IOException {
		System.out.println(vo + "받아옴");
		int n = restaurantService.restReviewDelete(vo);		
		return n;
	}
	
}
