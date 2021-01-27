package com.pj.vegi.restaurant.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.restaurant.service.RestaurantService;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class RestaurantController {
	
	@Autowired
	RestaurantService restaurantService;
	
	@RequestMapping("/restaurant.do")
	public String restaurantMain(Model model, RestaurantVo vo) {
		List<RestaurantVo> restaurants = restaurantService.getRestaurantList(vo);
		System.out.println(restaurants);
		model.addAttribute("restaurants", restaurants);
		return "restaurant/restaurantList";
	}
	
	@RequestMapping("/restaurantForm.do")
	public String restaurantForm() {
		
		return "restaurant/restaurantInsert";
	}
	
	@RequestMapping("/restInsert.do")
	public String restaurantInsert(RestaurantVo vo, Model model, HttpSession session) throws SQLException {
		
		String view = null;
		int n = restaurantService.restInsert(vo);
//		if (n != 0)
//			view = "restaurant/restaurantList";
//		else
//			view = "restaurant/restaurantList";
		
		return view;
	}

}
