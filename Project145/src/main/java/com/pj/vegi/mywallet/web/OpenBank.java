package com.pj.vegi.mywallet.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import com.google.gson.Gson;
import com.pj.vegi.mywallet.vo.DepositReqVO;
import com.pj.vegi.mywallet.vo.WithDrawReqVO;
import com.sun.mail.util.BASE64EncoderStream;


public class OpenBank {

	// 사용자인증
	public static String getAccessToken(String code) {

		final String strUrl = "https://testapi.openbanking.or.kr/oauth/2.0/token"; // Host
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값
		postParams.add(new BasicNameValuePair("client_id", "6Y2QQh8lyuIXTDJKP3NMp3avlHUbmXN41pMuaIa7")); // REST API KEY
		postParams.add(new BasicNameValuePair("client_secret", "dwpgwgRm7cpXQnkx0f5gm3yv9bUH7nFFw6c5jj6i"));
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost/Callback.do")); // 리다이렉트 URI
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

		StringBuilder sb = new StringBuilder();
		try {
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST"); // HEADER + BODY(파라미터값)
			con.setDoInput(true);
			con.setDoOutput(true);
			con.addRequestProperty("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");

			OutputStream os = con.getOutputStream();
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
			writer.write(getQuery(postParams)); // 파라미터와 &= 합체.
			writer.flush();
			writer.close();
			os.close();

			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();
				System.out.println("" + sb.toString());
			} else {
				System.out.println(con.getResponseMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return sb.toString();
	}

	// 이용기관
	public static String getOobAccessToken() {

		final String strUrl = "https://testapi.openbanking.or.kr/oauth/2.0/token"; // Host
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("client_id", "6Y2QQh8lyuIXTDJKP3NMp3avlHUbmXN41pMuaIa7")); // REST API KEY
		postParams.add(new BasicNameValuePair("client_secret", "dwpgwgRm7cpXQnkx0f5gm3yv9bUH7nFFw6c5jj6i"));
		postParams.add(new BasicNameValuePair("scope", "oob"));
		postParams.add(new BasicNameValuePair("grant_type", "client_credentials"));

		StringBuilder sb = new StringBuilder();
		try {
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST"); // HEADER + BODY(파라미터값)
			con.setDoInput(true);
			con.setDoOutput(true);
			con.addRequestProperty("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");

			OutputStream os = con.getOutputStream();
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
			writer.write(getQuery(postParams));
			writer.flush();
			writer.close();
			os.close();

			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();
				System.out.println("" + sb.toString());
			} else {
				System.out.println(con.getResponseMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return sb.toString();
	}

	// 출금이체
	public static String getWithDraw(Map vo) {

		StringBuilder sb = new StringBuilder();

		try {
			String strUrl = "https://testapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num";
			URL url = new URL(strUrl);

			Gson gson = new Gson();
			String query = gson.toJson(vo);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.addRequestProperty("Authorization", "Bearer" + vo.get("access_token"));

			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			con.setRequestProperty("Content-Length", String.valueOf(query.length()));
			con.setDoOutput(true);
			byte[] input = query.getBytes("utf-8");
			con.getOutputStream().write(input);

			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();
				System.out.println("" + sb.toString());
			} else {
				System.out.println(con.getResponseMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return sb.toString();
	}

	// 입금이체
	public static String getDeposit(DepositReqVO vo) {

		StringBuilder sb = new StringBuilder();

		try {
			String strUrl = "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/fin_num";
			URL url = new URL(strUrl);

			Gson gson = new Gson();
			String query = gson.toJson(vo);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();			
			
			con.addRequestProperty("Authorization", "Bearer" + vo.getAccess_token());
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestProperty("Content-Length", String.valueOf(query.length()));
			con.setDoOutput(true);

			byte[] input = query.getBytes("utf-8");
			con.getOutputStream().write(input);

			// JSON 형태 반환값 처리
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();
				System.out.println("" + sb.toString());
			} else {
				System.out.println(con.getResponseMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return sb.toString();

	}

	private static String getQuery(List<NameValuePair> params) throws UnsupportedEncodingException {
		StringBuilder result = new StringBuilder();
		boolean first = true;

		for (NameValuePair pair : params) {
			if (first)
				first = false;
			else
				result.append("&");

			result.append(URLEncoder.encode(pair.getName(), "UTF-8"));
			result.append("=");
			result.append(URLEncoder.encode(pair.getValue(), "UTF-8"));
		}

		return result.toString();
	}
}
