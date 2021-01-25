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
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import com.google.gson.Gson;
import com.pj.vegi.mywallet.vo.DepositReqVO;
import com.pj.vegi.mywallet.vo.TransactionReqVO;
import com.pj.vegi.mywallet.vo.WithDrawReqVO;

/*--------------------------------------------
 * 응답메세지 명세 생성 
API_명세서_토큰발급 API(9p)
1. getAccessToken() 처리 -> 토큰,리토큰,사용자일련번호 받아옴 

API_명세서_등록계좌조회 API(32p)
1. getAccountList() 처리 -> 계좌리스트 받아옴
2. GetAccountList.java 에서 컨트롤

API 명세서_거래내역조회 API(50p)
1. getTransactionList() 처리
-------------------------------------------*/

public class OpenBank {

	// 토큰발급
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

	// API 명세서_등록계좌조회 API_메서드
	public static String getAccountList(String user_seq_no, String access_token) {

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("user_seq_no", user_seq_no));
		postParams.add(new BasicNameValuePair("include_cancel", "Y"));
		postParams.add(new BasicNameValuePair("sort_order", "D"));

		StringBuilder sb = new StringBuilder();
		try {
			String querystr = getQuery(postParams);
			String strUrl = "https://testapi.openbanking.or.kr/v2.0/account/list" + "?" + querystr;
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.addRequestProperty("Authorization", "Bearer" + access_token);

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

	// API 명세서_거래내역조회 API_메서드
	public static String getTransactionList(TransactionReqVO vo) {

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("bank_tran_id", vo.getBank_tran_id()));
		postParams.add(new BasicNameValuePair("fintech_use_num", vo.getFintech_use_num()));
		postParams.add(new BasicNameValuePair("inquiry_type", vo.getInquiry_type()));
		postParams.add(new BasicNameValuePair("inquiry_base", vo.getInquiry_base()));
		postParams.add(new BasicNameValuePair("from_date", vo.getFrom_date()));
		postParams.add(new BasicNameValuePair("to_date", vo.getTo_date()));
		postParams.add(new BasicNameValuePair("sort_order", vo.getSort_order()));
		postParams.add(new BasicNameValuePair("tran_dtime", vo.getTran_dtime()));
		postParams.add(new BasicNameValuePair("access_token", vo.getAccess_token()));

		StringBuilder sb = new StringBuilder();

		try {
			String querystr = getQuery(postParams);
			String strUrl = "https://testapi.openbanking.or.kr/v2.0/account/transaction_list/fin_num" + "?" + querystr;
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.addRequestProperty("Authorization", "Bearer" + vo.getAccess_token());

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

	// 출금이체 POST
	public static String getWithDraw(WithDrawReqVO vo) {

		StringBuilder sb = new StringBuilder();

		try {
			String strUrl = "https://testapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num";
			URL url = new URL(strUrl);

			Gson gson = new Gson();
			String query = gson.toJson(vo);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.addRequestProperty("Authorization", "Bearer" + vo.getAccess_token());

			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
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

	// 입금이체
	public static String getDeposit(DepositReqVO vo) {

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("cntr_account_type", vo.getCntr_account_type()));
		postParams.add(new BasicNameValuePair("cntr_account_num", vo.getCntr_account_num()));
		postParams.add(new BasicNameValuePair("wd_pass_phrase", vo.getWd_pass_phrase()));
		postParams.add(new BasicNameValuePair("wd_print_content", vo.getWd_print_content()));
		postParams.add(new BasicNameValuePair("name_check_option", vo.getName_check_option()));
		postParams.add(new BasicNameValuePair("tran_dtime", vo.getTran_dtime()));
		postParams.add(new BasicNameValuePair("req_cnt", vo.getReq_cnt()));
		postParams.add(new BasicNameValuePair("cntr_account_type", vo.getCntr_account_type()));
		// req_list 받아오는방법?

		StringBuilder sb = new StringBuilder();

		try {
			String querystr = getQuery(postParams);
			String strUrl = "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/fin_num" + "?" + querystr;
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.addRequestProperty("Authorization", "Bearer" + vo.getAccess_token());

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

	// &= 만들어주는 메서드
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
