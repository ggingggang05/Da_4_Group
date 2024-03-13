<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 개인정보 수정 페이지 -->
<form action="/mypage/change" method="post" autocomplete="off">
	<div class="container w-500">
		<div class="cell center">
			<h1>개인정보 변경</h1>	
		</div>
		<!-- 수정할 정보 -->
		<div class="cell">
			<label>아이디<b style="color:red">*</b></label>
			<input type="text" name="memberId" placeholder="한글숫자 2~10자" required class="tool w-100" value="${memberDto.memberId}">
		</div>
		<div class="cell">
			<label>이름(한글)<b style="color:red">*</b></label>
			<input type="text" name="memberNameKor" placeholder="한글숫자 2~10자" required class="tool w-100" value="${memberDto.memberNameKor}">
		</div>
		<div class="cell">
			<label>이름(영문)<b style="color:red">*</b></label>
			<input type="text" name="memberNameEng" placeholder="한글숫자 2~10자" required class="tool w-100" value="${memberDto.memberNameEng}">
		</div>
		<div class="cell">
			<label>이메일<b style="color:red">*</b></label>
			<input type="email" name="memberEmail" required class="tool w-100" value="${memberDto.memberEmail}">
		</div>
		<div class="cell">
			<label>통관번호<b style="color:red">*</b></label>
			<input type="text" name="memberClearanceId" placeholder="한글숫자 2~10자" required class="tool w-100" value="${memberDto.memberClearanceId}">
		</div>
		<div class="cell">
			<label>연락처1<b style="color:red">*</b></label>
			<input type="text" name="memberContact1" placeholder="한글숫자 2~10자" required class="tool w-100" value="${memberDto.memberContact1}">
		</div>
		<div class="cell">
			<label>연락처2</label>
			<input type="text" name="memberContact2" placeholder="한글숫자 2~10자" required class="tool w-100" value="${memberDto.memberContact2}">
		</div>
		<div class="cell">
			<label>주소</label>
		</div>
		<div class="cell">
			<input type="text" name="memberZipcode" placeholder="우편번호" class="tool" size="8" value="${memberDto.memberZipcode}">
			<button class="btn">검색</button>
		</div>
		<div class="cell">
			<input type="text" name="memberAddress1" placeholder="기본주소" class="tool w-100" value="${memberDto.memberAddress1}">
		</div>
		<div class="cell">
			<input type="text" name="memberAddress2" placeholder="상세주소" class="tool w-100" value="${memberDto.memberAddress2}">
		</div>
		<div class="cell">
			<label>생년월일</label>
			<input type="date" name="memberBirth" class="tool w-100" value="${memberDto.memberBirth}">
		</div>

		<!-- 개인정보 수정을 위한 비밀번호 확인 -->
		<div class="cell mt-20">
			<label>비밀번호 확인<b style="color:red">*</b></label>
			<input type="password" name="memberPw" required class="tool w-100">
		</div>
		<c:if test="${param.error != null}">
			<div class="cell center">
				<h3 style="color:red">비밀번호가 일치하지 않습니다</h3>
			</div>
		</c:if>
		
		<div class="cell">
			<button class="btn positive w-100">변경하기</button>
		</div>
		
	</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>