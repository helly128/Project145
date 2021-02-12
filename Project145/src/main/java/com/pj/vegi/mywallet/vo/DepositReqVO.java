package com.pj.vegi.mywallet.vo;

import java.util.ArrayList;
import lombok.Data;

@Data
public class DepositReqVO {
	
	String access_token;
	String cntr_account_type;
	String cntr_account_num;
	String wd_pass_phrase;
	String wd_print_content;
	String name_check_option;
	String tran_dtime;
	String req_cnt;
	ArrayList<DepositReqListVO>req_list;
	
	
}
