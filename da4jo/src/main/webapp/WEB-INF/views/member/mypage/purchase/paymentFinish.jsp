<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<!-- 결제 완료 페이지 -->
<br>
<br>
<div class="container container-body">
	<div class="container flex-container">
		<!-- 왼쪽 내용 -->
		<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>
		<!-- 오른쪽 내용 -->
		<div class="container inner-container">
			<div class="content content-body">
				<!-- 결제 완료 페이지 -->
				<div class="cell center">
					<h1>결제 완료!</h1>
				</div>
				<div class="cell center">
					<a href="/member/mypage" class="btn">마이페이지로 이동</a>
				</div>	
			</div>
		</div><!-- 오른쪽 내용 닫는 태그 -->
	</div><!-- 컨텐트 자리 닫는 태그 -->
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>