package com.pj.vegi.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class LessonVO {
	private String cId;
	private String cTitle;
	private String cImg;
	private String cDesc;
	private String vegType;
	private String cPrice;
	private Date cStart;
	private Date cEnd;
	private String status;
	private String lecProfile;
	private String lecCareer;
	private String lecName;
	private String lecInsta;
	private String curriCulum;
	private int cHit;
	private String mId;
	private int cParti;
	private int cJoin;
	private String cLoc;
	private String bizNum;
	private int start;
	private int end;
	private String cTime;
}
