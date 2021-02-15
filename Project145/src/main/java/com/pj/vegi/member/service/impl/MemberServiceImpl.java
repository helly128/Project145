package com.pj.vegi.member.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.vegi.member.mapper.MemberMapper;
import com.pj.vegi.member.service.MemberService;
import com.pj.vegi.vo.LessonVO;
import com.pj.vegi.vo.MemberVo;
import com.pj.vegi.vo.RecipeVo;
import com.pj.vegi.vo.RestaurantVo;
import com.pj.vegi.vo.SnsInfoVo;
import com.pj.vegi.vo.VegimeetVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper dao;

	@Override
	public boolean memberLoginCheck(MemberVo vo) throws SQLException {

		MemberVo resultVO = dao.memberSelect(vo);
		if (resultVO != null && vo.getPassword().equals(resultVO.getPassword())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int memberInsert(MemberVo vo) throws SQLException {

		return dao.memberInsert(vo);
	}

	@Override
	public MemberVo memberSelect(MemberVo vo) throws SQLException {
		return dao.memberSelect(vo);
	}

	@Override
	public int idDuplCheck(String data) throws SQLException {
		return dao.idDuplCheck(data);
	}

	@Override
	public MemberVo idSearch(MemberVo vo) {

		return dao.idSearch(vo);
	}

	@Override
	public MemberVo pwSearch(MemberVo vo) {

		return dao.pwSearch(vo);
	}
	
	//=========================new
	@Override
	public void naverMailSend(MemberVo vo) { 
	String host = "smtp.naver.com"; 
	// 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
	String user = "railylog@naver.com"; 
	// 패스워드 
	String password = "Chan9034";// SMTP 서버 정보를 설정한다. 
	Properties props = new Properties(); props.put("mail.smtp.host", host);
	props.put("mail.smtp.ssl.trust", "smtp.naver.com");
	props.put("mail.smtp.port", 587); props.put("mail.smtp.auth", "true"); 
	
	Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(user, password); 
		} 
		}); 
	try { MimeMessage message = new MimeMessage(session); 
	message.setFrom(new InternetAddress(user)); 
	message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail())); 
	// 메일 제목
	message.setSubject("채식당 임시비밀번호");
	// 메일 내용 
	message.setText("임시 비밀번호는 " + vo.getPassword()+" 입니다. " ); // send the message 
	Transport.send(message); 
	System.out.println("Success Message Send"); 
	} catch (MessagingException e) { e.printStackTrace(); } 
	}
	

	@Override
	public int updatePw(MemberVo vo) throws Exception {
		return dao.updatePw(vo);
	}

	
	@Override
	public int naverInsert(MemberVo vo) {
		return dao.naverInsert(vo);
	}

	@Override
	public List<Map> mainLesson(LessonVO vo) {
		return dao.mainLesson(vo);
	}

	@Override
	public List<Map> mainMeet(VegimeetVo vo) {
		return dao.mainMeet(vo);
	}

	@Override
	public List<Map> mainRest(RestaurantVo vo) {
		return dao.mainRest(vo);
	}

	@Override
	public List<Map> mainRecipe(RecipeVo vo) {
		return dao.mainRecipe(vo);
	}


	
}
