package com.pj.vegi.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RestMenuVo {
	private String menuId;
	private String menuName;
	private String menuVegeType;
	private int menuPrice;
	private String restId;
	private String deleteFlag;
	
	private List<RestMenuVo> menuVoList;
}
