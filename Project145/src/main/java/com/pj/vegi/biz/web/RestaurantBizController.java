package com.pj.vegi.biz.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pj.vegi.biz.service.RestaurantBizService;
import com.pj.vegi.common.ImageIO;
import com.pj.vegi.vo.RestMenuVo;
import com.pj.vegi.vo.RestReservVo;
import com.pj.vegi.vo.RestaurantVo;

@Controller
public class RestaurantBizController {

	@Autowired
	RestaurantBizService restBizService;

	@RequestMapping("/restBizList.do")
	public String restBizList(Model model, HttpSession session) {
		RestaurantVo vo = new RestaurantVo();
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
		List<RestReservVo> reservList = restBizService.restReservWaitList(reservVo);
		
		reservVo.setReservVoList(reservList);

		model.addAttribute("restVo", restVo);
		model.addAttribute("menuList", menuList);
		model.addAttribute("reservVo", reservVo);

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

		menuVo.setMenuVoList(menuList);

		model.addAttribute("restVo", restVo);
		model.addAttribute("listVo", menuVo);

		return "biz/restUpdate";
	}

	@RequestMapping("/restBizUpdate.do")
	public String restBizUpdate(Model model, RestaurantVo restVo, RestMenuVo menuListVo, HttpServletRequest request,
			@RequestParam MultipartFile uploadfile) throws IllegalStateException, IOException {

		// 사진 업로드 처리
		if (uploadfile != null && uploadfile.getSize() > 0) {
			String name = ImageIO.imageUpload(request, uploadfile, restVo.getRestPic());

			restVo.setRestPic(name);
		}
		restBizService.restBizUpdate(restVo);

		List<RestMenuVo> menuList = menuListVo.getMenuVoList();
		for (RestMenuVo menuVo : menuList) {
			restBizService.restMenuUpdate(menuVo);

			if (menuVo.getDeleteFlag() != null) {
				restBizService.restMenuDelete(menuVo);
			}
			if (menuVo.getNewMenuFlag() != null) {
				menuVo.setRestId(restVo.getRestId());
				restBizService.restMenuInsert(menuVo);
			}
		}

		model.addAttribute("restId", restVo.getRestId());

		return "redirect:restBizSelect.do";
	}

	@RequestMapping("/restBizDelete.do")
	public String restBizDelete(Model model, RestaurantVo vo) {
		restBizService.restAllMenuDelete(vo);
		restBizService.restBizDelete(vo);

		return "redirect:restBizList.do";
	}

	@RequestMapping("/restBizInsertForm")
	public String restBizInsertForm() {

		return "biz/restInsert";
	}

	@RequestMapping("/restBizInsert.do")
	public String restBizInsert(Model model, RestaurantVo restVo, RestMenuVo menuListVo, HttpServletRequest request,
			@RequestParam MultipartFile uploadfile, HttpSession session) throws IllegalStateException, IOException {

		// 사진 업로드 처리
		if (uploadfile != null && uploadfile.getSize() > 0) {
			String name = ImageIO.imageUpload(request, uploadfile);

			restVo.setRestPic(name);
		}
		restVo.setMId((String) session.getAttribute("mId"));
		restBizService.restBizInsert(restVo);
		restVo.setRestId("rest" + restVo.getSeq());

		List<RestMenuVo> menuList = menuListVo.getMenuVoList();
		for (RestMenuVo menuVo : menuList) {
			if (menuVo.getMenuName() != null && menuVo.getMenuName() != "") {
				menuVo.setRestId(restVo.getRestId());
				restBizService.restMenuInsert(menuVo);
			}
		}

		model.addAttribute("restId", restVo.getRestId());

		return "redirect:restBizSelect.do";
	}

	@RequestMapping("/restBizReservUpdate.do")
	public String restBizReservUpdate(Model model, RestReservVo reservVo,
			@RequestParam String hiddenFlag) {
		String status = null;
		if(hiddenFlag.equals("accept")) {
			status = "예약완료";
		} else {
			status = "예약거절";
		}
		for(RestReservVo vo : reservVo.getReservVoList()) {
			if(vo.getCheckFlag() != null) {
				vo.setRestReservStatus(status);
				restBizService.restBizReservUpdate(vo);
				restBizService.reservRestUpdate(vo);
			}
		}
		
		model.addAttribute("restId", reservVo.getReservVoList().get(0).getRestId());
		return "redirect:restBizSelect.do";
	}
}
