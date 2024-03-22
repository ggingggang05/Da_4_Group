package com.kh.da4jo.interceptor;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.da4jo.dao.QnaDao;
import com.kh.da4jo.dto.QnaDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class QnaVcountInterceptor implements HandlerInterceptor{
	
	@Autowired
	private QnaDao qnaDao;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null){// 비회원이라면
			return true; // 조회수 증가 없음
		}
		QnaDto qnaDto = qnaDao.selectOne(qnaNo);
		if(loginId.equals(qnaDto.getQnaWriter())){
			return true; // 만약 로그인아이디가 공지작성자이면 조회수 증가 없음
		}
		if(qnaDto.getQnaWriter() == null){
			return true; // 작성자가 탈퇴한 사용자면 조회수 증가 없음
		}
		
		
		Set<Integer> history = (Set<Integer>)session.getAttribute("history");
		// 세션에 history라는 저장소를 생성하거나 있으면 꺼낸다
		if(history == null){// 이 이름의 저장소가 없으면 새로 만들어준다
			history = new HashSet<>();
			// 해쉬셋은 중복요소를 허용하지 않는다, 순서없고 null값 저장가능
			// 순서가 없기때문에 빠른 검색이 가능
		}
		if(history.contains(qnaNo)) {
			return true;// 저장소에 공지번호가 있으면(읽었다면) 통과
		}
		else{// 저장소에 공지번호가 없다면 번호를 추가하고 갱신
			history.add(qnaNo);
			session.setAttribute("history", history);
		}
		
		
		// 조회수 증가
		qnaDao.updateQnaReadcount(qnaNo);
		
		return true;
	}
}