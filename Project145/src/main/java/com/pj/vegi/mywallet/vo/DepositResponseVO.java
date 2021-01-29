package com.pj.vegi.mywallet.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class DepositResponseVO {
	String wd_account_num_masked;
	String wd_account_holder_name;

	ArrayList<DepositResListVO> res_list;
	
}
