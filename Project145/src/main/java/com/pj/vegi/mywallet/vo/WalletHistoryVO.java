package com.pj.vegi.mywallet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WalletHistoryVO {
	private String walletId;
	private int walletMoney;
	private String wallet_type;
	private Date wallet_date;
	private String m_id;
}
