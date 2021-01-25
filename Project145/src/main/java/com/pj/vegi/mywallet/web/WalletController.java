package com.pj.vegi.mywallet.web;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.google.gson.Gson;
import com.pj.vegi.mywallet.vo.DepositReqListVO;
import com.pj.vegi.mywallet.vo.DepositReqVO;
import com.pj.vegi.mywallet.vo.DepositResponseVO;
import com.pj.vegi.mywallet.vo.WithDrawReqVO;
import com.pj.vegi.mywallet.vo.WithDrawResVO;

import net.sf.json.JSONObject;

@Controller
public class WalletController {

	// 계좌등록
	@RequestMapping("/AuthAccount.do")
	public String GetAccount() throws SQLException {

		String url = "https://testapi.openbanking.or.kr/oauth/2.0/authorize_account";
		String response_type = "code";
		String client_id = "6Y2QQh8lyuIXTDJKP3NMp3avlHUbmXN41pMuaIa7";
		String redirect_uri = "http://localhost/Callback.do";
		String scope = "login inquiry transfer";
		String state = "12345678901234567890123456789012";
		String auth_type = "0";

		StringBuilder qstr = new StringBuilder();
		qstr.append("response_type=" + response_type).append("&client_id=" + client_id)
				.append("&redirect_uri=" + redirect_uri).append("&scope=" + scope).append("&state=" + state)
				.append("&auth_type=" + auth_type);

		return "redirect:" + url + "?" + qstr.toString();
	}

	@RequestMapping("/Callback.do")
	public String Callback(HttpServletRequest request, Model model) {

		// redirect_uri 에 있는 코드
		String code = request.getParameter("code"); // 오픈뱅킹에서 휴대폰인증 후 임시토큰을 받음.->access토큰을 받아올 수 있음.
		System.out.println("code : " + code);

		// access token 발급받기
		String result = OpenBank.getAccessToken(code);

		JSONObject obj = JSONObject.fromObject(result);
		String access_token = obj.getString("access_token");
		String refresh_token = obj.getString("refresh_token");
		String user_seq_no = obj.getString("user_seq_no");

		request.getSession().setAttribute("access_token", access_token);
		request.getSession().setAttribute("refresh_token", refresh_token);
		request.getSession().setAttribute("user_seq_no", user_seq_no);

		// DB에 저장(accessToken, refreshToken, user_no)

		return "wallet/authAccount";
	}

	// 출금이체 (고객->이용기관) p66
	@RequestMapping("/WithDraw.do")
	public String WithDrawContent(WithDrawReqVO vo, Model model) throws SQLException {

		long randId = System.currentTimeMillis();
		String randIdStr = Long.toString(randId);
		String randNine = randIdStr.substring(randIdStr.length() - 9, randIdStr.length());

		Date today = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatStr = dateformat.format(today);

		vo.setAccess_token(
				"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAwNzY2NzM4Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2MTkzMzgzMDcsImp0aSI6ImZmM2VhNGI1LThhNDQtNDIwNS04ZWFmLTkxYjExZDI0NTBlMSJ9.Lhueq8KK0FX4_wKvPx3yea7XYyT-FyJ-Ki3I-dG7lxI");
		vo.setBank_tran_id("T991676710" + "U" + randNine); // 은행거래고유번호
		vo.setCntr_account_type("N"); // 일반적으로 계좌(N)사용
		vo.setCntr_account_num("3229725561"); // 약정계좌번호
		vo.setFintech_use_num("199167671057888646711668"); // 출금계좌핀테크이용번호
		vo.setDps_print_content("충전금"); // 입금계좌인자내역
		vo.setTran_amt("1000"); // 거래금액
		vo.setTran_dtime(formatStr);
		vo.setReq_client_name("회원1"); // 요청고객성명
		// vo.setReq_client_account_num("987654321"); // 요청고객 계좌번호
		vo.setReq_client_fintech_use_num("199167671057888647046890");
		vo.setReq_client_num("001"); // 요청고객회원번호
		vo.setTransfer_purpose("TR"); // TR:송금 (이체용도)
		vo.setRecv_client_account_num("123456789"); // 최종수취고객 정보
		vo.setRecv_client_name("");
		vo.setRecv_client_bank_code("");

		String result = OpenBank.getWithDraw(vo);

		Gson gson = new Gson();
		WithDrawResVO withDrawContent = gson.fromJson(result, WithDrawResVO.class);

		model.addAttribute("withDrawContent", withDrawContent);

		return "wallet/withDrawContent";
	}

	// 입금이체
	@RequestMapping("/Deposit.do")
	public String DepositContent(Model model, DepositReqListVO req, DepositReqVO vo) throws SQLException {

		long randId = System.currentTimeMillis();
		String randIdStr = Long.toString(randId);
		String randNine = randIdStr.substring(randIdStr.length() - 9, randIdStr.length());

		Date today = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyyMMddHHmmss");
		String formatStr = dateformat.format(today);

		ArrayList<DepositReqListVO> reqList = new ArrayList<DepositReqListVO>();
		req.setTran_no("1"); // 거래순번
		req.setBank_tran_id("T991676710" + "U" + randNine); // 은행거래고유번호
		req.setFintech_use_num("199167671057888646711668"); // 핀테크이용번호
		req.setPrint_content("인출");
		req.setTran_amt("10000"); // 거래금액
		req.setReq_client_name("회원1"); // 요청고객성명
		req.setReq_client_num("001"); // 요청고객회원번호
		req.setTransfer_purpose("TR"); // TR:송금 (이체용도)
		reqList.add(req);

		vo.setCntr_account_type("N"); // 일반적으로 계좌(N)사용
		vo.setCntr_account_num("2105853150"); // 약정계좌번호
		vo.setWd_pass_phrase("NONE"); // (테스트 환경) 기본값 "NONE"를 세팅
		vo.setWd_print_content("충전금 인출"); // 내역
		vo.setName_check_option("on"); // 수취인성명 검증 여부
		vo.setTran_dtime(formatStr);
		vo.setReq_cnt("1"); // 입금요청건수 (default :1)
		vo.setReq_list(reqList);

		String result = OpenBank.getDeposit(vo);

		Gson gson = new Gson();
		DepositResponseVO depositContent = gson.fromJson(result, DepositResponseVO.class);

		model.addAttribute("depositContent", depositContent.get_res_list());

		return "wallet/depositContent";
	}
}
