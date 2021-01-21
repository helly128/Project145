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
public class RecipeVo {

	private String r_id;    
	private String r_type;    
	private String r_title;      
	private Date r_date;               
	private String r_content;          
	private String r_image;     
	private int r_hit;                     
	private String m_id;         
	private String c_id;              
	private int r_report;          
}
