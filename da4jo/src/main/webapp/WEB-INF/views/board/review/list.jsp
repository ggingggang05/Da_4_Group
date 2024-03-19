<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jquery cdn -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>

<script>
	$(function() {
		//출력용
		$(".score").score({
			starColor : "#47a3ff", //별 색상
			display : {//표시 옵션
				showNumber : false,//숫자 표시 여부
				textColor : "#47a3ff", //글자 색상
				placeLimit : 0,//표시할 소수점 자리수
			},
		});
	});
</script>

<style>
.menu.menu-type {
	border-bottom: 1px solid #CAE4FF;
	border-top: 1px solid #CAE4FF;
	background-color: #DEEEFF;
}

.py-60 {
	padding-top: 60px !important;
	padding-bottom: 60px !important;
}

.bottom-bar div:first-child {
	width: 750px;
}

#reviewNo {
	width: 15% !important;
}

#reviewImg {
	width: 25% !important;
}

#reviewTitle {
	width: 55% !important;
}

#reviewWriter {
	width: 15% !important;
}
</style>

<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 리뷰 게시판
			</div>
		</div>
		<div class="content content-body right">

			<div class="cell center"></div>
			<div class="cell center my-50">

				<ul class="menu menu-type center">
					<li id="reviewNo">번호</li>
					<li id="reviewImg">이미지</li>
					<li id="reviewTitle">제목</li>
					<li id="reviewWriter">작성자</li>
					<li id="">작성일</li>
					<li id="">별점</li>
				</ul>

				<div class="score-edit" data-max="5.0">
					<c:forEach var="reviewDto" items="${list}">
						<ul class="menu menu-list center py-60">
							<li id="reviewNo">${reviewDto.reviewNo}</li>
							<!-- <li><img src="/download?imgNo=166"></li> -->
							<li id="reviewImg"><img
								src="image?reviewNo=${reviewDto.reviewNo}" width="100"
								height="100"></li>
							<li id="reviewTitle"><a
								href="detail?reviewNo=${reviewDto.reviewNo}">${reviewDto.reviewTitle}</a>
							</li>
							<li id="reviewWriter">${reviewDto.reviewWriter}</li>
							<li>${reviewDto.reviewWdate}</li>
							<li>
								<div class="cell">
									<div class="score" data-max="5.0"
										data-rate="${reviewDto.reviewStar}"></div>
								</div>
							</li>
						</ul>
					</c:forEach>

					<%-- 검색창 --%>
					<div class="cell center flex-cell my-50 bottom-bar">
						<div class="cell search-wrapper">
							<form action="list" method="get">
								<select class="btn" name="column">
									<option value="review_title"
										${param.column == 'review_title' ? 'selected' : ''}>제목</option>
									<option value="review_writer"
										${param.column == 'review_writer' ? 'selected' : ''}>작성자</option>
									<option value="review_content"
										${param.column == 'review_content' ? 'selected' : ''}>내용</option>
								</select> <input class="tool w-50" type="search" name="keyword"
									placeholder="검색어 입력" required value="${param.keyword}">
								<button class="btn">검색</button>
							</form>
						</div>
						<div class="cell right">
							<a href="write" class="btn">리뷰 글쓰기</a>
						</div>
					</div>
				</div>

				<div class="cell">
					<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>