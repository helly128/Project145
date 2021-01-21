package com.pj.vegi.naver.controller;

import java.math.BigInteger;
import java.security.SecureRandom;

public class Utils {
	public static String generateState() {

		SecureRandom random = new SecureRandom();

		return new BigInteger(130, random).toString(32);

	}

}
