package com.pj.vegi.reple.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.pj.vegi.reple.service.RepleService;
import com.pj.vegi.vo.RepleVo;

@RestController
@RequestMapping("/reple/*")
public class RepleController {
	@Autowired
	RepleService service;
	//------------------------REST방식-------------------
	// 댓글 목록 조회 REST방식
		@RequestMapping(value = "/reple.do", method = RequestMethod.GET)
		@ResponseBody
		public List<RepleVo> readAll(RepleVo vo) {
			List<RepleVo> list = service.readAll(vo);
			return list;
		}
	// 댓글 입력 REST방식으로json전달
	@RequestMapping(value = "/reple.do", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody RepleVo vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		try {
			String mId = (String) session.getAttribute("mId");
			String rId = (String) session.getAttribute("rId");
			vo.setMId(mId);
			vo.setRId(rId);
			
			service.insert(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 단건 조회 REST방식
	@GetMapping(value = "/{reId}", produces = { MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<RepleVo> get(@PathVariable("reId") int reId) {

		System.out.println("get: " + reId);

		return new ResponseEntity<>(service.read(reId), HttpStatus.OK);
	}

	// 댓글수정 REST방식
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{reId}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody RepleVo vo, @PathVariable("rId") int rId) {

		return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// 댓글삭제 REST방식
	@RequestMapping(value = "/reple.do/{reId}", method = RequestMethod.DELETE)
	@ResponseBody
	public RepleVo delete(@PathVariable String reId, RepleVo vo) {
		vo.setReId(reId);
		service.delete(vo);
		return vo;
	}
	
	
	
	
	
	//------------------------controller방식-------------------
	
//	// 댓글입력
//	@PostMapping("insert.do")
//	public void insert(@ModelAttribute RepleVo vo, HttpSession session) {
//		String m_id = (String) session.getAttribute("mId");
//		vo.setMId(m_id);
//		service.insert(vo);
//	}
	
//	// 댓글 목록 조회(controller방식 뷰페이지 리턴)
//	@RequestMapping("list.do")
//	public ModelAndView list(ModelAndView view, HttpSession session,RepleVo vo) {
//		//paging
//		List<RepleVo>list = service.readAll(vo);
//		//뷰 이름 지정
//		view.setViewName("recipe/recipeDesc");
//		//뷰에 넘길 데이타
//		view.addObject("list", list);
//		return view;
//	}

}
