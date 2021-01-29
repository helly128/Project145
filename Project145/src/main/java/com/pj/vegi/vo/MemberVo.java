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
	private int walletPoint;	//내지갑 적립금
	private int walletCash;		//내지갑 충전금
	private String bizNum;
	private String reqClientFintechUseNum;
	private String reqClientName;
	private String reqClientNum;
	
	
	
}
