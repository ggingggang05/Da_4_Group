<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<div>
		<div>
			<h1>리뷰글 작성</h1>
		</div>
		<form action="write" method="post" autocapitalize="off">
			<input type="text" name="reviewTitle"> <br><br>
			<textarea name="reviewContent"></textarea> <br><br> 

			<button>등록</button>
		</form>
	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>