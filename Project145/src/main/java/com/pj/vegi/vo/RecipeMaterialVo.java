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
	private String mat_id;
	private int mat_recommend;
	private String mat_name;
	private String mat_vol;
	private String r_id;
}
