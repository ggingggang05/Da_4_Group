package com.kh.da4jo.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.da4jo.dao.CertDao;
import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.CertDto;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.service.EmailService;

@CrossOrigin
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EmailService emailService;
	@Autowired
	private CertDao certDao;
	
	//회원가입 아이디 검사
	@RequestMapping("/checkJoinId")
	public String checkJoinId(@RequestParam String memberId) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		
		if(memberDto == null) { //아이디가 DB에 없다면
			return "joinY";//사용 가능한 경우(DB == null)
		}
		else {
			return "joinN"; //사용 불가능한 경우(DB에 있는 경우)
		}
	}
	
	//이메일 검사
	@RequestMapping("/checkEmail")
	public String checkEmail(@RequestParam String memberEmail) {
		MemberDto memberDto = memberDao.selectEmail(memberEmail);
		if(memberDto == null) { //이메일이 DB에 없다면
			return "emailY";//사용 가능한 경우(DB == null)
		}
		else {
			return "emailN"; //사용 불가능한 경우(DB에 있는 경우)
		}
	}
	
	//로그인 아이디 검사
	@RequestMapping("/checkLoginId")
	public String checkLoginId(@RequestParam String memberId) {
		MemberDto memberDto = memberDao.selectOne(memberId);
		
		if(memberDto != null) { //아이디가 DB에 있다면
			return "loginY";//사용 가능한 경우(DB에 있는 경우)
		}
		else {
			return "loginN"; //사용 불가능한 경우(DB == null)
		}
	}
	
	//이메일 인증 서비스 
	@RequestMapping("/sendCert")
		public void sendCert(@RequestParam String memberEmail){
			//emailService를 이용해서 인증번호를 보내는 코드
			emailService.sendCert(memberEmail);
	}
	@RequestMapping("/checkCert")
	public boolean checkCert(@ModelAttribute CertDto certDto) {
		boolean isValid = certDao.checkValid(certDto);
		if(isValid) {//인증 성공 시 인증번호 삭제
			certDao.delete(certDto.getCertEmail());
		}
		return isValid;
	}

}
