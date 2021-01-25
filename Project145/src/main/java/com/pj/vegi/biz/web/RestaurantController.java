package com.pj.vegi.biz.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pj.vegi.biz.service.RestaurantBizService;
import com.pj.vegi.common.Paging;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;


@Controller
public class RestaurantController {

	@Autowired
	RestaurantBizService restBizService;

	@RequestMapping("/restBizList.do")
	public String restBizList(Model model, Paging paging, HttpSession session) {
		
//		paging.setPageUnit(5);	//출력하는 레코드 건수
//		paging.setPageSize(3);	//페이지 번호 수
//		// 페이지번호 파라미터
//		if (paging.getPage() == null) {
//			paging.setPage(1);	//페이지번호 안 넘어오면 1로 초기화
//		}
//		// 시작/마지막 레코드 번호
//		vo.setStart(paging.getFirst());
//		vo.setEnd(paging.getLast());
//		// 전체 건수
//		paging.setTotalRecord(dao.getCount(vo));	//전체레코드건수
//		model.addAttribute("paging", paging);
		
		String mId = (String) session.getAttribute("mId");
		RestaurantVo vo = new RestaurantVo();
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
		
		menuVo.setMenuVoList(menuList);
		
		model.addAttribute("restVo", restVo);
		model.addAttribute("listVo", menuVo);
		model.addAttribute("reservList", reservList);

		return "biz/restUpdate";
	}
	
	
	@RequestMapping("/restBizUpdate.do")
	public String restBizUpdate(Model model, RestaurantVo restVo, RestMenuVo menuListVo) {
		
		restBizService.restBizUpdate(restVo);
		
		List<RestMenuVo> menuList = menuListVo.getMenuVoList();
		for(RestMenuVo menuVo : menuList) {
			restBizService.restMenuUpdate(menuVo);
			
			if(menuVo.getDeleteFlag() != null) {
				restBizService.restMenuDelete(menuVo);
			}
			if(menuVo.getNewMenuFlag() != null) {
				menuVo.setRestId(restVo.getRestId());
				restBizService.restMenuInsert(menuVo);
			}
		}
		
		model.addAttribute("restId", restVo.getRestId());
		
		return "redirect:restBizSelect.do";
	}
	
	
	@RequestMapping("/restBizDelete.do")
	public String restBizDelete(Model model, RestaurantVo vo) {
		
		restBizService.restBizDelete(vo);
		
		return "redirect:restBizList.do";
	}
}
