package com.pj.vegi.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RestReviewVo {
	private String restReviewId;
	private String restReview;
	private double restStar;
	private String reviewPic;
	private Date reviewDate;
	private String mId;
	private String restId;
	
	private String mName;
	private String profileImage;
	
	private int start;
	private int end;

}
