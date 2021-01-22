package com.pj.vegi.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RecipeMaterialVo {

	private String matId;
	private int matRecommend;
	private String matName;
	private String matVol;
	private String rId;
}
