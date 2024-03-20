<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="write" method="post" autocapitalize="off">
	<!-- 답변글일 경우 대상의 번호가 반드시 등록페이지로 전송되야함-->
	<c:choose>
		<c:when test="${param.qnaTarget != null}">
			<input type="hidden" name="qnaTarget" value="${param.qnaTarget}">
			<input type="hidden" name="qnaStatus" value="답변용글">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="qnaStatus" value="미답변글">
		</c:otherwise>
	</c:choose>
	
	
	<input type="hidden" name="qna">

	<div class="container w-800">
		<div>
			<h1>Q&A글 작성</h1>
		</div>
		<c:if test="${param.qnaTarget == null}">
			<h2>공개여부</h2>
			<div class="cell">
				<input type="radio" name="qnaSecret" value="N" checked> <label>공개</label>
				<input type="radio" name="qnaSecret" value="Y"> <label>비공개</label>
			</div>
		</c:if>

		<h2>제목123</h2>
		<div>
			<input class="tool w-100" type="text" name="qnaTitle"
					value="[a] ${targetDto.qnaTitle}">
			


		</div>

		<h2>내용</h2>
		<div>
			<textarea class="imgArea" name="qnaContent"></textarea>
		</div>

		<button type="submit" class="btn">등록</button>
	</div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>