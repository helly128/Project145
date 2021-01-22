package com.pj.vegi.biz.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.biz.service.RestaurantBizService;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class RestaurantController {

	@Autowired
	RestaurantBizService restBizService;

	@RequestMapping("/restBizList.do")
	public String restBizList(Model model, RestaurantVo vo, HttpSession session) {
		String mId = (String) session.getAttribute("mId");
		vo.setMId(mId);
		List<RestaurantVo> restList = restBizService.restBizList(vo);
		model.addAttribute("restList", restList);

		return "biz/restaurantList";
	}

	@RequestMapping("/restBizSelect.do")
	public String restBizSelect(Model model, RestaurantVo vo) {
		RestaurantVo restVo = restBizService.restBizSelect(vo);

		RestMenuVo menuVo = new RestMenuVo();
		menuVo.setRestId(restVo.getRestId());
		List<RestMenuVo> menuList = restBizService.restMenuList(menuVo);

		RestReservVo reservVo = new RestReservVo();
		reservVo.setRestId(restVo.getRestId());
		List<RestReservVo> reservList = restBizService.restReservList(reservVo);

		model.addAttribute("restVo", restVo);
		model.addAttribute("menuList", menuList);
		model.addAttribute("reservList", reservList);

		return "biz/restSelect";
	}

	@RequestMapping("/restBizDetail.do")
	public String restBizDetail(Model model, RestaurantVo vo) {
		RestaurantVo restVo = restBizService.restBizSelect(vo);

		RestMenuVo menuVo = new RestMenuVo();
		menuVo.setRestId(restVo.getRestId());
		List<RestMenuVo> menuList = restBizService.restMenuList(menuVo);

		RestReservVo reservVo = new RestReservVo();
		reservVo.setRestId(restVo.getRestId());
		List<RestReservVo> reservList = restBizService.restReservList(reservVo);

		model.addAttribute("restVo", restVo);
		model.addAttribute("menuList", menuList);
		model.addAttribute("reservList", reservList);

		return "biz/restUpdate";
	}
	
	@RequestMapping("restMenuDelete.do")
	public String restMenuDelete(Model model, RestMenuVo menuVo) {
		restBizService.restMenuDelete(menuVo);
		
		RestaurantVo restVo;
//		restVo.setRestId(menuVo.get);
		
		return "redirect:restBizSelect.do";
	}
	
	@RequestMapping("restBizUpdate.do")
	public String restBizUpdate(Model model, RestaurantVo restVo, ArrayList<RestMenuVo> list) {
		
		restBizService.restBizUpdate(restVo);
		
		restBizService.restMenuUpdate(list);
		
		model.addAttribute(restVo);
		model.addAttribute("menuList", list);
		
		return "redirect:restBizSelect.do";
	}
}
