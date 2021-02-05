package com.pj.vegi.vegimeet.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pj.vegi.common.ImageIO;
import com.pj.vegi.common.Paging;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MeetDataVo;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.VegimeetVo;

@Controller
public class VegimeetController {
	@Autowired
	VegimeetService vegimeetService;
	@Autowired
	MemberService memberService;

	// 메인페이지 출력
	@RequestMapping("/vegimeetList.do")
	public String vegimeetList(Model model, HttpSession session, Paging paging) {
		// 전체 베지밋 목록
		String mId = (String) session.getAttribute("mId");
		VegimeetVo meetVo = new VegimeetVo();
		paging.setPageUnit(8);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		meetVo.setStart(paging.getFirst());
		meetVo.setEnd(paging.getLast());

		int cnt = vegimeetService.countMeetList(meetVo);
		paging.setTotalRecord(cnt);
		
		List<VegimeetVo> list = vegimeetService.vegimeetList(meetVo);
		for (VegimeetVo vo : list) {
			vo.setDday(vegimeetService.getDday(vo));

			LikeListVo likeVo = new LikeListVo();
			likeVo.setMId(mId);
			likeVo.setOriginId(vo.getMeetId());
			vo.setLikeFlag(vegimeetService.likeFlagSelect(likeVo));
		}

		// 내가 참여중인 베지밋 목록
		if(mId != null && mId != "") {
		}
		List<Map> myList = vegimeetService.myMeetList(mId);
		model.addAttribute("myList", myList);

		model.addAttribute("list", list);

		return "vegimeet/vegimeetMain";
	}
	
	@ResponseBody
	@RequestMapping("/changeSearchOption.do/{options}")
	public List<VegimeetVo> changeSearchOption(@PathVariable String options, Paging paging) {
		VegimeetVo meetVo = new VegimeetVo();
		paging.setPageUnit(8);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		meetVo.setStart(paging.getFirst());
		meetVo.setEnd(paging.getLast());

		int cnt = vegimeetService.countMeetList(meetVo);
		paging.setTotalRecord(cnt);
		
		meetVo.setOptions(options);
		List<VegimeetVo> list = vegimeetService.vegimeetList(meetVo);
		
		return list;
	}

	// 상세페이지 출력
	@RequestMapping("/vegimeetSelect.do")
	public String vegimeetSelect(Model model, VegimeetVo vo, HttpSession session) {
		vo = vegimeetService.vegimeetSelect(vo);
		List<MeetParticipantVo> partiList = vegimeetService.meetPartiList(vo);
		String joinFlag = ""; // 참여여부
		String mId = (String) session.getAttribute("mId");
		for (MeetParticipantVo partiVo : partiList) {
			if (partiVo.getMId().equals(mId)) {
				joinFlag = "true";
			}
		}
		vo.setDday(vegimeetService.getDday(vo));
		model.addAttribute("meetVo", vo);
		model.addAttribute("partiList", partiList);
		model.addAttribute("joinFlag", joinFlag);

		return "vegimeet/vegimeetSelect";
	}

	// 좋아요
	@ResponseBody
	@RequestMapping("/vegimeetLike.do/{meetId}")
	public void vegimeetLike(@PathVariable String meetId, HttpSession session) {
		LikeListVo vo = new LikeListVo();
		vo.setMId((String) session.getAttribute("mId"));
		vo.setOriginId(meetId);
		vegimeetService.likeInsert(vo);
	}

