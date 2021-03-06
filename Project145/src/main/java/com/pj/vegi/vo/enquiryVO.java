package com.pj.vegi.vo;

import lombok.Data;

@Data
public class enquiryVO {
	private String enqNo;
	private String originId;
	private String enqType;
	private String enqContent;
	private String enqDate;
	private String enqProDate;
	private String enqResult;
	private String mId;
	
	private int start;
	private int end;
	private String keyword; //검색
	
	private String questionResult; //검색필터
}
