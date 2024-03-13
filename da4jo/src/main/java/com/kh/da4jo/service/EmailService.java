package com.kh.da4jo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.MemberDto;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender sender;
	@Autowired
	private MemberDao memberDao;
	
	//웰컴 메일 발송
	public void welcomSendMail(String email) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);//받는 사람
		message.setSubject("[다사조] WELCOME!!");//제목
		message.setText("다 사줄게");//내용
		
		sender.send(message);//보내기
	}
	
	//아이디 찾기
	public boolean sendMemberId(String memberEmail) {
		MemberDto memberDto = memberDao.selectEmail(memberEmail);
		
		if(memberDto != null) {//존재하는 이메일
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(memberDto.getMemberEmail());//받는 사람(분실자)
			message.setSubject("[다사조] 아이디 찾기 결과 안내");//제목
			message.setText(memberDto.getMemberNameKor()+"님의 아이디는" 
																+ memberDto.getMemberId()+"입니다.");
			sender.send(message);
			return true;
		}
		else {//존재하지 않는 이메일
			return false;		
		}
	}
	
}
