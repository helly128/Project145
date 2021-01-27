package com.pj.vegi.mywallet.mapper;

import java.util.Map;

import com.pj.vegi.mywallet.vo.WithDrawReqVO;
import com.pj.vegi.vo.MemberVo;

public interface MyWalletMapper {

	public MemberVo selectMember(MemberVo vo);
	public Map<String, Object> selectReqAll();
}
