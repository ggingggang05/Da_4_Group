<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.btn.login, .btn.pw { 
	color: white;
	white-space: nowrap;
	width: 150px;
	height: 130px;
	font-size: 20px;
}

.link-login {
	flex: 1;
	padding: 10px;
}

.btn.login	 {
	background-color: #74b9ff;
}

.link-pw {
	flex: 1;
	padding: 10px;
}

.btn.pw {
	background-color: rgb(234, 111, 0);
}
</style>


<br>
<div class="container container-body">
	
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text center">
				<i class="fa-regular fa-paper-plane"></i>입력하신 메일로 아이디를 보내 드렸습니다.
			</div>
		</div>
		<br>
		<br>
		<div class="content content-body">
			<div class="cell flex-cell">
				<div class="link-login right">
					<a class="link" href="${pageContext.request.contextPath}/member/login">
						<button class="btn login">
							<strong>로그인</strong><br>하러가기
						</button>
					</a>
				</div>
				<div class="link-pw left">
					<a class="link" href="${pageContext.request.contextPath}/member/findPw">
						<button class="btn pw">
							<strong>비밀번호</strong><br>찾기
						</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>