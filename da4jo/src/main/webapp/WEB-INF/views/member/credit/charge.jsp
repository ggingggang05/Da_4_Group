<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<div class="container">
	<div class="cell center">
		<h1>크레딧 충전하기</h1>
	</div>
	<form action="charge" method="post" autocomplete="off">
		<div class="cell">
			<label for="credit">충전금액(원) : </label>
			<input type="text" name = creditCharge id="credit">
		</div>
		<button>충전하기</button>
	</form>
</div>
   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    