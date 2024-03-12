<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container w-800">
		<h1>공지사항</h1>
		<hr>
		<div class="cell center">
			<ul class="menu">
				<li>번호</li>
				<li>제목</li>
				<li>작성자</li>
				<li>작성일</li>
				<li>조회수</li>
			</ul>
			<!--- 리스트 --->
			<c:forEach var="noticeDto" items="${noticeDto}">
				<ul class="menu">
					<li>${noticeDto.noticeNo}</li>
					<li><a class="link"
						href="detail?noticeNo=${noticeDto.noticeNo}">
							${noticeDto.noticeTitle}</a></li>
					<li>${noticeDto.noticeWriter}</li>
					<li>${noticeDto.noticeWdate}</li>
					<li>${noticeDto.noticeVcount}</li>
				</ul>
			</c:forEach>
			<div class="cell right">
				<c:if test="${sessionScope.loginLevel == '관리자' || '총관리자'}">
					<a href="/admin/board/notice/write" class="link">글쓰기</a>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>