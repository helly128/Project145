package com.pj.vegi.mywallet.vo;

import java.util.ArrayList;

public class DepositResponseVO {
	String wd_account_num_masked;
	String wd_account_holder_name;

	ArrayList<DepositResListVO> res_list;
	public ArrayList<DepositResListVO> get_res_list() {
		return res_list;
	}
	
	
}
