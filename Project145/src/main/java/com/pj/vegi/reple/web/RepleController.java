package com.pj.vegi.reple.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.pj.vegi.common.Paging;
import com.pj.vegi.reple.service.RepleService;
import com.pj.vegi.vo.RepleVo;

@RestController
@RequestMapping("/reple/*")
public class RepleController {
	@Autowired
	RepleService service;

	// 목록 조회
	@RequestMapping(value = "/reple.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> readAll(RepleVo vo, Paging paging) {
		paging.setPageUnit(5);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());
		int cnt = service.countReple(vo);
		paging.setTotalRecord(cnt);
		List<RepleVo> list = service.readAll(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("paging", paging);
		return map;
	}

	// 댓글 입력
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

	// 댓글 단건 조회
	@GetMapping(value = "/{reId}", produces = { MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<RepleVo> get(@PathVariable("reId") int reId) {

		System.out.println("get: " + reId);

		return new ResponseEntity<>(service.read(reId), HttpStatus.OK);
	}

	// 댓글 등록
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{reId}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody RepleVo vo, @PathVariable("rId") int rId) {

		return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	// 댓글 삭제
	@RequestMapping(value = "/reple.do/{reId}", method = RequestMethod.DELETE)
	@ResponseBody
	public RepleVo delete(@PathVariable String reId, RepleVo vo) {
		vo.setReId(reId);
		service.delete(vo);
		return vo;
	}

	// 대댓글 등록

//	@RequestMapping(method = { RequestMethod.PUT,
//			RequestMethod.PATCH }, value = "/{reId}", consumes = "application/json", produces = {
//					MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> repleInsert(@RequestBody RepleVo vo, @PathVariable("rId") int rId) {
//
//		return service.repleInsert(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//
//	}

}
