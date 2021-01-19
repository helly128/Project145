package com.pj.vegi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberVo {
	private String mId;
	private String password;
	private String email;
	private String vegtype;
	private String available;
	private String auth;
	private String mName;
	private int report;
	private int walletPoint;
	private int walletCash;
	private String bizNum;
	
}
