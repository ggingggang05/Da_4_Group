<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.input {
	border: 1px;
	color: red;
}
</style>

<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> [관리자] 댓글 작성
			</div>
		</div>
		<form action="write" method="post" autocapitalize="off">
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
			<c:if test="${param.qnaTarget == null}">
				<h2>공개여부</h2>
				<div class="cell">
					<input type="radio" name="qnaSecret" value="N" checked> <label>공개</label>
					<input type="radio" name="qnaSecret" value="Y"> <label>비공개</label>
				</div>
			</c:if>

				<div class="cell py-20 ms-10">
					<input type="hidden" name="qnaTitle" value="➜"> <input
						class="wTool w-100" type="text" name="qnaTitle" placeholder="제목을 작성해주세요"
						${targetDto.qnaTitle}>
				</div>
			<div>
				<textarea class="imgArea" name="qnaContent"></textarea>
			</div>

			<button type="submit" class="btn w-100 mt-10">등록</button>
		</form>

	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>