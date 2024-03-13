<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
</style>
<div class="container">
	<div class="cell center">
		<h1>
			크레딧 충전내역
			<a href="charge">크레딧 충전하기</a>
		</h1>
	</div>
	<div class="cell center">
		<ul>
		<li>충전금액</li>
		<li>충전일시</li>
	</ul>
	<c:forEach var="creditDto" items="${list}">
		<ul>
			<li>
				${creditDto.creditCharge}
			</li>
			<li>
				<fmt:formatDate value="${creditDto.creditTimeDate}" 
						pattern="y년 M월 d일 H시 m분 s초"/>
			</li>
		</ul>
	</c:forEach>
	</div>
</div>
   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    