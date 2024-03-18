<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.notice-date {
	font-size: 13px;
	color: #2d3436;
}

.notice-content {
	height: 400px;
	min-height: 400px;
}
</style>

<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 공지사항
			</div>
		</div>
		<!-- 내용자리 -->
		<div class="w-100 ms-10 mt-10 content ">
			<label>제목 : ${noticeDto.noticeTitle}</label>
		</div>
		<div class="right">
			<label class="notice-date">작성일 ${noticeDto.noticeWdate}</label>
		</div>
		<div class="w-100 notice-content ms-20">
			${noticeDto.noticeContent}</div>
		<div class="content content-head"></div>
		<div class="cell">
			<div class="cell flex-cell">
				<div class="cell w-50"><button class="btn">목록으로</button></div>
				<div class="cell w-50 right notice-date">조회수 ${noticeDto.noticeVcount}</div>
			</div>
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>