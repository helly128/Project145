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
	private String m_name;
	private int report;
	private int wallet_id;
	private int wallet_point;
	private int wallet_cash;
	private int biznum;
	
}
