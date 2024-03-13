<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.chargeList {
	width: 1140px;
	margin-left: auto;
	margin-right: auto;
}
.chargeList li {
	width: 30%;
}
.chargeList .chargeTime {
	width: 70%;
}
</style>
<div class="container">
	<div class="cell center">
		<h1>
			크레딧 충전내역 
		</h1>
	</div>
	<div class="cell center">
		<ul class="menu chargeList">
			<li>충전금액</li>
			<li class="chargeTime">충전일시</li>
		</ul>
		<c:forEach var="creditDto" items="${list}">
			<ul class="menu chargeList">
				<li>${creditDto.creditCharge}</li>
				<li class="chargeTime"><fmt:formatDate value="${creditDto.creditTimeDate}"
						pattern="y년 M월 d일 H시 m분 s초" /></li>
			</ul>
		</c:forEach>
	</div>
	<div class="cell right">
		<a href="charge">크레딧 충전하기</a>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
