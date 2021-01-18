package com.pj.vegi.biz.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.biz.service.RestaurantBizService;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantBizService restBizService;
	
	@RequestMapping("/restBizList.do")
	public String restBizList(Model model, RestaurantVo vo) {
		List<RestaurantVo> restList = restBizService.restBizList(vo);
		model.addAttribute("restList", restList);
		
		return "biz/restaurantList.jsp";
	}
}
