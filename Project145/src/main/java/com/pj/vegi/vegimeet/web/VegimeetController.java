package com.pj.vegi.vegimeet.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.VegimeetVo;

@Controller
public class VegimeetController {
	@Autowired
	VegimeetService vegimeetService;
	
	//메인페이지 출력
	@RequestMapping("/vegimeetList.do")
	public String vegimeetList(Model model, HttpSession session) {
		
		String mId = (String) session.getAttribute("mId");
		List<VegimeetVo> list = vegimeetService.vegimeetList();
		for(VegimeetVo vo : list) {
			vo.setDday(vegimeetService.getDday(vo));
			
			LikeListVo likeVo = new LikeListVo();
			likeVo.setMId(mId);
			likeVo.setOriginId(vo.getMeetId());
			vo.setLikeFlag(vegimeetService.likeFlagSelect(likeVo));
		}
		model.addAttribute("list", list);
		
		return "vegimeet/vegimeetMain";
	}
	
	//상세페이지 출력
	@RequestMapping("/vegimeetSelect.do")
	public String vegimeetSelect(Model model, VegimeetVo vo) {
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("/vegimeetLike.do/{meetId}")
	public void vegimeetLike(@PathVariable String meetId, HttpSession session) {
		LikeListVo vo = new LikeListVo();
		vo.setMId((String) session.getAttribute("mId"));
		vo.setOriginId(meetId);
		vegimeetService.likeInsert(vo);
	}
	
	@ResponseBody
	@RequestMapping("/vegimeetUnlike.do/{meetId}")
	public void vegimeetUnlike(@PathVariable String meetId, HttpSession session) {
		LikeListVo vo = new LikeListVo();
		vo.setMId((String) session.getAttribute("mId"));
		vo.setOriginId(meetId);
		vegimeetService.likeDelete(vo);
	}
}
