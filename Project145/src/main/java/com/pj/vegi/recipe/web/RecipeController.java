package com.pj.vegi.recipe.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.pj.vegi.mywallet.vo.WalletHistoryVO;
import com.pj.vegi.recipe.service.RecipeService;
import com.pj.vegi.recipeMaterial.service.RecipeMaterialService;
import com.pj.vegi.reple.service.RepleService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeMaterialVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RepleVo;

@Controller
public class RecipeController {

	@Autowired
	RecipeService recipeService;

	@Autowired
	RecipeMaterialService rmService;
	
	@Autowired
	RepleService repleService;

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
		
		if (vo.getRType() == null || vo.getRType() == "") {
			vo.setRType((String) session.getAttribute("RType"));
			List<RecipeVo> recipes = recipeService.getRecipeList(vo);
			model.addAttribute("recipes", recipes);
		}
		
		String RType = vo.getRType();
		String keyword = vo.getKeyword();
		System.out.println("RType: " + RType);
		model.addAttribute("RType", RType);
		model.addAttribute("keyword", keyword);
		// data 불러오기
		List<RecipeVo> recipes = recipeService.getRecipeList(vo);
		for (RecipeVo recipe_vo : recipes) {
			LikeListVo like_vo = new LikeListVo();
			like_vo.setMId(mid);
			like_vo.setOriginId(((RecipeVo) recipe_vo).getRId());
			((RecipeVo) recipe_vo).setLikeFlag(recipeService.likeFlagSelect(like_vo));
		}

		// 전체 건수
		paging.setTotalRecord(recipeService.recipeCount(vo));
		model.addAttribute("paging", paging);

		model.addAttribute("recipes", recipes);
		model.addAttribute("paging", paging);

