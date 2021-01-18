package com.pj.vegi.vo;

import lombok.Data;

@Data
public class RestaurantVo {
	private String restId;
	private String restName;
	private double restStarAvg;
	private int restReviewCount;
	private String restAddress;
	private String restPic;
	private String restTime;
	private String mId;
}
