package com.pj.vegi.mywallet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WalletHistoryVO {
	private String walletId;
	private int walletMoney;
	private String walletType;
	private Date walletDate;
	private String mId;
	private int startP;
	private int endP;
}
