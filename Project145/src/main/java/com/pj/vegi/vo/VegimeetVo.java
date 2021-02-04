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
	
	private String options = "전체";	//드롭다운메뉴 선택값
	private String keyword;	//검색어
	private int start;
	private int end;
	
	private MeetParticipantVo partiVo;	//join때문에 추가
}
