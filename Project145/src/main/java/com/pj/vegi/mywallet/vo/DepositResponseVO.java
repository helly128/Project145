package com.pj.vegi.mywallet.vo;

import java.util.ArrayList;

public class DepositResponseVO {
	String wd_account_num_masked;
	String wd_account_holder_name;

	ArrayList<DepositResListVO> res_list;
	public ArrayList<DepositResListVO> get_res_list() {
		return res_list;
	}
	public String getWd_account_num_masked() {
		return wd_account_num_masked;
	}
	public void setWd_account_num_masked(String wd_account_num_masked) {
		this.wd_account_num_masked = wd_account_num_masked;
	}
	public String getWd_account_holder_name() {
		return wd_account_holder_name;
	}
	public void setWd_account_holder_name(String wd_account_holder_name) {
		this.wd_account_holder_name = wd_account_holder_name;
	}
	public ArrayList<DepositResListVO> getRes_list() {
		return res_list;
	}
	public void setRes_list(ArrayList<DepositResListVO> res_list) {
		this.res_list = res_list;
	}
	
	
}
