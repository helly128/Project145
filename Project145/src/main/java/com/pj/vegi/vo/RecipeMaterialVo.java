package com.pj.vegi.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RecipeMaterialVo {

	private String matId;
	private int matRecommend;
	private String matName;
	private String matVol;
	private String rId;
}
