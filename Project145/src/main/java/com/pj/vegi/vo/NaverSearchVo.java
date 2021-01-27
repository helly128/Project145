package com.pj.vegi.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NaverSearchVo {
	private int total;
	private String title;
	private String link;
	private String mallName;
	private String image;
	private String lprice;
	private String description;

	private List<NaverSearchVo> items;

}
