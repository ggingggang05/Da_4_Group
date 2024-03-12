<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <div class="container w-500">
        <div class="cell center">
            <h1>'${memberDto.memberId}'님의 MY PAGE</h1>
        </div>
        <div class="cell">
            이름(한글) : ${memberDto.memberNameKor}
        </div>
        <div class="cell">
            이름(영문) : ${memberDto.memberNameEng}
        </div>
        <div class="cell">
            이메일 : ${memberDto.memberEmail}
        </div>
        <div class="cell">
            연락처1 : ${memberDto.memberContact1}
        </div>
        <div class="cell">
            연락처2 : ${memberDto.memberContact2}
        </div>
        <div class="cell">
            생년월일 : ${memberDto.memberBirth}
        </div>
        <div class="cell">
            통관번호 : ${memberDto.memberClearanceId}
        </div>
        <div class="cell">
            우편번호 : ${memberDto.memberZipcode}<br>
            기본주소 : ${memberDto.memberAddress1}<br>
            상세주소 : ${memberDto.memberAddress2}
        </div>
        <div class="cell">
            회원등급 : ${memberDto.memberLevel}
        </div>
        <div class="cell">
            충전캐쉬 : ${memberDto.memberCredit}
        </div>
        <div class="cell">
            포인트 : ${memberDto.memberPoint}
        </div>
        <div class="cell">
           	회원가입시간 : 
				<fmt:formatDate value="${memberDto.memberJoinDate}"
           											pattern="Y-MM-dd HH:mm:ss"/> 
        </div>
        <div class="cell">
           	최종로그인시간 : 
           	<fmt:formatDate value="${memberDto.memberLoginDate}"
           										pattern="Y-MM-dd HH:mm:ss"/> 
        </div>
        
    </div>
    


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>