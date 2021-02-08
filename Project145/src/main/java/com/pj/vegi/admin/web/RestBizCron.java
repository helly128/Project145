package com.pj.vegi.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.pj.vegi.biz.service.RestaurantBizService;
import com.pj.vegi.vo.RestReservVo;

@Component
public class RestBizCron {
	/*
	 * 정각마다 예약건조회해서 예약완료이면서 예약 시간 지난 건 식당테이블에서 예약완료-1 처리
	 */
	@Autowired
	RestaurantBizService restaurantBizService;
	
	@Scheduled(cron = "0 0 0/1 * * *")
	public void autoUpdate() {
		System.out.println("크론 실행");
		
		List<RestReservVo> list = restaurantBizService.reservEndList();
		for(RestReservVo vo: list) {
			restaurantBizService.reservEndUpdate(vo);	//시간 지난 예약 '지난예약'으로 변경
			restaurantBizService.reservEndMinus(vo);	//식당의 예약완료 건 -1
		}
	}
}
