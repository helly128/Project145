package com.pj.vegi.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class VegimeetVo {
	private String meetId;
	private String meetTitle;
	private Date meetStart;
	private Date meetEnd;
	private int meetParticipant;
	private String meetContent;
	private int meetFund;
	private String mId;
	private String meetPic;
	private int minMoney;
	private int totalDay;
	
	private int dday;
	private int likeFlag;
	
	private MeetParticipantVo partiVo;
}
