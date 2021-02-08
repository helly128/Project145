package com.pj.vegi.vo;

import lombok.Data;

@Data
public class MeetDataVo {
	private String meetdataId;
	private String meetpId;
	private String dataPic;
	private String meetId;
	
	private int start;	//무한 스크롤 데이터 조회 번호
	private int end;
}
