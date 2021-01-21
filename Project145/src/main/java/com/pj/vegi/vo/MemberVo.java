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
	private String m_id;
	private String password;
	private String email;
	private String vegtype;
	private String available;
	private String auth;
	private String mName;
	private int report;
	private int wallet_point;
	private int wallet_cash;
	private String bizNum;
	
}
