package com.pj.vegi.mywallet.serviceimpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.mywallet.mapper.MyWalletMapper;
import com.pj.vegi.mywallet.service.MyWalletService;
import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.mywallet.vo.WithDrawReqVO;
import com.pj.vegi.vo.MemberVo;

@Service("myWalletService")
public class MyWalletServiceImpl implements MyWalletService {

	@Autowired
	MyWalletMapper dao;

	@Override
	public MemberVo selectMember(MemberVo vo) {

		return dao.selectMember(vo);
	}

	@Override
	public Map<String, Object> withReqAll() {
		return dao.withReqAll();
	}

	@Override
	public Map<String, Object> depositReqListAll() {
		return dao.depositReqListAll();
	}

	@Override
	public Map<String, Object> depositReqAll() {
		return dao.depositReqAll();
	}

	@Override
	public int updatePlusWallet(MemberVo vo) {
		return dao.updatePlusWallet(vo);
	}

	@Override
	public int insertPlusWalletHistory(WalletHistoryVO vo) {
		return dao.insertPlusWalletHistory(vo);
	}

	@Override
	public int updateMinusWallet(MemberVo vo) {
		return dao.updateMinusWallet(vo);
	}

	@Override
	public int insertMinusWalletHistory(WalletHistoryVO vo) {
		return dao.insertMinusWalletHistory(vo);
	}

	@Override
	public List<WalletHistoryVO> selectWalletHistory(WalletHistoryVO vo) {
		return dao.selectWalletHistory(vo);
	}

	@Override
	public int countHistory(WalletHistoryVO vo) {
		return dao.countHistory(vo);
	}
}
