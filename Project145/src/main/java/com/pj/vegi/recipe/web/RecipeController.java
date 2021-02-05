package com.pj.vegi.recipe.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.pj.vegi.common.ImageIO;
import com.pj.vegi.common.Paging;
import com.pj.vegi.recipe.service.RecipeService;
import com.pj.vegi.recipeMaterial.service.RecipeMaterialService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.RecipeMaterialVo;
import com.pj.vegi.vo.RecipeVo;

@Controller
public class RecipeController {

	@Autowired
	RecipeService recipeService;

	@Autowired
	RecipeMaterialService rmService;

	@RequestMapping("/recipeMain.do") // 게시글 페이징 처리 추가하기
	public String recipeMain(@ModelAttribute("vo") RecipeVo vo, Model model, Paging paging, HttpSession session) {
		
		String mid = (String) session.getAttribute("mId");
		vo.setMId(mid);
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
		for(RecipeVo recipe_vo : recipes) {
			LikeListVo like_vo = new LikeListVo();
			like_vo.setMId(mid);
			like_vo.setOriginId(((RecipeVo) recipe_vo).getRId());
			((RecipeVo) recipe_vo).setLikeFlag(recipeService.likeFlagSelect(like_vo));
		}
		model.addAttribute("recipes", recipes);
		model.addAttribute("paging", paging);
		
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

	/*
	 * @Autowired LessonService lessonService;
	 */
	@Autowired
	RecipeMaterialService recipeMaterialService;

	@RequestMapping("/recipeDesc.do") // 단건 상세 보기 페이지
	public String recipeDesc(LessonVO lVo, RecipeVo rVo, RecipeMaterialVo rmVo, Model model, HttpSession session)
			throws SQLException {
		RecipeVo recipeVo = recipeService.recipeSelect(rVo);
		List<RecipeMaterialVo> recipeMaterialSelectList = recipeMaterialService.recipeMaterialSelect(rmVo);

		List<LessonVO> lessons = recipeService.lessonSearch(lVo);
		session.setAttribute("rId", rVo.getRId());
		model.addAttribute("recipeSelect", recipeVo);
		model.addAttribute("lessons", lessons);
		model.addAttribute("recipeMaterial", recipeMaterialSelectList);

		return "recipe/recipeDesc";
	}

	@RequestMapping("/recipeInsert.do") // 등록 폼
	public String recipeInsert() {

		return "recipe/recipeInsert";
	}
	
	
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

	@RequestMapping(value="/recipeUpdateResult.do",method=RequestMethod.POST) // 수정 처리
	public String recipeUpdateResult(RecipeMaterialVo rmVo,LessonVO lVo, RecipeVo vo, Model model, HttpServletRequest request,
			@RequestParam(name = "rImageFile") MultipartFile rImage) throws IllegalStateException, IOException, SQLException {
		// 사진 업로드 처리
		if (rImage != null && rImage.getSize() > 0) {
			String name = ImageIO.imageUpload(request, rImage);
			vo.setRImage(name);
		}
		vo.setCId(vo.getCIdArr().toString()); 
		recipeService.recipeUpdate(vo);
		List<RecipeMaterialVo> matList = rmVo.getRecipeMatVoList();
		for(RecipeMaterialVo rmVo1 : matList) {
			recipeMaterialService.recipeMaterialUpdate(rmVo1);
		}
		recipeService.recipeLessonSearch(lVo);
		model.addAttribute("cId", lVo.getCId());
		model.addAttribute("rId", vo.getRId());
		
		return "redirect:recipeDesc.do";

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
	public List<LessonVO> lessonSearch(LessonVO param, HttpServletRequest request,LessonVO lvo) {
		// ModelAndView mav = new ModelAndView();
//		 System.out.println("컨트롤러에서 넘기는 값 : "+keyword);
		
		return recipeService.lessonSearch(param);  

	}
	@PostMapping(value="/recipeLessonSearch.do")
	@ResponseBody
	public List<LessonVO> recipeLessonSearch(LessonVO param, HttpServletRequest request,LessonVO lvo) {
		// ModelAndView mav = new ModelAndView();
//		 System.out.println("컨트롤러에서 넘기는 값 : "+keyword);
		
		return recipeService.recipeLessonSearch(param);  

	}
	
	// 좋아요
		@ResponseBody
		@RequestMapping("/recipeLike.do/{rId}")
		public void vegimeetLike(@PathVariable String rId, HttpSession session) {
			LikeListVo vo = new LikeListVo();
			vo.setMId((String) session.getAttribute("mId"));
			vo.setOriginId(rId);
			recipeService.likeInsert(vo);
		}

		// 좋아요 취소
		@ResponseBody
		@RequestMapping("/recipeUnlike.do/{rId}")
		public void vegimeetUnlike(@PathVariable String rId, HttpSession session) {
			LikeListVo vo = new LikeListVo();
			vo.setMId((String) session.getAttribute("mId"));
			vo.setOriginId(rId);
			recipeService.likeDelete(vo);
		}

//	// 검색
//	@RequestMapping(value = "/recipeLesson.do", method = RequestMethod.GET)
//	@ResponseBody
//	public List<LessonVO> readAll(LessonVO lvo) {
//		List<LessonVO> list = recipeService.lessonSearch(lvo);
//		return list;
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
