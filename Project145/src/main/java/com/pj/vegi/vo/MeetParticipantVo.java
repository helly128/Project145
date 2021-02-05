package com.pj.vegi.vo;

import lombok.Data;

@Data
public class MeetParticipantVo {
	private String meetpId;
	private int achiv;
	private int confirm;
	private String mId;
	private String meetId;
	private int success;
	private int fail;
	private int myFund;
	private String todayFlag;
	
	private int payBack;
	private int reward;
	private int start;
	private int end;
}
