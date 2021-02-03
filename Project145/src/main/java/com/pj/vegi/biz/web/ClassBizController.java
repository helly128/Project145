package com.pj.vegi.biz.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.vo.LecturerVo;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;

@Controller
public class ClassBizController {

	@Autowired
	ClassBizService classBizService;

	@RequestMapping("/classBizList.do")
	public String classBizList(Model model, HttpSession session, LessonVO vo) {
		System.out.println("리스트 찾아오기");
		String mId = (String) session.getAttribute("mId");
		System.out.println(mId);
		vo.setMId(mId);
		List<LessonVO> classList = classBizService.classBizList(vo);
		model.addAttribute("classList", classList);

		return "biz/classList";
	}

	@RequestMapping("/classRegForm.do")
	public String classRegForm() {
		System.out.println("클래스 등록폼");

		return "biz/classRegForm";

	}

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/classBizSelect.do")
	public String classBizSelect(Model model, LessonVO cvo, LecturerVo lvo, MemberVo vo) throws SQLException {

		LessonVO classVo = classBizService.classBizSelect(cvo);
		System.out.println(classVo);

		LecturerVo lecVo = classBizService.lecBizSelect(lvo);
		System.out.println(lecVo);
		
		vo.setMId(lecVo.getMId());
		MemberVo mvo = memberService.memberSelect(vo);
		System.out.println(mvo);
		
		model.addAttribute("classVo", classVo);
		model.addAttribute("lecVo", lecVo);
		model.addAttribute("mvo", mvo);
		return "biz/classSelect";
	}

	@RequestMapping("/classBizEdit.do")
	public String classBizEdit(Model model, LessonVO cvo, LecturerVo lvo, MemberVo vo) throws SQLException {
		LessonVO classVo = classBizService.classBizSelect(cvo);
		System.out.println(classVo);

		LecturerVo lecVo = classBizService.lecBizSelect(lvo);
		System.out.println(lecVo);
		
		vo.setMId(lecVo.getMId());
		MemberVo mvo = memberService.memberSelect(vo);
		System.out.println(mvo);
		
		model.addAttribute("classVo", classVo);
		model.addAttribute("lecVo", lecVo);
		model.addAttribute("mvo", mvo);
		return "biz/classEdit";
	}

	
	@RequestMapping("/myCareerUpdate.do")
	public int myCareerUpdate(@RequestParam String career, Model model, HttpSession session, MemberVo vo) {
		vo.setCareer(career);
		System.out.println(career);
		System.out.println(session.getId());
		vo.setMId(session.getId());
		int n = 0;
		n = classBizService.myCareerUpdate(vo);
		return n;
	}
	
	
	@RequestMapping("/classBizInsert.do")
	public String classBizInsert(Model model, HttpSession session, LessonVO cvo, MemberVo mvo, LecturerVo lvo,
			@RequestParam String proposal) {
		// 클래스 cvo에 담긴 파라메터들 확인
		System.out.println("클래스를 생성한다.");
		System.out.println("클래스" + cvo);
		String lstatus = "개설완료";
		//System.out.println("엠아이디랑 렉쳐아이디랑 비교" + cvo.getMId());
		//if (!lecId.equals(lecturerId1) && !lecId.equals(lecturerId2)) {
		//	lstatus = "강사승인대기";
		//} // 상태 설정
		cvo.setStatus(lstatus);
		System.out.println("사업자 번호 찾기");
		// mId로 사업자 번호 찾고 설정
		MemberVo bizNumVo = classBizService.classBizNum(mvo);
		String bizNum = bizNumVo.getBizNum();
		System.out.println("사업자 번호는 " + bizNum);
		cvo.setBizNum(bizNum); // cvo에 사업자 번호 담아 주기
		System.out.println("cvo사업자 번호는 " + cvo.getBizNum());

		
		// 클래스 인서트 ! 생성하기
		int n = 0;
		n = classBizService.classBizInsert(cvo);
		System.out.println("클래스" + n + "건 입력 완료");

		// 강사 생성하기
//		lvo.setBizNum(bizNum);
//		lvo.setCId(cvo.getCId()); // cID찾아옴
//		lvo.setProposal(proposal);
//		n = classBizService.classLecturerInsert(lvo);
//		System.out.println("강사" + n + "건 입력 완료");
//
//		System.out.println("강사정보 " + lvo);
		// 강사 정보넣기

		return "/classBizList.do";
	}
}