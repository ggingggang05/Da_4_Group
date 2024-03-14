<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<form action="findPw" method="post" autocomplete="off">
	<div class="container w-400">
		<div class= "cell center">
			<h1>비밀번호 찾기</h1>
		</div>
		<div class="cell">
			아이디 <input type="text" name="memberId" required>
		</div>
		<div class="cell">
			이메일 <input type="email" name="memberEmail" required>
		</div>
	     <div>
	    	<c:if test="${param.error != null}">
				<h4 style= "color:red"> 입력하신 정보가 일치하지 않습니다.</h4>
			</c:if>
	    </div>
		<button type="submit"> 찾기</button>
	</div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>