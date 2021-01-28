package com.pj.vegi.mywallet.mapper;

import java.util.Map;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.mywallet.vo.WithDrawReqVO;
import com.pj.vegi.vo.MemberVo;

public interface MyWalletMapper {

	public MemberVo selectMember(MemberVo vo);
	public Map<String, Object> withReqAll();
	public Map<String, Object> depositReqListAll();
	public Map<String, Object> depositReqAll();
	
	public int updateWallet(MemberVo vo);
	public int insertWalletHistory(WalletHistoryVO vo);
	
}
