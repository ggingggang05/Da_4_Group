<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.new {
	list-style: none; /*list에 표기되는 모양 제거 */
	margin: 0 10px; /* 기본 여백 제거 */
	padding: 0; /* 기본 여백 제거 */
	display: flex;
	flex-direction: row;
	align-items: center;
	height: 60px;
}

.t1 {
	border-bottom: 0.5px solid #CAE4FF;
	border-top: 0.5px solid #CAE4FF;
	background-color: #DEEEFF;
}
.t1.width-fill {
	background-color: white;
}

.t2 {
	border-bottom: 0.5px solid #CAE4FF;
	background-color: #DEEEFF;
}
.t2.width-fill {
	background-color: white;
}
</style>

<!-- jquery cdn -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>

<script type="text/javascript">
	$(function() {
		//출력용
		$(".score").score({
			starColor : "#fed330", //별 색상
			display : {//표시 옵션
				showNumber : true,//숫자 표시 여부
				textColor : "#fed330", //글자 색상
				placeLimit : 2,//표시할 소수점 자리수
			},
		});
	});
</script>

<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content-head-text">
			<i class="fa-solid fa-pause"></i>${reviewDto.reviewNo}번 리뷰글
		</div>



		<br>
		<div class="t1 flex-cell">
			<div class="t1 w-20 center py-10"><strong>제   목</strong></div>
			<div class="t1 width-fill py-10 px-10">${reviewDto.reviewTitle}</div>
		</div>
		<div class="t2 flex-cell">
			<div class="t2 w-20 center py-10"><strong>작성자</strong></div>
			<div class="t2 width-fill py-10 px-10"">${reviewDto.reviewWriter}</div>
		</div>

		<h2>내용</h2>
		<hr>
		<div class="cell" style="min-height: 250px">
			${reviewDto.reviewContent}</div>
		<hr>


		<div class="cell flex-cell auto-width">
			<div class="cell">
				<c:if
					test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}">
					<a class="btn" href="list">목록으로</a>
					<a class="btn" href="write">리뷰글작성</a>
					<a class="btn"
						href="/board/review/edit?reviewNo=${reviewDto.reviewNo}">리뷰글수정</a>
					<a class="btn negative"
						href="/board/review/delete?reviewNo=${reviewDto.reviewNo}">리뷰글삭제</a>
				</c:if>

			</div>
			
<!-- 			<div class="score left" data-max="5.0" -->
<%-- 				data-rate="${reviewDto.reviewStar}"></div> --%>

			<div class="cell right">
				<div class="cell">
					<label>작성일 : ${reviewDto.reviewWdate} </label> <label>조회수 :
						${reviewDto.reviewVcount}</label>


				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>