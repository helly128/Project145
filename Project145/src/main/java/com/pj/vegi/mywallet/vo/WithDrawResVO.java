package com.pj.vegi.mywallet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WithDrawResVO {
	String apiTranId; // 거래고유번호
	Date apiTranDtm; // 거래일시(밀리세컨드)
	String dpsBankName; // 입금기관명
	String dpsAccountNumMasked; // 입금계좌번호(출력용)
	String dpsPrintContent; // 입금계좌인자내역
	String dpsAccountHolderName; // 수취인성명
	Date bankTranDate; // 거래일자(참가은행)
	String fintechUseNum; // 출금계좌핀테크이용번호
	String bankName; // 출금기관명
	String accountNumMasked; // 출금계좌번호(출력용)
	String printContent; // 출금계좌인자내역
	String accountHolderName; // 송금인성명
	String tran_amt; // 거래금액
	String wdLimitRemainAmt; // 출금한도잔여금액
	
	
}
