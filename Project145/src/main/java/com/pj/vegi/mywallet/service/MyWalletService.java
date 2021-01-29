package com.pj.vegi.mywallet.service;

import java.util.List;
import java.util.Map;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vo.MemberVo;

public interface MyWalletService {
	
	MemberVo selectMember(MemberVo vo);
	Map<String, Object> withReqAll();
	Map<String, Object> depositReqListAll();
	Map<String, Object> depositReqAll();
	
	int updatePlusWallet(MemberVo vo);
	int updateMinusWallet(MemberVo vo);	
	int insertPlusWalletHistory(WalletHistoryVO vo);
	int insertMinusWalletHistory(WalletHistoryVO vo);
	
	List<WalletHistoryVO> selectWalletHistory(WalletHistoryVO vo);
	int countHistory(WalletHistoryVO vo);
}
