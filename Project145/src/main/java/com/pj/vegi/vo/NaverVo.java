package com.pj.vegi.vo;

import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

public class NaverVo {
	private final static String CLIENT_ID = "자신의 CLIENT_ID";
	private final static String CLIENT_SECRET = "자신의 CLIENT_SECRET";
	private final static String REDIRECT_URI = "자신이 작성한 로그인 성공시 url";

	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

	/* 네아로 인증 URL 생성 Method */
	public String getAuthorizationUrl(HttpSession session) {

		String state = generateState();
		session.setAttribute("state", state);

		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());

		return oauthService.getAuthorizationUrl();
	}
}
