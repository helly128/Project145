package com.pj.vegi.vo;

import java.math.BigInteger;
import java.security.SecureRandom;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


public class NaverVo {
	
	
	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

}
