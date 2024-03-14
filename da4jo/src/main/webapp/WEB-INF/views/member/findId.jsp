<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<form action="findId" method="post" autocomplete="off">
<div class="container w-400">
	<div class="cell center">
		<h1>아이디 찾기</h1>
	</div>
	<div class="cell">
		<input type="text" name="memberNameKor" required class="tool w-100" placeholder="한글이름을 입력하세요">
	</div>
	<div class="cell">
		<input type="email" name="memberEmail" required class="tool w-100" placeholder="이메일을 입력하세요">
	</div>	
	 <div class="cell">
    	<c:if test="${param.error != null}">
			<h4 style= "color:red"> 입력하신 정보가 일치하지 않습니다!</h4>
		</c:if>
    </div>
	<div class="cell">
		<button type="submit" class="btn positive"><i class="fa-solid fa-magnifying-glass"></i></button>
	</div>
</div>
</form>
 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>