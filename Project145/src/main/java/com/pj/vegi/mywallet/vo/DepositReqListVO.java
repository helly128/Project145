package com.pj.vegi.mywallet.vo;

import lombok.Data;

@Data
public class DepositReqListVO {
	String tranNo;
	String bankTranId;
	String fintechUseNum;
	String printContent;
	String tranAmt;
	String reqClientName;
	String reqClientNum;
	String transferPurpose;
	String reqClientFintechUseNum;
	
}
