package com.kh.da4jo;

import java.util.Properties;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@SpringBootTest
public class test01 {

	@Test
	public void test() {
		//전송 도구
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");//업체의 호스트정보
		sender.setPort(587);//업체의 포트 번호
		sender.setUsername("maseukana43");//계정
		sender.setPassword("jjueorkcjzpbbfem");//비밀번호
		
		//통신 설정
		Properties props =  new Properties();//자바에서 제공하는 문자열 Map
		props.setProperty("mail.smtp.auth", "true");//인증 후 이용설정(필수)
		props.setProperty("mail.smtp.debug", "true");//디버깅 이용 설정(선택)
		props.setProperty("mail.smtp.starttls.enable", "true");//TLS 사용 설정(필수)
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");//TLS 버전 설정(필수)
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");//신뢰할 수 있는 대상으로 설정(필수)
		sender.setJavaMailProperties(props);
		
		//메세지 생성
		SimpleMailMessage message = new SimpleMailMessage();
		
		//message.setTo("받는사람1", "받는사람2");
		//message.setCc("참조대상1", "참조대상2", "참조대상3");
		//message.setBcc("숨은참조대상","숨은참조대상2");
		
		message.setTo("bbongnam777@naver.com");
		//message.setCc("bbongnam777@gmail.com");
		message.setSubject("메일 전송 제목 테스트2");
		message.setText("메일 전송 내용 테스트2");
		
		//전송
		sender.send(message);
	}
}
