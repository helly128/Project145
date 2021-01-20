package com.pj.vegi.mypage.service;

import java.sql.SQLException;

import com.pj.vegi.vo.MemberVo;

public interface MypageService {

	MemberVo myPageSelect(MemberVo vo) throws SQLException;
}
