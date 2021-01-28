package com.pj.vegi.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LikeListVo {
	private String likeNo;
	private String originId;
	private Date likeDate;
	private String mId;
}
