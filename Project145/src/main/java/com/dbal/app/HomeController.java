package com.dbal.app;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		model.addAttribute("serverTime", new Date());

		return "home";
	}

	@RequestMapping("/ajaxTest.do")
	public @ResponseBody List<String> test() {
		List<String> list = new ArrayList<String>();
		list.add("홍길동");
		list.add("이순신");
		list.add("을지문덕");
		return list;
	}

	@RequestMapping("/getChartData.do")
	@ResponseBody
	public List<Map<String, String>> getChartData() {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", "인사");
		map.put("cnt", "5");
		list.add(map);
		map = new HashMap<String, String>();
		map.put("name", "총무");
		map.put("cnt", "10");
		list.add(map);
		map = new HashMap<String, String>();
		map.put("name", "기획");
		map.put("cnt", "20");
		list.add(map);
		return list;
	}
}
