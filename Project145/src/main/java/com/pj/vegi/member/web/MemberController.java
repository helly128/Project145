package com.pj.vegi.member.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.naverLoginApi.NaverLoginBo;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestaurantVo;
import com.pj.vegi.vo.VegimeetVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService; // MemberServiceImpl 객체 자동주입 -> @Service("memberService")와 같은이름

	@RequestMapping("/")
	public String main(Model model, LessonVO l_vo, VegimeetVo m_vo, RestaurantVo rest_vo, RecipeVo rec_vo) {
		
		List<Map> mainListLesson = memberService.mainLesson(l_vo);
		model.addAttribute("mainListLesson", mainListLesson);
		
		List<Map> mainListMeet = memberService.mainMeet(m_vo);
		model.addAttribute("mainListMeet", mainListMeet);
		
		List<Map> mainListRest = memberService.mainRest(rest_vo);
		model.addAttribute("mainListRest", mainListRest);
		
		List<Map> mainListRecipe = memberService.mainRecipe(rec_vo);
		model.addAttribute("mainListRecipe", mainListRecipe);
		
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
		} else {
			old_url = "redirect:/loginForm.do";
		}

		System.out.println(" 처리이전페이지 ======> " + old_url);
		response.sendRedirect(old_url);

	}

	@ResponseBody
	@RequestMapping("/LoginCheck.do")
	public String LoginCheck(Model model, HttpSession session, MemberVo vo) throws SQLException {

//		String mid = (String) session.getAttribute("mId");
//		vo.setMId(mid);

		boolean check = memberService.memberLoginCheck(vo);
		String result = null;

		if (check == true) {
			result = "true";
		} else {
			result = "false";
		}

		System.out.println("result값" + result);

		return result;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws SQLException, IOException {
		String old_url = "/main.do";
		String ref = (String) session.getAttribute("referer");
		if (ref != null) {
			old_url = ref;
		}
		session.invalidate();
		return "redirect:" + old_url;
	}

	@RequestMapping("/naverResult.do")
	public String naverResult(MemberVo vo) {

		return "login/naverSuccess";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback")
	public String callback(MemberVo vo, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, SQLException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBo.getUserProfile(oauthToken);
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jnode = mapper.readTree(apiResult);
		String mId = (String) jnode.get("response").get("id").textValue();
		String email = (String) (jnode.get("response").get("email").textValue());
		String mName = (String) (jnode.get("response").get("name").textValue());
		
		boolean check = memberService.naverLoginCheck(vo);
		System.out.println("=============="+vo);
		String result = null;

		if (check != true) {// 새로운 네이버 로그인
			System.out.println("~~~~~~~~~if~~~~");
			
			vo.setMId(mId);
			vo.setEmail(email);
			vo.setMName(mName);
			int n = memberService.naverInsert(vo);

			if (n != 0) {
				session.setAttribute("mName", mName);
				session.setAttribute(email, email);
				session.setAttribute("password", vo.getPassword());
				session.setAttribute("mId", mId);
				session.setAttribute("auth", "user");
				result = "redirect:naverResult.do";
			} else {
				result = "redirect:/loginForm.do";
			}
		} else {// 이미저장된네이버로 로그인
			System.out.println("~~~~~~~~else~~~~");
			// 로그인 사용자 정보를 읽어온다.
			session.setAttribute("mName", mName);
			session.setAttribute("email", email);
			session.setAttribute("password", vo.getPassword());
			session.setAttribute("mId", mId);
			session.setAttribute("auth", "user");
			result = "redirect:naverResult.do";
		}

//		String viewPath = "";
//		if (n != 0)
//			viewPath = "redirect:naverResult.do";
//		else
//			viewPath = "redirect:/loginForm.do";

		/* 네이버 로그인 성공 페이지 View 호출 */
		return result;
	}

	
}
