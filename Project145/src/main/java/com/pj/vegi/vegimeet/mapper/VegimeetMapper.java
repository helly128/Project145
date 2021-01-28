package com.pj.vegi.vegimeet.mapper;

import java.util.List;

import com.pj.vegi.vo.LikeListVo;
import com.pj.vegi.vo.VegimeetVo;

public interface VegimeetMapper {
	List<VegimeetVo> vegimeetList();
	int getDday(VegimeetVo vo);
	int likeInsert(LikeListVo vo);
	int likeDelete(LikeListVo vo);
	int likeFlagSelect(LikeListVo vo);
}
