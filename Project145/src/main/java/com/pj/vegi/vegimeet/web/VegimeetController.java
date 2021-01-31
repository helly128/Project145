package com.pj.vegi.vegimeet.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.VegimeetVo;

@Controller
public class VegimeetController {
	@Autowired
	VegimeetService vegimeetService;
	@Autowired
	MemberService memberService;
	
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
	public String vegimeetSelect(Model model, VegimeetVo vo, HttpSession session) {
		vo = vegimeetService.vegimeetSelect(vo);
		List<MeetParticipantVo> partiList = vegimeetService.meetPartiList(vo);
		String joinFlag = "";
		String mId = (String) session.getAttribute("mId");
		for(MeetParticipantVo partiVo : partiList) {
			if(partiVo.getMId().equals(mId)) {
				joinFlag = "true";
			}
		}
		model.addAttribute("meetVo", vo);
		model.addAttribute("partiList", partiList);
		model.addAttribute("joinFlag", joinFlag);
		return "vegimeet/vegimeetSelect";
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping("/vegimeetLike.do/{meetId}")
	public void vegimeetLike(@PathVariable String meetId, HttpSession session) {
		LikeListVo vo = new LikeListVo();
		vo.setMId((String) session.getAttribute("mId"));
		vo.setOriginId(meetId);
		vegimeetService.likeInsert(vo);
	}
	
	//좋아요 취소
	@ResponseBody
	@RequestMapping("/vegimeetUnlike.do/{meetId}")
	public void vegimeetUnlike(@PathVariable String meetId, HttpSession session) {
		LikeListVo vo = new LikeListVo();
		vo.setMId((String) session.getAttribute("mId"));
		vo.setOriginId(meetId);
		vegimeetService.likeDelete(vo);
	}
	
	
	@RequestMapping("/vegimeetJoinPage.do")
	public String vegimeetJoinPage(Model model, VegimeetVo meetVo, HttpSession session) {
		meetVo = vegimeetService.vegimeetSelect(meetVo);
		
		MemberVo memVo = new MemberVo();
		memVo.setMId((String) session.getAttribute("mId"));
		try {
			memVo = memberService.memberSelect(memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("meetVo", meetVo);
		model.addAttribute("memberVo", memVo);
		
		return "vegimeet/payPage";
	}
	
	@RequestMapping("/payProcess.do")
	public String payProcess(Model model, HttpSession session, MeetParticipantVo partiVo, @RequestParam int totalPoint) {
		String mId = (String) session.getAttribute("mId");
		partiVo.setMId(mId);
		vegimeetService.meetPartiInsert(partiVo);	//meet_parti에 참가자 추가
		vegimeetService.meetUpdate(partiVo);		//meet_un 참가자수, 모금액 증가
		MemberVo memVo = new MemberVo();
		
		//사용한 포인트 차감
		if(totalPoint != 0) {
			memVo.setMId(mId);
			try {
				memVo = memberService.memberSelect(memVo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			int diff = 0;
			int point = memVo.getWalletPoint();
			int cash = memVo.getWalletCash();
			if(point >= totalPoint) {
				memVo.setWalletPoint(point - totalPoint);
			} else {
				diff = totalPoint - point;
				memVo.setWalletPoint(0);
				memVo.setWalletCash(cash - diff);
			}
			vegimeetService.pointDeduct(memVo);
			WalletHistoryVO hisVo = new WalletHistoryVO();
			hisVo.setMId(mId);
			hisVo.setWalletMoney(memVo.getWalletPoint());
			hisVo.setWalletType("적립금사용");
			vegimeetService.pointHistoryInsert(hisVo);
			if(diff != 0) {
				hisVo.setWalletMoney(diff);
				hisVo.setWalletType("충전금사용");
				vegimeetService.pointHistoryInsert(hisVo);
			}
		}
		
		model.addAttribute("meetId", partiVo.getMeetId());
		return "redirect:vegimeetSelect.do";
	}
}
