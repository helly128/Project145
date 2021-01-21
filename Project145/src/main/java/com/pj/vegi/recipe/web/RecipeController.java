package com.pj.vegi.recipe.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {

	@RequestMapping("/recipeMain.do")
	public String recipeMain() {
		
		return "recipe/recipeMain";
	}
	@RequestMapping("/recipeBegan.do")
	public String recipeBegan() {
		
		return "recipe/recipeBegan";
	}
	@RequestMapping("/recipeRacto.do")
	public String recipeRacto() {
		
		return "recipe/recipeRacto";
	}
	@RequestMapping("/recipeOvo.do")
	public String recipeOvo() {
		
		return "recipe/recipeOvo";
	}
	@RequestMapping("/recipeRactoOvo.do")
	public String recipeRactoOvo() {
		
		return "recipe/recipeRactoOvo";
	}
	
	@RequestMapping("/recipeDesc.do")
	public String recipeDesc() {
		
		return "recipe/recipeDesc";
	}
	
}
