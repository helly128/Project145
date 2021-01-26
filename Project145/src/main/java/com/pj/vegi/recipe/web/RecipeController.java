package com.pj.vegi.recipe.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String recipeDesc(RecipeVo rVo,RecipeMaterialVo rmVo,Model model,HttpSession session) throws SQLException {
		RecipeVo recipeVo = recipeService.recipeSelect(rVo);
		List<RecipeMaterialVo> recipeMaterialSelectList = recipeMaterialService.recipeMaterialSelect(rmVo);
		
		LessonVO lessonVo = new LessonVO();
		lessonVo.setCId(recipeVo.getCId());
		List<LessonVO> lessonSelectList = lessonService.lessonList(lessonVo);
		session.setAttribute("rId", rVo.getRId());
		model.addAttribute("recipeSelect", recipeVo);
		model.addAttribute("lessonSelectList",lessonSelectList);
		model.addAttribute("recipeMaterial",recipeMaterialSelectList);
		
		return "recipe/recipeDesc";
	}

	@RequestMapping("/recipeInsert.do") // 등록 폼
	public String recipeInsert(RecipeVo vo, Model model) {

		return "recipe/recipeInsert.do";
	}

	@RequestMapping("/recipeUpdate.do") // 수정 폼
	public String recipeUpdate() {

		return "recipe/recipeUpdate";
	}

//	@RequestMapping("/recipeDelete.do")//삭제
//	public String recipeDelete(RecipeVo vo) {
//		String viewPath = null;
//		int n= recipeService.recipeDelete(vo);
//		if(n!=0)
//			viewPath = "redirect:recipeMain.do";
//		else
//			viewPath = "recipe/recipeDeleteFail";
//		return viewPath;
//	}
//	
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
