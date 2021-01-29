package com.pj.vegi.mywallet.vo;

import lombok.Data;

@Data
public class DepositReqListVO {
	String tran_no;
	String bank_tran_id;
	String fintech_use_num;
	String print_content;
	String tran_amt;
	String transfer_purpose;
	String req_client_name;
	String req_client_num;
	String req_client_fintech_use_num;
	
}