	// 좋아요 취소
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
	public String payProcess(Model model, HttpSession session, MeetParticipantVo partiVo,
			@RequestParam int totalPoint) {
		String mId = (String) session.getAttribute("mId");
		partiVo.setMId(mId);
		vegimeetService.meetPartiInsert(partiVo); // meet_parti에 참가자 추가
		vegimeetService.meetUpdate(partiVo); // meet_un 참가자수, 모금액 증가
		MemberVo memVo = new MemberVo();
		WalletHistoryVO hisVo = new WalletHistoryVO();
		hisVo.setMId(mId);

		// 사용한 포인트 차감
		if (totalPoint != 0) {
			memVo.setMId(mId);
			try {
				memVo = memberService.memberSelect(memVo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			int diff = 0;
			int point = memVo.getWalletPoint(); // 기존 적립금
			int cash = memVo.getWalletCash(); // 기존 충전금
			if (point >= totalPoint) {
				memVo.setWalletPoint(point - totalPoint); // 적립금 사용한만큼 차감
				hisVo.setWalletMoney(totalPoint);
				hisVo.setWalletType("적립금사용");
				vegimeetService.pointHistoryInsert(hisVo); // 사용한 적립금 내역 wallet_history에 추가
			} else {
				diff = totalPoint - point;
				memVo.setWalletPoint(0);
				memVo.setWalletCash(cash - diff); // 사용한만큼 충전금 차감
			}
			vegimeetService.pointDeduct(memVo); // 적립금, 충전금 차감 쿼리 실행

			if (diff != 0) { // 보유한 적립금 이상 사용 시 적립금 내역 wallet_history에 추가
				if (point != 0) {
					hisVo.setWalletMoney(point);
					hisVo.setWalletType("적립금사용");
					vegimeetService.pointHistoryInsert(hisVo);
				}
				hisVo.setWalletMoney(diff);
				hisVo.setWalletType("충전금사용");
				vegimeetService.pointHistoryInsert(hisVo);
			}
		}

		model.addAttribute("meetId", partiVo.getMeetId());
		return "redirect:vegimeetSelect.do";
	}

	@RequestMapping("/vegimeetPicInsertForm.do")
	public String vegimeetPicInsertForm(Model model, VegimeetVo vo) {
		System.out.println("vo.meetId : " + vo.getMeetId());
		model.addAttribute("vo", vo);
		return "vegimeet/picWindow";
	}

	@ResponseBody
	@RequestMapping("/vegimeetPicInsert.do/{meetId}")
	public Map vegimeetPicInsert(Model model, @PathVariable String meetId, HttpSession session,
			HttpServletRequest request, @RequestParam MultipartFile uploadfile)
			throws IllegalStateException, IOException {
		MeetDataVo vo = new MeetDataVo();
		vo.setMeetId(meetId);

		MeetParticipantVo partiVo = new MeetParticipantVo();
		String mId = (String) session.getAttribute("mId");
		partiVo.setMId(mId);
		partiVo.setMeetId(meetId);
		partiVo = vegimeetService.meetpSelect(partiVo); // meetp_id 읽어오기 위해 전체 조회
		vo.setMeetpId(partiVo.getMeetpId());

		if (uploadfile != null && uploadfile.getSize() > 0) {
			String name = ImageIO.imageUpload(request, uploadfile);
			vo.setDataPic(name);
		}
		vegimeetService.uploadMeetDataPic(vo); // meet_data에 insert

		// meet_parti update
		VegimeetVo meetVo = new VegimeetVo();
		meetVo.setMeetId(meetId);
		meetVo = vegimeetService.vegimeetSelect(meetVo);
		int total = meetVo.getTotalDay();
		int success = partiVo.getSuccess() + 1;
		int achiv = 100 * success / total;
		partiVo.setAchiv(achiv);
		vegimeetService.meetPartiUpdate(partiVo);

		// 해당 밋의 정보 다시 읽어오기
		Map newMeetVo = vegimeetService.myMeetOne(partiVo);
		return newMeetVo;
	}

	@RequestMapping("/vegimeetInsertForm.do")
	public String vegimeetInsertForm() {
		return "vegimeet/vegimeetInsert";
	}

	//베지밋 개설
	@RequestMapping("/vegimeetInsert.do")
	public String vegimeetInsert(HttpSession session, VegimeetVo vo, @RequestParam MultipartFile uploadfile,
			HttpServletRequest request) throws IllegalStateException, IOException {
		String mId = (String) session.getAttribute("mId");
		vo.setMId(mId);
		if (uploadfile != null && uploadfile.getSize() > 0) {
			String name = ImageIO.imageUpload(request, uploadfile);
			vo.setMeetPic(name);
		}
		vegimeetService.vegimeetInsert(vo);
		
		return "redirect:vegimeetList.do";
	}
	
	// 다른 참가자의 사진 목록
	@ResponseBody
	@RequestMapping("/scrollNewImage.do/{meetId}/{num}")
	public List<MeetDataVo> scrollNewImage(@PathVariable String meetId, @PathVariable int num) {
		MeetDataVo vo = new MeetDataVo();
		vo.setMeetId(meetId);
		vo.setStart(num);
		vo.setEnd(num+7);
		List<MeetDataVo> dataList = vegimeetService.meetDataList(vo);	//베지밋 vo
		for(MeetDataVo dVo : dataList) {
			dVo.setStart(num);	// start, end가 db의 값이 아니라서 jsp에서 쓰기 위해 다시 set해줌
		}
		return dataList;
	}
	
}