		return "recipe/recipeMain";
	}

	/*
	 * @Autowired LessonService lessonService;
	 */
	@Autowired
	RecipeMaterialService recipeMaterialService;

	@RequestMapping("/recipeDesc.do") // 단건 상세 보기 페이지
	public String recipeDesc(RecipeVo rVo, RecipeMaterialVo rmVo, Model model, HttpSession session, Paging paging)
			throws SQLException {
		
		RecipeVo recipeVo = recipeService.recipeSelect(rVo);
		List<RecipeMaterialVo> recipeMaterialSelectList = recipeMaterialService.recipeMaterialSelect(rmVo);

		//댓글 위한 페이징
		paging.setPageUnit(5);
		paging.setPageSize(5);
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		recipeVo.setStart(paging.getFirst());
		recipeVo.setEnd(paging.getLast());
		RepleVo repleVo = new RepleVo();
		repleVo.setRId(rVo.getRId());
		paging.setTotalRecord(repleService.countReple(repleVo));
		List<LessonVO> lessons = new ArrayList<LessonVO>();
		if (recipeVo.getCId() != null) {
			lessons = getLessonList(recipeVo, lessons);
		}
		session.setAttribute("rId", rVo.getRId());
		model.addAttribute("recipeSelect", recipeVo);
		model.addAttribute("lessons", lessons);
		model.addAttribute("recipeMaterial", recipeMaterialSelectList);
		model.addAttribute("paging", paging);

		return "recipe/recipeDesc";
	}

	@RequestMapping("/recipeInsert.do") // 등록 폼
	public String recipeInsert() {

		return "recipe/recipeInsert";
	}

	@RequestMapping("/ckEditorUpload.do")
	public void ckEditorUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) throws IllegalStateException, IOException {
		PrintWriter printWriter = null;

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		if (upload != null && upload.getSize() > 0) {
			String name = ImageIO.imageUpload(request, upload);

			printWriter = response.getWriter();
			String fileUrl = "/images/" + name; // 작성화면

			// 업로드시 메시지 출력 => json타입으로 리턴해야함
//			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
//					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')" + "</script>");

			printWriter.println("{\"filename\" : \"" + name + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		}
	}

	@RequestMapping("/recipeInsertResult.do")
	public String recipeInsertResult(RecipeVo vo, RecipeMaterialVo matVo, Model model, HttpSession session) {
		String classArr = "";
		if (vo.getCIdArr() != null) {
			for (int i = 0; i < vo.getCIdArr().size(); i++) {
				classArr += vo.getCIdArr().get(i);
				if (i < vo.getCIdArr().size() - 1) {
					classArr += ",";
				}
			}
		}
		vo.setCId(classArr);
		String mId = (String) session.getAttribute("mId");
		vo.setMId(mId);
		recipeService.recipeInsert(vo);
		String rId = "rec" + vo.getSeq();
		if (matVo.getRecipeMatVoList() != null) {
			for (RecipeMaterialVo material : matVo.getRecipeMatVoList()) {
				if (material.getMatName() != null)
					material.setRId(rId);
				rmService.recipeMaterialInsert(material);
			}
		}

		// 레시피 작성 시 적립금 50원 지급
		MemberVo mVo = new MemberVo();
		mVo.setMId(mId);
		int count = recipeService.recipeInsertCount(mVo);
		if (count <= 5) { // 하루 적립 5회 제한
			WalletHistoryVO wVo = new WalletHistoryVO();
			wVo.setMId(mId);
			recipeService.recipePointUpdate(mVo);
			recipeService.recipeWalletHistory(wVo);
		}
		model.addAttribute("rId", rId);
		return "redirect:recipeDesc.do";
	}

	@RequestMapping("/recipeUpdate.do") // 수정 폼
	public String recipeUpdate(RecipeVo vo, RecipeMaterialVo rmVo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		RecipeVo recipeVo = recipeService.recipeSelect(vo);
		model.addAttribute("rId", vo.getRId());
		model.addAttribute("select", recipeVo);
		List<RecipeMaterialVo> rms = rmService.recipeMaterialSelect(rmVo);
		rmVo.setRecipeMatVoList(rms);
		model.addAttribute("rm", rmVo);

		List<LessonVO> lessons = new ArrayList<LessonVO>();
		if (recipeVo.getCId() != null) {
			lessons = getLessonList(recipeVo, lessons);
		}
		model.addAttribute("lessons", lessons);

		return "recipe/recipeUpdate";
	}

	@RequestMapping(value = "/recipeUpdateResult.do", method = RequestMethod.POST) // 수정 처리
	public String recipeUpdateResult(RecipeMaterialVo rmVo, LessonVO lVo, RecipeVo vo, Model model,
			HttpServletRequest request, @RequestParam String delMat)
			throws IllegalStateException, IOException, SQLException {
		String classArr = "";
		if (vo.getCIdArr() != null) {
			for (int i = 0; i < vo.getCIdArr().size(); i++) {
				classArr += vo.getCIdArr().get(i);
				if (i < vo.getCIdArr().size() - 1) {
					classArr += ",";
				}
			}
		}
		vo.setCId(classArr);
		recipeService.recipeUpdate(vo);

		// delMat으로 삭제된 재료의 matId 받아와서 db에서 삭제
		RecipeMaterialVo matVo = new RecipeMaterialVo();
		if (delMat != null || delMat != "") {
			String mat[] = delMat.split(",");
			for (String material : mat) {
				matVo.setMatId(material);
				rmService.recipeMaterialDelete(matVo);
			}
		}

		if (rmVo.getRecipeMatVoList() != null) {
			for (RecipeMaterialVo material : rmVo.getRecipeMatVoList()) {
				if (material.getMatId() != null && material.getMatId() != "") { // 기존 재료 update
					rmService.recipeMaterialUpdate(material);
				} else { // 새 재료 insert
					material.setRId(vo.getRId());
					rmService.recipeMaterialInsert(material);
				}
			}
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

	@PostMapping(value = "/lessonSearch.do")
	@ResponseBody
	public List<LessonVO> lessonSearch(LessonVO param, HttpServletRequest request, LessonVO lvo) {
		// ModelAndView mav = new ModelAndView();
//		 System.out.println("컨트롤러에서 넘기는 값 : "+keyword);

		return recipeService.lessonSearch(param);

	}

	@PostMapping(value = "/recipeLessonSearch.do")
	@ResponseBody
	public List<LessonVO> recipeLessonSearch(LessonVO param, HttpServletRequest request, LessonVO lvo) {
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

	// DB에서 array형식인 cId를 List로 가져오기
	// recipeDesc와 recipeUpdate에서 사용
	public List<LessonVO> getLessonList(RecipeVo recipeVo, List<LessonVO> lessons) {
		LessonVO lVo = new LessonVO();
		String les[] = recipeVo.getCId().split(",");
		for (String lesson : les) {
			lVo.setCId(lesson);
			LessonVO lessonVo = recipeService.relatedClass(lVo);
			lessons.add(lessonVo);
			System.out.println("===========" + lessonVo);
		}
		return lessons;
	}
}
