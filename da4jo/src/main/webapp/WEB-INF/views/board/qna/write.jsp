<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="write" method="post" autocapitalize="off">
<div class="container w-800">
	<div>
		<h1>Q&A글 작성</h1>
	</div>
	
	<h2>임시</h2>
	<input class="tool w-100" type="text" name="qnaSecreate"> 

	<h2>제목</h2> 
	<div>
		<input class="tool w-100" type="text" name="qnaTitle"> 
	</div>
	
	<h2>내용</h2>
	<div>
		<textarea name="qnaContent"></textarea>
	</div>	

	<button class="btn">등록</button>
</div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>