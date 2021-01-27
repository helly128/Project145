package com.pj.vegi.mywallet.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class DepositResponseVO {
	String wdAccountNumMasked;
	String wdAccountHolderName;

	ArrayList<DepositResListVO> resList;
	
}
