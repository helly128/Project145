package com.pj.vegi.mywallet.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class DepositReqVO {
	String cntrAccountType;
	String cntrAccountNum;
	String wdPassPhrase;
	String wdPrintContent;
	String nameCheckOption;
	String tranDtime;
	String reqCnt;
	String accessToken;
	ArrayList<DepositReqListVO> reqList;
	
}
