<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="write" method="post" autocapitalize="off" enctype="multipart/form-data">
<div class="container w-800">
	<div>
		<h1>리뷰글 작성</h1>
	</div>

	<h2>제목</h2> 
	<div>
		<input class="tool w-100" type="text" name="reviewTitle"> 
	</div>
	
	<h2>내용</h2>
	<div>
		<textarea class="imgArea"  name="reviewContent"></textarea>
	</div>	
	
	<h2>썸네일 이미지</h2> 
	<div>
		<input type="file" name="img" accept="image/*" class="tool w-100">
	</div>
	
	
		<button class="btn">등록</button>
	</div>
	
</form>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>