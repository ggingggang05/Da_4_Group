<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.notice-number {
	width: 10%;
	text-align: center;
}

.notice-title {
	width: 70%;
	text-align: center;
}

.notice-title2 {
	width: 70%;
	text-align: left;
}


.notice-date {
	width: 20%;
	text-align: center;
}
</style>
<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 공지사항
			</div>
		</div>
		<div class="content content-body">
			<div class="cell flex-cell">
				<div class="notice-number">번호</div>
				<div class="notice-title">제목</div>
				<div class="notice-date">작성일</div>
			</div>
			<!--- 리스트 --->
			<c:forEach var="noticeDto" items="${noticeDto}">
				<div class="cell flex-cell">
					<div class="notice-number">${noticeDto.noticeNo}</div>
					<div class="notice-title2"><a class="link"
						href="detail?noticeNo=${noticeDto.noticeNo}">
							${noticeDto.noticeTitle}</a></div>
					<div class="notice-date wdate">${noticeDto.noticeWdate}</div>
				</div>
			</c:forEach>
			<div class="cell right">
				<c:if
					test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}">
					<a href="/board/notice/write" class="link">글쓰기</a>
				</c:if>
			</div>
			<%-- 검색창 --%>
			<div class="cell center my-50">
				<form action="list" method="get">
					<select class="btn" name="column">
						<option value="notice_title"
							${param.column == 'notice_title' ? 'selected' : ''}>제목</option>
						<option value="notice_content"
							${param.column == 'notice_content' ? 'selected' : ''}>내용</option>
					</select> <input class="tool w-50" type="search" name="keyword"
						placeholder="검색어 입력" required value="${param.keyword}">
					<button class="btn">검색</button>
				</form>
				<br>
				<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>