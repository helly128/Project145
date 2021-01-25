package com.pj.vegi.restaurant.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.restaurant.service.RestaurantService;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class RestaurantController {
	
	@Autowired
	RestaurantService restaurantService;
	
	@RequestMapping("/restaurant.do")
	public String restaurantMain(Model model, RestaurantVo vo) {
		List<RestaurantVo> restaurants = restaurantService.getRestaurnat(vo);
		model.addAttribute("restaurants", restaurants);
		return "restaurant/restaurantList";
	}

}
