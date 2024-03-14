package com.kh.da4jo.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.da4jo.dao.CertDao;
import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.CertDto;
import com.kh.da4jo.dto.MemberDto;
import com.kh.da4jo.service.EmailService;
import com.kh.da4jo.service.ImgService;

import jakarta.servlet.http.HttpSession;

@CrossOrigin
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ImgService imgService;

	// 회원가입 아이디 검사
	private EmailService emailService;
	@Autowired
	private CertDao certDao;
	
	//회원가입 아이디 검사
	@RequestMapping("/checkJoinId")
	public String checkJoinId(@RequestParam String memberId) {
		MemberDto memberDto = memberDao.selectOne(memberId);

		if (memberDto == null) { // 아이디가 DB에 없다면
			return "joinY";// 사용 가능한 경우(DB == null)
		} else {
			return "joinN"; // 사용 불가능한 경우(DB에 있는 경우)
		}
	}

	
	// 이메일 검사
	@RequestMapping("/checkEmail")
	public String checkEmail(@RequestParam String memberEmail) {
		MemberDto memberDto = memberDao.selectEmail(memberEmail);
		if (memberDto == null) { // 이메일이 DB에 없다면
			return "emailY";// 사용 가능한 경우(DB == null)
		} else {
			return "emailN"; // 사용 불가능한 경우(DB에 있는 경우)
		}
	}

	// 로그인 아이디 검사
	@RequestMapping("/checkLoginId")
	public String checkLoginId(@RequestParam String memberId) {
		MemberDto memberDto = memberDao.selectOne(memberId);

		if (memberDto != null) { // 아이디가 DB에 있다면
			return "loginY";// 사용 가능한 경우(DB에 있는 경우)
		} else {
			return "loginN"; // 사용 불가능한 경우(DB == null)
		}
	}

	@RequestMapping("/editProfile")
	public List<Integer> editProfile(HttpSession session, @RequestParam MultipartFile img)
			throws IllegalStateException, IOException {
		// 세션 아이디 불러오기
		String loginId = (String) session.getAttribute("loginId");

		// 해당 아이디의 기존 이미지 삭제
		int currentImgNo = memberDao.findImgNo(loginId);
		System.out.println(currentImgNo);
		boolean isValid = currentImgNo != 0;
		if (isValid) {
			imgService.removeFile(currentImgNo);
		}
		// 새 이미지 적용
		

		// 올린 내용이 없으면 중지
		if (img.isEmpty()) {
			return null;
		}
		List<Integer> numbers = new ArrayList<>();
		int imgNo = imgService.save(img);
		numbers.add(imgNo);
		
		memberDao.connect(loginId, imgNo);
		return numbers;
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
