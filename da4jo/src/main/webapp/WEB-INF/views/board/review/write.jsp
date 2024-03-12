<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<form action="write" method="post" autocapitalize="off">
<div class="container">
	<div>
		<h1>리뷰글 작성</h1>
	</div>

	<label>제목</label> 
	<div>
		<input type="text" name="reviewTitle"> 
	</div>
	
	<label>내용</label>
	<div>
		<textarea name="reviewContent"></textarea>
	</div>	

	<button>등록</button>
</div>
</form>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>