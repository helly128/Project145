package com.pj.vegi.member.web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.naverLoginApi.NaverLoginBo;
import com.pj.vegi.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService; // MemberServiceImpl 객체 자동주입 -> @Service("memberService")와 같은이름

	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}

	/* NaverLoginBo */
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBo(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}

	@RequestMapping("/loginForm.do")
	public String loginForm(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String old_url = request.getHeader("Referer");
		session.setAttribute("referer", old_url);
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "login/loginForm";
	}

	@RequestMapping("/loginResult.do")
	public void loginResult(MemberVo vo, Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {
		boolean check = memberService.memberLoginCheck(vo);
		String old_url = "/main.do";
		if (check == true) {
			session.setAttribute("mId", vo.getMId());
			vo = memberService.memberSelect(vo);
			session.setAttribute("auth", vo.getAuth());
			session.setAttribute("vType", vo.getVegtype());

			String ref = (String) session.getAttribute("referer");
			if (ref != null) {
				old_url = ref;
			}
		}else {
			 old_url="redirect:/loginForm.do";
		}

		System.out.println(" 처리이전페이지 ======> " + old_url);
		response.sendRedirect(old_url);

	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws SQLException, IOException {
		session.invalidate();
		return "redirect:/main.do";
	}

	@RequestMapping("/naverResult.do")
	public String naverResult()  {

		return "login/naverSuccess";
	}
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback")
	public String callback(Model model,MemberVo vo, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBo.getUserProfile(oauthToken);
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jnode = mapper.readTree(apiResult);
		String naverId = (String)jnode.get("response").get("id").textValue();
		String naverEmail = (String)(jnode.get("response").get("email").textValue());
		String naverName = (String)(jnode.get("response").get("name").textValue());
		  
		session.setAttribute("name", naverName);
		session.setAttribute("mId", naverId);
		session.setAttribute("auth", "user");
		
		/* 네이버 로그인 성공 페이지 View 호출 */
		return "redirect:naverResult.do";
	}


	private static final String mydomain = "http%3A%2F%2Flocalhost%3A8088%2Fcallback.do";

	private static final String clientId = "1P0F_fye7hGWfHa0ztCe";

	private static final String clientSecret = "Psh1g_HCW9";

	private static final String requestUrl = "https://nid.naver.com/oauth2.0/authorize?client_id=" + clientId
			+ "&response_type=code&redirect_uri=" + mydomain + "&state=";
}
