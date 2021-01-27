package com.pj.vegi.mywallet.vo;

import lombok.Data;

@Data
public class DepositResListVO {
	String bankTranDate; // 거래일자
	String fintechUseNum; // 핀테크 이용 번호
	String accountNumMasked; // 입금계좌번호
	String accountHolderName; // 수취인 성명
	String tranAmt; // 거래금액
	
	
}
