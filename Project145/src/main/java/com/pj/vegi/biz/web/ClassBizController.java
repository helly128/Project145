package com.pj.vegi.biz.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pj.vegi.biz.service.ClassBizService;
import com.pj.vegi.common.ImageIO;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.vo.LecturerVo;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.enquiryVO;

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
	public String classRegForm(Model model, MemberVo vo,LessonVO cvo, HttpSession session) throws SQLException, JsonProcessingException {
		System.out.println("클래스 등록폼");
		String mId = (String) session.getAttribute("mId");
		System.out.println(mId+"세션아이디입니다.");
		vo.setMId(mId);
		//mId로 member의 정보 가져오기. 
		MemberVo vo2 = memberService.memberSelect(vo);
		String bizNum = vo2.getBizNum();
		
		System.out.println(bizNum +"사업자번호 아래의 모든 강사의 MemberVo List를 찾습니다.");
		List<MemberVo> lecList = classBizService.getLecList(bizNum);
		//비즈넘버 아래의 강사 리스트 가져오기.
		System.out.println(lecList);
		ObjectMapper lecturer = new ObjectMapper();
		
		model.addAttribute("mvo", vo2);
		model.addAttribute("lecList", lecList);
		model.addAttribute("lecList2", lecturer.writeValueAsString(lecList));

		return "biz/classRegForm";

	}
	
	//에디트에서 강사 아이디 검색
	@ResponseBody
	@RequestMapping("/classlecList.do")
	public MemberVo classlecList(Model model, MemberVo vo,LessonVO cvo, HttpSession session) throws SQLException, JsonProcessingException {
		System.out.println("클래스강사 검색");
		MemberVo mvo = memberService.memberSelect(vo);
		System.out.println(mvo+"============입니다");
		//mId로 member의 정보 가져오기. 
		model.addAttribute("mvo", mvo);
		return mvo;

	}
	

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/classBizSelect.do")
	public String classBizSelect(Model model, LessonVO cvo, LecturerVo lvo, MemberVo vo) throws SQLException {

		LessonVO classVo = classBizService.classBizSelect(cvo);
		System.out.println(classVo);

		vo.setMId(classVo.getLecId());
		MemberVo mvo = memberService.memberSelect(vo);
		System.out.println(mvo);
		
		model.addAttribute("classVo", classVo);
		model.addAttribute("mvo", mvo);
		return "biz/classSelect";
	}

	@RequestMapping("/classBizEdit.do")
	public String classBizEdit(Model model, LessonVO cvo, LecturerVo lvo, HttpSession session,MemberVo vo) throws SQLException, JsonProcessingException {
		String mId = (String) session.getAttribute("mId");
		vo.setMId(mId);
		MemberVo svo = memberService.memberSelect(vo);

		LessonVO classVo = classBizService.classBizSelect(cvo);
		System.out.println(classVo);
		
		vo.setMId(classVo.getLecId());
		MemberVo mvo = memberService.memberSelect(vo);
		System.out.println(mvo);
		
		System.out.println("사업자번호 아래의 모든 강사의 MemberVo List를 찾습니다.");
		String bizNum = classVo.getBizNum();
		List<MemberVo> lecList = classBizService.getLecList(bizNum);
		//비즈넘버 아래의 강사 리스트 가져오기.
		System.out.println(lecList);
		ObjectMapper lecturer = new ObjectMapper();
		model.addAttribute("svo", svo);
		model.addAttribute("classVo", classVo);
		model.addAttribute("mvo", mvo);
		model.addAttribute("lecList2", lecturer.writeValueAsString(lecList));
		return "biz/classEdit";
	}
	
	
	
	@RequestMapping("/classBizUpdate.do") //클래스 등록
	public String classBizUpdate(Model model, HttpSession session, LessonVO cvo, MemberVo mvo, @RequestParam MultipartFile uploadfile, HttpServletRequest request) throws IllegalStateException, IOException {
		String mId = (String) session.getAttribute("mId");
		// 클래스 cvo에 담긴 파라메터들 확인
		System.out.println("클래스를 생성한다.");
		
		//베지타입 아무것도 안들어오면 비건 처리
		if(cvo.getVegType()=="") {
			cvo.setVegType("비건");
		}
		//강사 아이디가 세션아이디와 같으면 개설완료 그 외에는 승인대기임
		//이거 왜 안됨?
		
		System.out.println("사업자 번호 찾기");
		// mId로 사업자 번호 찾고 설정
		MemberVo bizNumVo = classBizService.classBizNum(mvo);
		String bizNum = bizNumVo.getBizNum();
		System.out.println("사업자 번호는 " + bizNum);
		cvo.setBizNum(bizNum); // cvo에 사업자 번호 담아 주기
		System.out.println("cvo사업자 번호는 " + cvo.getBizNum());
		System.out.println("클래스정보보기" + cvo);
		
		//업로드 처리
			if (uploadfile != null && uploadfile.getSize() > 0) {
				System.out.println(cvo.getCImg());
				String name = ImageIO.imageUpload(request, uploadfile,cvo.getCImg());
				cvo.setCImg(name);
			}
		
		// 클래스 인서트 ! 생성하기
		int n = 0;
		n = classBizService.classBizUpdate(cvo);
		System.out.println("클래스" + n + "건 입력 완료");
		
		

		return "redirect:classBizList.do";
	}
	
	

	@ResponseBody
	@RequestMapping("/myCareerUpdate.do")
	public int myCareerUpdate(@RequestParam String career, Model model, HttpSession session, MemberVo vo, LessonVO cvo) {
		vo.setCareer(career);
		System.out.println(career);
		String mId = (String) session.getAttribute("mId");
		System.out.println(mId+"입니다.");
		
		int m = 0;
		System.out.println(cvo+"=======이래=====");
		m = classBizService.enqBizDelete(cvo);
		System.out.println(m+"건 기존 요청 삭제함.");
		String status ="개설완료";
		cvo.setStatus(status);
		
		int s = classBizService.lecIdUpdate(cvo);
		System.out.println(s + "건 입력완료");
		
		vo.setMId(mId);
		vo.setCareer(career);
		int n = 0;
		n = classBizService.myCareerUpdate(vo);
		System.out.println(n + "건 입력완료");
		return n;
	}
	
	@ResponseBody
	@RequestMapping("/applyCollabo.do")
	public int applyCollabo(Model model, HttpSession session, LessonVO cvo, enquiryVO enqvo) {
		System.out.println("출력할cId는"+ cvo.getCId());
		
		int m = 0;
		m = classBizService.enqBizDelete(cvo);
		System.out.println(m+"건 기존 요청 삭제함.");
		
		int s = 0;
		String status= "강사승인대기";
		cvo.setStatus(status);
		cvo.setLecId(enqvo.getOriginId());
		s = classBizService.lecIdUpdate(cvo);
		System.out.println( s +"건 클래스에 업데이트");
		
		int n = 0;
		enqvo.setMId(cvo.getCId());//클래스 아이디가 글쓴이 자리에 들어감
		System.out.println("======콜라보는 "+enqvo+"======");
		n = classBizService.applyCollabo(enqvo);
		System.out.println("콜라보 문의" + n + "건 입력 완료");
		
		return n;
	}
	
	@RequestMapping("/classBizDelete.do")
	public String classBizDelete(Model model, LessonVO vo) {
		int n = 0;
		n = classBizService.classBizDelete(vo);
		
		System.out.println(n+"건 삭제 완료");
		return "redirect:classBizList.do";
	}
	
	
	@RequestMapping("/classBizInsert.do") //클래스 등록
	public String classBizInsert(Model model, HttpSession session, LessonVO cvo, MemberVo mvo, enquiryVO enqvo,  @RequestParam MultipartFile uploadfile, HttpServletRequest request) throws IllegalStateException, IOException {
		String mId = (String) session.getAttribute("mId");
		// 클래스 cvo에 담긴 파라메터들 확인
		System.out.println("클래스를 생성한다.");
		
		//베지타입 아무것도 안들어오면 비건 처리
		if(cvo.getVegType()=="") {
			cvo.setVegType("비건");
		}
		
		// mId로 사업자 번호 찾고 설정
		MemberVo bizNumVo = classBizService.classBizNum(mvo);
		String bizNum = bizNumVo.getBizNum();
		System.out.println("사업자 번호는 " + bizNum);
		cvo.setBizNum(bizNum); // cvo에 사업자 번호 담아 주기
		System.out.println("cvo사업자 번호는 " + cvo.getBizNum());
		System.out.println("클래스정보보기" + cvo);
		
		//업로드 처리
			if (uploadfile != null && uploadfile.getSize() > 0) {
				String name = ImageIO.imageUpload(request, uploadfile);

				cvo.setCImg(name);
			}
			//강사 아이디가 세션아이디와 같으면 개설완료 그 외에는 승인대기임
			String lstatus = "";
			if (mvo.getLecId()!=mId) {
				lstatus = "강사승인대기";
				cvo.setStatus(lstatus);
				}else {
					lstatus ="개설완료";
					cvo.setStatus(lstatus);
				}
			
			System.out.println("사업자 번호 찾기");
		// 클래스 인서트 ! 생성하기
		int n = 0;
		n = classBizService.classBizInsert(cvo);
		System.out.println("클래스" + n + "건 입력 완료");
		
		//lstatus가 강사 승인 대기 일때, 문의 테이블에 문의 내용 등록 originId 를 classId로 ! 
		int m = 0;
		
		enqvo.setMId("class"+cvo.getCId());//클래스 아이디가 글쓴이 자리에 들어감
		enqvo.setOriginId(cvo.getLecId());
		System.out.println("콜라보는 "+enqvo);
		m = classBizService.applyCollabo(enqvo);
		System.out.println("콜라보 문의" + m + "건 입력 완료");
		
		

		return "redirect:classBizList.do";
	}
	
	@RequestMapping("/enquiryList.do")
	public String enquiryList(Model model, HttpSession session, enquiryVO vo) {
		
		String mId = (String) session.getAttribute("mId");
		System.out.println("받은 목록 리스트 찾아오기");
		vo.setMId(mId);
		List<enquiryVO> cEnqList = classBizService.classEnquiryList(vo);
		model.addAttribute("cEnqList", cEnqList);
		
		List<enquiryVO> myEnqList = classBizService.myEnquiryList(vo);
		model.addAttribute("myEnqList", myEnqList);

		return "biz/enquiryList";
	}
	@ResponseBody
	@RequestMapping("/enqAccepted")
	public int enqAccepted(Model model, HttpSession session, enquiryVO evo, LessonVO cvo) {
		int n = 0;
		String result = "accepted";
		evo.setEnqType(result);
		System.out.println("결과는" + evo);
		n = classBizService.enqAccepted(evo); 
		// 클래스에 lecId로 등록하기 
		String mId = (String) session.getAttribute("mId");
		cvo.setLecId(mId);
		System.out.println("넘겨줄 id는 "+evo.getOriginId());
		String cId= evo.getOriginId();
		cvo.setCId(cId);
		String status = "개설완료";
		cvo.setStatus(status);
		n = classBizService.lecIdUpdate(cvo);
		System.out.println(cvo);
		
		return n;
	}
	
	@ResponseBody
	@RequestMapping("/enqRefused")
	public int enqRefused(Model model, HttpSession session, enquiryVO evo, LessonVO cvo) {
		int n = 0;
		String result = "refused";
		evo.setEnqType(result);
		evo.setEnqResult("거절함");
		System.out.println("결과는" + evo);
		n = classBizService.enqRefused(evo); 
		
		return n;
	}
	
	
}