<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
	/*아이디,비밀번호 placeholder*/		
	input.tool::placeholder {
	    color: #b2bec3;
	    font-size: 14px;
	}
	
	/*입력창 (아이디,패스워드)*/
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
	button {
		background-color: #74b9ff;
	}

</style>
<!-- 아이디 찾기 -->
<form action="findId" method="post" autocomplete="off">
<div class="container w-500 right" style= "margin-top: 6em; margin-bottom: 6em;">
	<div class="container w-400">
		<div class="cell center" style="margin-bottom: 2em;">
			<h1 style= "color: #74b9ff;">아이디 찾기</h1>
		</div>
		<!-- 한글이름 입력창 -->
         <div class="cell flex-cell">
       		<i class="fa-regular fa-id-card"></i>
           <input type="text" name="memberNameKor" placeholder="한글이름을 입력하세요" class="tool w-100">
       </div>
       <!-- 이메일 입력창 -->
       <div class="cell flex-cell"> 
       		<i class="fa-solid fa-envelope"></i>
           <input type="email" name="memberEmail" placeholder="이메일을 입력하세요" class="tool w-100">
       </div>
 		<div class="cell">
	   		<c:if test="${param.error != null}">
			<h4 style= "color:red" class="left"> 입력하신 정보가 일치하지 않습니다.</h4>
			</c:if>
	   </div>
		<div class="cell" style= "margin-top: 2em;">
			<button type="submit" class="btn w-100"  style= "color: white; border-radius: 10px;" >
				<i class="fa-solid fa-glasses" style= "border-bottom: none; color: white; font-size: 20px;"></i>
				<label style= "font-size: 18px;">안경쓰고 찾아보기</label>
			</button>
		</div>
	</div>
</div>
</form>
 
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>