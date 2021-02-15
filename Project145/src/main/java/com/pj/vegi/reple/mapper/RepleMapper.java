package com.pj.vegi.reple.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pj.vegi.reple.web.Criteria;
import com.pj.vegi.vo.RepleVo;

public interface RepleMapper {

	public List<RepleVo> readAll(RepleVo vo);//전체 댓글 조회
	
	public RepleVo read(int reId);//조회

	public int insert(RepleVo vo);

	public int delete(RepleVo vo);

	public int update(RepleVo vo);

	public List<RepleVo> getListWithPaging(@Param("cri") Criteria cri, @Param("rId") int rId); //뎃글 페이징 처리

	public int getCountByRId(int rId);

	public int repleInsert(RepleVo vo);//대댓글 입력
	public int countReple(RepleVo vo);

}
