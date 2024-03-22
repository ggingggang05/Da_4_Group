<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="edit" method="post" autocapitalize="off">

<input type="hidden" name="qnaNo" value="${qnaDto.qnaNo}">

<%-- 이코드 사용 안합니다 임시로 남겨놓은거임 

<div class="container w-800">
	<div>
		<h1>Q&A 글수정</h1>
	</div>

	<h2>제목</h2> 
	<div>
		<input class="tool w-100" type="text" name="qnaTitle"> 
	</div>
	
	<h2>내용</h2>
	<div>
		<textarea name="qnaContent"></textarea>
	</div>	

	<button class="btn">수정</button>
</div>
</form>

--%>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>