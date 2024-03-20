<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.text-box {
	border: 1px solid #d8d8d8;
	background-color: #f8f8f8;
	padding: 10px;
}
h6 {
	font-size: 14px;
	margin: 10px 0 10px 0;
}
</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/document-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>수수료 및 요금표
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>수수료 안내</h5>
			</div>
			<div class="cell content-body-text">
				<strong>기본 배송료 : </strong>10000원<br> 
				(국내배송료 + 통관수수료 통합 금액입니다.)
			</div>
			<div class="cell content-body-text">
				<strong>kg당 배송요금</strong>
				<div class="text-box">
					※ kg당 요금 계산법<br>
					 - 요금 = 11.2$(USD) X 물픔의 무게(반올림)
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>