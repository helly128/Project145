package com.pj.vegi.mywallet.service;

import java.util.Map;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vo.MemberVo;

public interface MyWalletService {
	
	MemberVo selectMember(MemberVo vo);
	Map<String, Object> withReqAll();
	Map<String, Object> depositReqListAll();
	Map<String, Object> depositReqAll();
	
	int updateWallet(MemberVo vo);
	int insertWalletHistory(WalletHistoryVO vo);
}
