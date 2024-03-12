<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

</style>

<%-- ul로 변경 --%>
<div class="container w-1000">
	<div>
		<h1>리뷰 게시판</h1>		
	</div>

	<div class="right">
		<h2><a href="write">글쓰기</a></h2>
	</div>

	<ul class="">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
	</ul>

	<c:forEach var="reviewDto" items="${list}">
		<ul class="menu">
			<li>${reviewDto.reviewNo}</li>
			<li><a href="detail?reviewNo=${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a>
			</li>
			<li>${reviewDto.reviewWriter}</li>
			<li>${reviewDto.reviewWdate}</li>
			<li>${reviewDto.reviewVcount}</li>
		</ul>
	</c:forEach>
	
	<%-- 검색창 --%>
	<div class="cell center my-50">
		<form action="list" method="get">
			<select class="btn" name="column">
				<option value="review_title" ${param.column == 'review_title' ? 'selected' : ''}>제목</option>
				<option value="review_writer" ${param.column == 'review_writer' ? 'selected' : ''}>작성자</option>
				<option value="review_content" ${param.column == 'review_content' ? 'selected' : ''}>내용</option>
			</select>
			<input class="tool w-50" type="search" name="keyword" placeholder="검색어 입력" required value="${param.keyword}">
			<button class="btn">검색</button>
		</form>
	</div>
</div>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>