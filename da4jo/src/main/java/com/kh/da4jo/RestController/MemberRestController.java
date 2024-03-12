package com.kh.da4jo.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.da4jo.dao.MemberDao;
import com.kh.da4jo.dto.MemberDto;

@CrossOrigin
@RestController
@RequestMapping("/rest/member")
public class MemberRestController {
	@Autowired
	private MemberDao memberDao;
	
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

}
