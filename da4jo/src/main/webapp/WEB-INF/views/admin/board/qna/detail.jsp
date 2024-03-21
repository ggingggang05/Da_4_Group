<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- UL로 변경 --%>

<div class="container w-1000">
	<div class="cell my-50">
		<h1>${qnaDto.qnaNo}번 Q&A</h1>
	</div>
	
	<c:choose>
	<c:when test="${qnaDto.qnaTarget != null}">
	<div class="cell"></div>
	</c:when>
	<c:otherwise>
	<div class="cell"><h2>제목 : ${qnaDto.qnaTitle}</h2></div>
	</c:otherwise>
	</c:choose>
	

	<div class="cell flex-cell auto-width">
		<div class="cell">
			<h2>내용</h2>
		</div>
		<div class="cell">
			<div class="cell right">
				<label>작성자 : ${qnaDto.qnaWriter}</label>
			</div>
		</div>
	</div>

	<hr>
	<div class="cell" style="min-height: 250px">
		${qnaDto.qnaContent}
	</div>
	<hr>

	<div class="cell flex-cell auto-width">
		<div class="cell">
			<a class="btn" href="list">목록으로</a> 
			<a class ="btn" href="write">질문글작성</a> 
			<c:if test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}">
				<a class="btn" href="write?qnaTarget=${qnaDto.qnaNo}">답글쓰기</a>
				<a class="btn negative" href="/board/qna/delete?qnaNo=${qnaDto.qnaNo}">질문글삭제</a>
			</c:if>
			
		</div>
	
		<div class="cell right">
			<div class="cell">
				<label>작성일 : ${qnaDto.qnaWdate}</label>
				<label>조회수 : ${qnaDto.qnaVcount}</label>
			</div>
		</div>
	</div>



</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>