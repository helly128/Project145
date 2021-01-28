package com.pj.vegi.recipe.web;

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
import org.springframework.web.multipart.MultipartFile;

import com.pj.vegi.common.ImageIO;
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

	@RequestMapping("/recipeMain.do")
	public String recipeMain(Model model, RecipeVo vo) {

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
	public String recipeDesc(LessonVO lVo,RecipeVo rVo, RecipeMaterialVo rmVo, Model model, HttpSession session)
			throws SQLException {
		RecipeVo recipeVo = recipeService.recipeSelect(rVo);
		List<RecipeMaterialVo> recipeMaterialSelectList = recipeMaterialService.recipeMaterialSelect(rmVo);
		
		List<LessonVO> lessons =  lessonService.lessonList(lVo);
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
	public String recipeUpdate(RecipeVo vo, Model model, HttpServletRequest request,
			@RequestParam MultipartFile uploadfile) throws IllegalStateException, IOException {
		// 사진 업로드 처리
		if (uploadfile != null && uploadfile.getSize() > 0) {
			String name = ImageIO.imageUpload(request, uploadfile, vo.getRImage());
			vo.setRImage(name);
		}
		recipeService.recipeUpdate(vo);
		
		model.addAttribute("rId",vo.getRId());
		
		return "redirect:recipeMain.do";
	}

	@RequestMapping("/recipeDelete.do")//삭제
	public String recipeDelete(RecipeVo vo) {
		String viewPath = null;
		int n= recipeService.recipeDelete(vo);
		if(n!=0)
			viewPath = "redirect:recipeMain.do";
		else
			viewPath = "recipe/recipeDeleteFail";
		return viewPath;
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
