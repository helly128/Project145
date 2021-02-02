package com.pj.vegi.vegimeet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vegimeet.service.VegimeetService;
import com.pj.vegi.vo.MeetParticipantVo;
import com.pj.vegi.vo.VegimeetVo;

@Component
public class MeetCron {
	/*
	 * 매일 자정 인증샷을 업로드하지 않은 참가자의 fail 카운트 증가
	 * 매일 자정 직전 종료된 베지밋의 보상금 처리
	 */

	@Autowired
	VegimeetService vegimeetService;

	@Scheduled(cron = "0 0 0 * * *")	// 매일 자정 실행
	public void autoUpdate() {
		
		//false count
		//현재 진행중인 meetid만 가져오기
		List<VegimeetVo> meetList = vegimeetService.ongoingMeetList();
		//진행중인 meet에 참여중인 참가자 목록
		for (VegimeetVo vo : meetList) {
			List<MeetParticipantVo> partiList = vegimeetService.meetPartiList(vo);
			for(MeetParticipantVo partiVo : partiList) {
				if(partiVo.getTodayFlag().equals("false")) {
					vegimeetService.addFailCount(partiVo);	// today_flag가 false인 참가자 fail+1
				}
				vegimeetService.allFalseSet(partiVo);	// 모든 참가자 today_flag = false로 세팅
			}
		}
		
		
		
		//보상금 처리
		List<VegimeetVo> endList = vegimeetService.endMeetSelect();
		for(VegimeetVo vo : endList	) {
			int reward = 0;		//총 상금
			int cash = 0;		//충전금
			int allSuccess = 0;	//100% 달성한 참가자 총 모금액
			int point = 0;
			List<MeetParticipantVo> partiList = vegimeetService.meetPartiList(vo);
			
			for(MeetParticipantVo partiVo: partiList) {
				if(partiVo.getAchiv() == 100) {
					cash = partiVo.getMyFund();
					allSuccess += cash;
				} else if(partiVo.getAchiv() >= 85) {
					cash = partiVo.getMyFund();
				} else {
					reward += (100 - partiVo.getAchiv()) * partiVo.getMyFund() / 100;
					cash = partiVo.getAchiv() * partiVo.getMyFund() / 100;
				}
				partiVo.setPayBack(cash);
				vegimeetService.cashUpdate(partiVo);	//member 테이블의 충전금 update
				
				WalletHistoryVO hisVo = new WalletHistoryVO();
				hisVo.setMId(partiVo.getMId());
				hisVo.setWalletMoney(cash);
				hisVo.setWalletType("베지밋 페이백");
				vegimeetService.pointHistoryInsert(hisVo);
			}
			
			for(MeetParticipantVo partiVo: partiList) {
				if(partiVo.getAchiv() == 100) {
					point = partiVo.getMyFund() * reward / allSuccess;
					partiVo.setReward(point);
					vegimeetService.pointUpdate(partiVo);	//member 테이블의 적립금 update
					WalletHistoryVO hisVo = new WalletHistoryVO();
					hisVo.setMId(partiVo.getMId());
					hisVo.setWalletMoney(point);
					hisVo.setWalletType("베지밋 리워드");
					vegimeetService.pointHistoryInsert(hisVo);
				}
			}
		}
		
	}
}
