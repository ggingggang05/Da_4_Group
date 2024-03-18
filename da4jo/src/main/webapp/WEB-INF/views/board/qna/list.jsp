<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.menu.menu-list {
	border-bottom: 1px solid #DEE2E6;
}
#qnaTitle {
	width: 40%;
}
</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> Q&A 게시판
			</div>
		</div>
		<div class="content content-body right">
<%-- 			<c:if test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}"> --%>
				<h2>
					<a href="write">글쓰기</a>
				</h2>
<%-- 			</c:if> --%>
			<div class="cell center"></div>
			<div class="cell center my-50">


				<c:if test="${sessionScope.loginLevel == '일반회원'}">
			
				<%-- 일반회원일때 기능 --%> 
				<ul class="menu menu-type">
					<li id="">번호</li>
					<li id="qnaTitle">제목</li>
					<li id="">작성자</li>
					<li id="">작성일</li>
					<li id="">조회수</li>
				</ul>
				<c:forEach var="qnaDto" items="${list}">
					<ul class="menu menu-list">
						<li>${qnaDto.qnaNo}</li>
						<%-- 잠금을 걸지 않았을때 --%>
							<c:if test="${qnaDto.qnaSecret == 'N'}">
							<li><a href="detail?qnaNo=${qnaDto.qnaNo}">${qnaDto.qnaTitle}</a></li>
							</c:if>
							
							<c:if test="${qnaDto.qnaSecret == 'Y'}">
							<li><i class="fa-solid fa-lock">이 글은 비밀글 입니다.</i></li>
							</c:if>
<!-- 						<li><i class="fa-solid fa-lock">이 글은 비밀글 입니다.</i></li> -->
						
						<li>${qnaDto.qnaWriter}</li>
						<%-- 글 작성자와 로그인한 아이디가 같으면  --%>
						
						<c:if test="${memberDto.memberId == qnaDto.qnaWriter}">
						<li class="qnaTitle"><a href="detail?qnaNo=${qnaDto.qnaNo}">${qnaDto.qnaTitle}</a></li>
						</c:if>
						<li>${qnaDto.qnaWdate}</li>
						<li>${qnaDto.qnaVcount}</li>
					</ul>
				</c:forEach>
				</c:if>
				
				
				<%-- 관리자 일때 --%>
				<c:if test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}">
				
				<%-- 목록 --%>
				<ul class="menu menu-type">
					<li>번호</li>
					<li>잠금</li>
					<li class="w-30">제목</li>
					<li>작성자</li>
					<li>작성일</li>
					<li>조회수</li>
				</ul>
				<c:forEach var="qnaDto" items="${list}">
					<ul class="menu menu-list">
						<li>${qnaDto.qnaNo}</li>
						<li>${qnaDto.qnaSecret}</li>
						<li><a href="detail?qnaNo=${qnaDto.qnaNo}">${qnaDto.qnaTitle}</a></li>
						<li>${qnaDto.qnaWriter}</li>
						<li>${qnaDto.qnaWdate}</li>
						<li>${qnaDto.qnaVcount}</li>
					</ul>
				</c:forEach>
			</c:if>

				<%-- 검색창 --%>
				<div class="cell center my-50">
					<form action="list" method="get">
						<select class="btn" name="column">
							<option value="qna_title"
								${param.column == 'qna_title' ? 'selected' : ''}>제목</option>
							<option value="qna_writer"
								${param.column == 'qna_writer' ? 'selected' : ''}>작성자</option>
							<option value="qna_content"
								${param.column == 'qna_content' ? 'selected' : ''}>내용</option>
						</select> <input class="searchBar w-50" type="search" name="keyword"
							placeholder="검색어 입력" required value="${param.keyword}">
						<button class="searchBtn">검색</button>
					</form>
				</div>

			
				

				<div class="cell">
					<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>












<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>