package com.pj.vegi.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RestReservVo {
	private String restReservNum;
	private Date restReservDate;
	private String restReservName;
	private int restReservPeople;
	private String restReservStatus;
	private String mId;
	private String restId;
	
	private List<RestReservVo> reservVoList;
	private String checkFlag;
}
