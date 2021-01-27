package com.pj.vegi.mywallet.vo;

import lombok.Data;

@Data
public class WithDrawReqVO {
	String bankTranId;
	String cntrAccountType;
	String cntrAccountNum;
	String dpsPrintContent;
	String fintechUseNum;
	String tranAmt;
	String tranDtime;
	String reqClientName;
	String reqClientNum;
	String transferPurpose;
	String accessToken;
	String reqClientFintechUseNum; // 요청고객핀테크이용번호
	String recvClientAccountNum; // 최종수취고객
	String recvClientName;
	String recvClientBankCode;

}
