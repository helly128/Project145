package com.pj.vegi.mywallet.service;

import java.util.Map;

import com.pj.vegi.mywallet.vo.WithDrawReqVO;
import com.pj.vegi.vo.MemberVo;

public interface MyWalletService {
	
	MemberVo selectMember(MemberVo vo);
	Map<String, Object> selectReqAll();

}
