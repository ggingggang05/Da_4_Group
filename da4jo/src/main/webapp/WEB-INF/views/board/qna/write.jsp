<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--  --%>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>질문글 작성하기
			</div>
		</div>
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

		<div class="cell">
		<c:if test="${param.qnaTarget == null}">
			
		<h3><i class="fa-solid fa-asterisk blue"></i>&nbsp;공개여부</h3>
				
			<div class="cell">
				<input type="radio" name="qnaSecret" value="N" checked> <label>공개</label>

				<input type="radio" name="qnaSecret" value="Y"> <label>비공개</label>
			</div>
		</c:if>
	</div>
	

		<div>
			<input class="wTool w-100" type="text" name="qnaTitle" placeholder="작성하실 질문의 내용을 입력해주세요." required="제목입력은 필수입니다.">
		</div>

		<h3><i class="fa-solid fa-asterisk blue"></i>&nbsp;내용 [이미지 첨부가능]</h3>
		<div>
			<textarea class="imgArea" name="qnaContent" required></textarea>
		</div>

		<button type="submit" class="btn">등록</button>
</form>
		
	</div>
</div>







<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>