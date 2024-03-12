<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>리뷰 게시판</h1>

<h2><a href="write">글쓰기</a></h2>

<%-- 게시글 작성 --%>
	<table border="1" width= "500">
		<thead>
			<tr>
				<th>번호</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<c:forEach var="reviewDto" items="${list}">
			<tbody>
				<tr>
					<td>${reviewDto.reviewNo}</td>
					<td>
						<a href="detail?reviewNo=${reviewDto.reviewNo}">
						${reviewDto.reviewTitle}</a>
					</td>
					<td>${reviewDto.reviewWriter}</td>
					<td>${reviewDto.reviewWdate}</td>
					<td>${reviewDto.reviewVcount}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>

<%-- 검색창 생성 --%>

<%-- 검색창 --%>
	<form action="list" method="get">
		<select name="column">
			<option value="review_title" ${param.column == 'review_title' ? 'selected' : ''}>제목</option>
			<option value="review_writer" ${param.column == 'review_writer' ? 'selected' : ''}>작성자</option>
			<option value="review_content" ${param.column == 'review_content' ? 'selected' : ''}>내용</option>
		</select>
		<input type="search" name="keyword" placeholder="검색어 입력" required value="${param.keyword}">
		<button>검색</button>
	</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>