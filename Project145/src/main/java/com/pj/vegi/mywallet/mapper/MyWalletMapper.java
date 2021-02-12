package com.pj.vegi.mywallet.mapper;

import java.util.List;
import java.util.Map;

import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.vo.MemberVo;

public interface MyWalletMapper {

	public MemberVo selectMember(MemberVo vo);
	public Map<String, Object> withReqAll();
	public Map<String, Object> depositReqListAll();
	public Map<String, Object> depositReqAll();
	
	public int updatePlusWallet(MemberVo vo);
	public int updateMinusWallet(MemberVo vo);
	public int insertPlusWalletHistory(WalletHistoryVO vo);
	public int insertMinusWalletHistory(WalletHistoryVO vo);
	
	public List<WalletHistoryVO> selectWalletHistory(WalletHistoryVO vo);
	
	public int countHistory(WalletHistoryVO vo);
}
