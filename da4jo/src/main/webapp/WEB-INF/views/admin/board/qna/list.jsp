<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.menu.menu-type {
	border-bottom: 1px solid #CAE4FF;
	border-top: 1px solid #CAE4FF;
	background-color: #DEEEFF;
}

.bottom-bar div:first-child {
	width: 750px;
}

.menu.menu-type.qnaMenu {
	height: 40px !important;
}

.menu.menu-list.qnaMenu {
	height: 40px !important;
}

.qnaTitlteLock {
	color: #d63031 !important;
}

#qnaNo {
	width: 9% !important;
}

#qnaRock {
	width: 15% !important;
}

#typeQnaTitle {
	text-align: center;
	width: 60% !important;
}

#qnaTitle {
	text-align: left;
	width: 60% !important;
}

#qnaMember {
	text-align: left;
	width: 60% !important;
}

#qnaMember1 {
	text-align: center;
	width: 60% !important;
}

#qnaWdate {
	width: 21% !important;
}

#qnaStatus {
	width: 15% !important;
}
</style>

<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> Q&A 게시판
			</div>
		</div>

		<%-- 질문글 미답변 목록 --%>
		<div class="content content-head">
			<div class="content-head-text">질문글 미답변 목록</div>
		</div>
		<div class="content content-body right">
			<div class="cell center"></div>
			<div class="cell center">

				<div>
					<ul class="menu menu-type qnaMenu">
						<li id="qnaNo">번호</li>
						<li id="qnaRock">잠금상태</li>
						<li id="typeQnaTitle">제목</li>
						<li id="qnaWdate">작성일</li>
						<li id="qnaStatus">현재상태</li>
					</ul>

					<c:forEach var="qnaDto" items="${list}">
						<c:if test="${qnaDto.qnaStatus eq '미답변글'}">
							<ul class="menu menu-list qnaMenu">
								<li id="qnaNo">${qnaDto.qnaNo}</li>
								<li id="qnaRock">${qnaDto.qnaSecret}</li>
								<li id="qnaTitle"><a href="detail?qnaNo=${qnaDto.qnaNo}">${qnaDto.qnaTitle}</a></li>
								<li id="qnaWdate">${qnaDto.qnaWdate}</li>
								<li id="qnaStatus"><a
									href="write?qnaTarget=${qnaDto.qnaNo}">${qnaDto.qnaStatus}</a></li>
							</ul>
						</c:if>
					</c:forEach>
				</div>

				<div class="cell">
					<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<%-- 질문글 미답변 목록 --%>
 

		<%-- 답글에 대한 목록 --%>
		<div class="content content-head">
			<div class="content-head-text">답글에 대한 목록</div>
		</div>
		<div class="content content-body right">
			<div class="cell center"></div>
			<div class="cell center">

				<div class="cell">
					<ul class="menu menu-type qnaMenu">
						<li id="qnaNo">번호</li>
						<li id="qnaRock">잠금상태</li>
						<li id="typeQnaTitle">제목</li>
						<li id="qnaWdate">작성일</li>
						<li id="qnaStatus">현재상태</li>
					</ul>
					<c:forEach var="qnaDto" items="${list}">
						<ul class="menu menu-list qnaMenu">
							<li id="qnaNo">${qnaDto.qnaNo}</li>
							<li id="qnaRock">${qnaDto.qnaSecret}</li>
							<li id="qnaTitle"><a href="detail?qnaNo=${qnaDto.qnaNo}">${qnaDto.qnaTitle}</a></li>
							<li id="qnaWdate">${qnaDto.qnaWdate}</li>
							<li id="qnaStatus">${qnaDto.qnaStatus}</li>
						</ul>
					</c:forEach>
				</div>
				<div class="cell">
					<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<%-- 답글에 대한 목록 --%>


	</div>
</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>