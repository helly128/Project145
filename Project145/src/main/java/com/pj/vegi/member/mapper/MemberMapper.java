package com.pj.vegi.member.mapper;



import java.util.List;
import java.util.Map;

import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestaurantVo;
import com.pj.vegi.vo.VegimeetVo;


public interface MemberMapper {

	MemberVo memberSelect(MemberVo vo);
	int memberInsert(MemberVo vo);
	int idDuplCheck(String data);
	MemberVo idSearch(MemberVo vo);
	MemberVo pwSearch(MemberVo vo);
	int updatePw(MemberVo vo);
	
	int naverInsert(MemberVo vo);
	
	
	List<Map> mainLesson (LessonVO vo);
	List<Map> mainMeet (VegimeetVo vo);
	List<Map> mainRest(RestaurantVo vo);
	List<Map> mainRecipe(RecipeVo vo);

}
