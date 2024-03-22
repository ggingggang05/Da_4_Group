<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	.flex-cell input.tool
	{
		border-left: none;
	    border-right: none;
	    border-top: none;
	    padding-left: 0;
	    padding-right: 0;
        border-bottom: 1px solid rgb(224, 224, 224);
        transition: border-color 0.3s;
	}
	.fa-regular,
	.fa-solid
	 {
      width: 12%;
      font-size: 24px;
      padding: 0.5em;
      border-bottom: 1px solid rgb(224, 224, 224);
      color: #b2bec3;
      transition: border-color 0.3s, color 0.3s;
	}
</style>

<!-- 비밀번호 변경 페이지 -->
<form action="password" method="post" autocomplete="off">
	<div class="container w-500" style= "margin-top: 6em; margin-bottom: 6em;">
		<div class="container w-400">
			<div class= "cell center" style="margin-bottom: 2em;">
				<h1 style= "color: #74b9ff;">비밀번호 변경</h1>
			</div>
			
			<div class="cell flex-cell">
	       		<i class="fa-solid fa-unlock"></i>
				<input type="password" name="originPw" class="tool w-100" placeholder="기존 비밀번호">
			</div>
			<div class="cell flex-cell">
				<i class="fa-solid fa-lock"></i>
				<input type="password" name="changePw" class="tool w-100" placeholder="변경 비밀번호">
			</div>

			<c:if test="${param.error != null}">
				<div class="cell">
					<h3 style="color:red">기존 비밀번호가 일치하지 않습니다</h3>
				</div>
			</c:if>
			<div class="cell" style="margin-top: 2em;">
				<button type="submit" class="btn w-100" style="color: white; border-radius: 10px; background-color: #74b9ff;;"> 
					<i class="fa-solid fa-shuffle"style= "border-bottom: none; color: white; font-size: 20px;"></i>	
					<strong>	비밀번호 변경</strong>
					</button>
			</div>
		
		</div>
		
	</div>
</form>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>