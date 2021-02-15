package com.pj.vegi.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RestReviewVo {
	private String restReview_id;
	private String restReview;
	private double restStar;
	private String reviewPic;
	private Date reviewDate;
	private String mId;
	private String restId;
	
	private int start;
	private int end;

}
