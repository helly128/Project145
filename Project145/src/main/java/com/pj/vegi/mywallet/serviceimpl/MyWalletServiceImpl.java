package com.pj.vegi.mywallet.serviceimpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.mywallet.mapper.MyWalletMapper;
import com.pj.vegi.mywallet.service.MyWalletService;
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
	public Map<String, Object> selectReqAll() {
		return dao.selectReqAll();
	}
}
