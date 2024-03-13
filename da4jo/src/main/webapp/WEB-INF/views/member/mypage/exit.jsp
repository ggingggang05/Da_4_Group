<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 회원 탈퇴 페이지 -->
<form action="exit" method="post">
	<div class="container w-500">
		<div class="cell center">
			<h1>회원 탈퇴</h1>
		</div>
		<div class="cell center">
			<p>탈퇴를 위해 비밀번호를 한 번 더 입력해 주세요</p>
		</div>
		<div class="cell">
			<input type="password" name="memberPw" placeholder="비밀번호 입력" required class="tool w-100">
		</div>
		<div class="cell">
			<button class="btn negative w-100">회원탈퇴</button>
		</div>
		<c:if test="${param.error != null}">
			<div class="cell">
				<h3 style="color:red">비밀번호가 일치하지 않습니다</h3>
			</div>
		</c:if>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>