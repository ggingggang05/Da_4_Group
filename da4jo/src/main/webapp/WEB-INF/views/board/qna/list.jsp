<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.title{
    border-top: 1px solid #bdc3c7;
 	border-bottom: 1px solid #bdc3c7;
 	background-color: #ecf0f1;
}
.list{
	border-bottom: 1px solid #b2bec3;
}


</style>

<%-- ul로 변경 --%>
<div class="container w-1000">
	<div>
		<h1>Q&A 게시판</h1>	
	</div>

	<div class="right">
		<h2><a href="write">글쓰기</a></h2>
	</div>

	<ul class="menu title">
		<li>번호</li>
		<li>잠금표시</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
	</ul>

	<c:forEach var="qnaDto" items="${list}">
		<ul class="menu list">
			<li>${qnaDto.qnaNo}</li>
			<li>${sessionScope.qnaSecreate}</li>
			<li><a href="detail?qnaNo=${qnaDto.qnaNo}">${qnaDto.qnaTitle}</a>
			</li>
			<li>${qnaDto.qnaWriter}</li>
			<li>${qnaDto.qnaWdate}</li>
			<li>${qnaDto.qnaVcount}</li>
		</ul>
	</c:forEach>
	
	<%-- 검색창 --%>
	<div class="cell center my-50">
		<form action="list" method="get">
			<select class="btn" name="column">
				<option value="qna_title" ${param.column == 'qna_title' ? 'selected' : ''}>제목</option>
				<option value="qna_writer" ${param.column == 'qna_writer' ? 'selected' : ''}>작성자</option>
				<option value="qna_content" ${param.column == 'qna_content' ? 'selected' : ''}>내용</option>
			</select>
			<input class="tool w-50" type="search" name="keyword" placeholder="검색어 입력" required value="${param.keyword}">
			<button class="btn">검색</button>
		</form>
	</div>
</div>






<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>