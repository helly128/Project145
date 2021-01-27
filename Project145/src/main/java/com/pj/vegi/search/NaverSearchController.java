package com.pj.vegi.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.pj.vegi.search.service.NaverSearchService;

@Controller
public class NaverSearchController {

	@Autowired
	NaverSearchService service;
	
}
