package com.pj.vegi.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RepleVo {

	private String reId;//
	private String rId;//
	private String reContent;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy년mm월dd일")
	private Date reDate;
	private int reReport;
	private int reLevle;
	private int reAbel;
	private String mId;
	private String conId;
	private String unId;
}
