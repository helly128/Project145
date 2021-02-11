package com.pj.vegi.vo;
/**
 * 오늘 할 일
 * 네이버 로그인 db저장하기
 **/
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SnsInfoVo {
	private String id;
	private String snsId;
	private String snsType;
	private String snsName;
	private String snsProfile;
	
	

}
