package com.pj.vegi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RestaurantVo {
	private String restId;
	private String restName;
	private double restStarAvg;
	private int restReviewCount;
	private String restAddress;
	private String restPic;
	private String restTime;
	private String mId;
	private int restReservWait;
	private int restReservAccept;
	private String restTel;
	private String bizNum;
	private String adminConfirm;
}