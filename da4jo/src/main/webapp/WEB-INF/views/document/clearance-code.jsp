<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/document-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>개인통관고유부호
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>개인통관고유부호 발급받기</h5>
			</div>
			<style>
				.content-body {
					position: relative;
				}
				.btn-unipass {
					position: absolute;
					right: 0;
					bottom: -25px;
				}
			</style>
			<div class="cell content-body-text">
				<strong>개인통관고유부호란?</strong><br>
				관세청이 개인 물품 수입 신고시 개인정보 유출을 방지하기 위해 주민등록번호 대신 사용하는 13자리 부호로,<br>
				한번 부여 받은 번호는 반복 사용이 가능합니다.<br>
				개인 통관고유부호는 관세청 전자통관시스템에서 공인인증서를 사용하여 간편하게 발급 받을 수 있으며,<br>
				개인 물품 통관시 주민번호 대신 사용하여 개인정보 유출을 사전에 차단할 수 있습니다.
			</div>
			<div class="btn-unipass">
				<a href="https://unipass.customs.go.kr/csp/persIndex.do" target="_blank" class="link">
					<img src="/image/btn-unipass.jpg">
				</a>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>