package com.pj.vegi.member.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService; // MemberServiceImpl 객체 자동주입 -> @Service("memberService")와 같은이름

	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm() {

		return "login/loginForm";
	}

	@RequestMapping("/loginResult.do")
	public String loginResult(MemberVo vo, Model model, HttpSession session) throws SQLException {
		String viewPath = null;
		boolean check = memberService.memberLoginCheck(vo);

		session.setAttribute("mId", vo.getMId());
		session.setAttribute("auth", vo.getAuth());

		if (check == true) {
			viewPath = "redirect:/main.do";

		} else {
			viewPath = "login/loginFail";
		}

		return viewPath;
	}

	@RequestMapping("/logout.do")
	public String logout(MemberVo vo, Model model, HttpSession session) throws SQLException {
		session.invalidate();
		return "redirect:/";

	}

	@RequestMapping("/callback.do")
	public String callback(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String clientId = "1P0F_fye7hGWfHa0ztCe";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "Psh1g_HCW9";// 애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost/callback.do", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		System.out.println("apiURL=" + apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				response.getWriter().println(res.toString());
				/* json 파싱 */
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONPObject jsonObj = (JSONPObject) obj;

			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "login/callback";
	}

	@RequestMapping(value = "/personalInfo")
	public void personalInfo(HttpServletRequest request) throws Exception {
		String token = "YOUR_ACCESS_TOKEN";// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
//			String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
	}

//	
	
	private static final String mydomain = "http%3A%2F%2Flocalhost%3A8088%2Fcallback.do";

	private static final String clientId = "1P0F_fye7hGWfHa0ztCe";

	private static final String clientSecret = "Psh1g_HCW9";

	private static final String requestUrl = "https://nid.naver.com/oauth2.0/authorize?client_id=" + clientId + "&response_type=code&redirect_uri="+ mydomain + "&state="; 
}
