package com.pj.vegi.restaurant.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@ResponseBody
	// ajax 로 받아 올 때
	@RequestMapping("/restNameSerchList.do")
	public List<RestaurantVo> restChek(@RequestParam String restName, RestaurantVo vo) {
		//일반 사용자 식당등록 페이지에서 식당이름 검색
		
		System.out.println(restName+"식당이름");
		return restaurantService.restNameSerchList(restName);
	}
	
	@RequestMapping("/restInsert.do")
	public String restaurantInsert(RestaurantVo vo, Model model, HttpSession session) throws SQLException {

		int n = restaurantService.restInsert(vo);
		if (n != 0)
		
		
		return "redirect:restaurantList";
		return null;
	}

}
