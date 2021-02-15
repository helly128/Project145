package com.pj.vegi.vo;

import java.util.Date;

//import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RepleVo {

	private String rId;//
	private String reContent;
	//@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	private Date reDate;
	private int reReport;
	private int reAble;
	private String mId;
	private String conId;
	private String unId;
	private String reId;
	private int reDepth;
	private String reParent;
	
	private String mName;
	private String profileImage;
	
	private int start;
	private int end;
}
