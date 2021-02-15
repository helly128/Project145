package com.pj.vegi.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVo {
	private String reportNo;
	private String reportContent;
	private Date reportDate;	//신고일
	private Date ReportProDate;	//처리일
	private String reportResult;
	private String mId;			//신고자ID
	private String originId;
	
	private int start; //페이징 시작
	private int end; //페이징 끝
	private String keyword; //검색
}
