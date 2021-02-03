package com.pj.vegi.recipe.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pj.vegi.common.ImageIO;
import com.pj.vegi.common.Paging;
import com.pj.vegi.lesson.service.LessonService;
import com.pj.vegi.recipe.service.RecipeService;
import com.pj.vegi.recipeMaterial.service.RecipeMaterialService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.RecipeMaterialVo;
import com.pj.vegi.vo.RecipeVo;

@Controller
public class RecipeController {

	@Autowired
	RecipeService recipeService;

	@Autowired
	RecipeMaterialService rmService;

	@RequestMapping("/recipeMain.do") // 게시글 페이징 처리 추가하기
	public String recipeMain(Model model, RecipeVo vo, Paging paging) {
		// paging
		paging.setPageUnit(8);
		paging.setPageSize(5);
		// 페이지 번호 파라미터
		if (paging.getPage() == null) { // && paging.getPageUnit(8) ==null
			paging.setPage(1);
		}
		// 한 페이지의 시작/마지막레코드 번호
		vo.setStart(paging.getFirst());
		vo.setEnd(paging.getLast());

		// 전체 건수
		paging.setTotalRecord(recipeService.recipeCount(vo));
		model.addAttribute("paging", paging);
		// data 불러오기
		List<RecipeVo> recipes = recipeService.getRecipeList(vo);
		model.addAttribute("recipes", recipes);

		return "recipe/recipeMain";
	}

	@RequestMapping("/recipeBegan.do")
	public String recipeBegan(Model model, RecipeVo vo) {
		List<RecipeVo> recipes = recipeService.getRecipeList(vo);
		model.addAttribute("recipes", recipes);
		return "recipe/recipeBegan";
	}

	@RequestMapping("/recipeRacto.do")
	public String recipeRacto(Model model, RecipeVo vo) {
		List<RecipeVo> recipes = recipeService.getRecipeList(vo);
		model.addAttribute("recipes", recipes);
		return "recipe/recipeRacto";
	}

	@RequestMapping("/recipeOvo.do")
	public String recipeOvo(Model model, RecipeVo vo) {
		List<RecipeVo> recipes = recipeService.getRecipeList(vo);
		model.addAttribute("recipes", recipes);
		return "recipe/recipeOvo";
	}

	@RequestMapping("/recipeRactoOvo.do")
	public String recipeRactoOvo(Model model, RecipeVo vo) {
		List<RecipeVo> recipes = recipeService.getRecipeList(vo);
		model.addAttribute("recipes", recipes);
		return "recipe/recipeRactoOvo";
	}

	@Autowired
	LessonService lessonService;
	@Autowired
	RecipeMaterialService recipeMaterialService;

	@RequestMapping("/recipeDesc.do") // 단건 상세 보기 페이지
	public String recipeDesc(LessonVO lVo, RecipeVo rVo, RecipeMaterialVo rmVo, Model model, HttpSession session)
			throws SQLException {
		RecipeVo recipeVo = recipeService.recipeSelect(rVo);
		List<RecipeMaterialVo> recipeMaterialSelectList = recipeMaterialService.recipeMaterialSelect(rmVo);

		List<LessonVO> lessons = lessonService.lessonList(lVo);
		session.setAttribute("rId", rVo.getRId());

		model.addAttribute("recipeSelect", recipeVo);
		model.addAttribute("lessons", lessons);
		model.addAttribute("recipeMaterial", recipeMaterialSelectList);

		return "recipe/recipeDesc";
	}

	@RequestMapping("/recipeInsert.do") // 등록 폼
	public String recipeInsert(RecipeVo vo, Model model) {

		return "recipe/recipeInsert";
	}

	@RequestMapping("/recipeUpdate.do") // 수정 폼
	public String recipeUpdate(RecipeVo vo, RecipeMaterialVo rmVo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		RecipeVo recipeVo = recipeService.recipeSelect(vo);
		model.addAttribute("rId", vo.getRId());
		model.addAttribute("select", recipeVo);
		List<RecipeMaterialVo> rms = rmService.recipeMaterialSelect(rmVo);
		model.addAttribute("rm", rms);
		return "recipe/recipeUpdate";
	}

	@RequestMapping("/recipeUpdateResult.do") // 수정 처리
	public String recipeUpdateResult(RecipeMaterialVo rmVo, RecipeVo vo, Model model, HttpServletRequest request,
			@RequestParam MultipartFile uploadFile) throws IllegalStateException, IOException {
		// 사진 업로드 처리
		if (uploadFile != null && uploadFile.getSize() > 0) {
			String name = ImageIO.imageUpload(request, uploadFile, vo.getRImage());
			vo.setRImage(name);
		}
		recipeService.recipeUpdate(vo);
		
		return "redirect:recipeMain.do";

	}

	@RequestMapping("/recipeDelete.do") // 삭제
	public String recipeDelete(RecipeVo vo) {
		String viewPath = null;
		int n = recipeService.recipeDelete(vo);
		if (n != 0)
			viewPath = "redirect:recipeMain.do";
		else
			viewPath = "recipe/recipeDeleteFail";
		return viewPath;
	}

	@PostMapping(value="/lessonSearch.do")
	@ResponseBody
	public List<LessonVO> lessonSearch(@RequestParam Map<String, Object>param, HttpServletRequest request,LessonVO lvo) {
		// ModelAndView mav = new ModelAndView();
//		 System.out.println("컨트롤러에서 넘기는 값 : "+keyword);
		
		return recipeService.lessonSearch(param);  

	}

//	// 검색
//	@RequestMapping(value = "/recipeLesson.do", method = RequestMethod.GET)
//	@ResponseBody
//	public List<LessonVO> readAll(LessonVO lvo) {
//		List<LessonVO> list = recipeService.lessonSearch(lvo);
//		return list;
//	}

	
	
	
	
	
	
	
	
	
	
//	@RequestMapping("/recipeInsertResult.do")
//	public String recipeInsertResult(RecipeVo vo, Model model) {
//		String viewPath = null;
//		int n = recipeService.recipeInsert(vo);
//		if (n != 0)
//			viewPath = "redirect:recipeMain.do";
//		else
//			viewPath = "recipe/recipeInsertFail";
//
//		return viewPath;
//	}
//
//	@RequestMapping("/recipeUpdateResult.do")
//	public String recipeUpdateResult(RecipeVo vo, Model model) {
//		String viewPath = null;
//		int n = recipeService.recipeUpdate(vo);
//		if(n!=0)
//			viewPath = "redirect:recipeMain.do";
//		else
//			viewPath = "recipe/recipeUpdateFail";
//		
//		return viewPath;
//	}
//	
}
