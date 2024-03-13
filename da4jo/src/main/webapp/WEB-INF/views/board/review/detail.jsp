<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<%-- UL로 변경 --%>

<div class="container w-1000">
	<div class="cell my-50">
		<h1>${reviewDto.reviewNo}번 리뷰 보기</h1>
	</div>
	
	<div class="cell">
		<h2>제목 : ${reviewDto.reviewTitle}</h2>
	</div>

	<div class="cell flex-cell auto-width">
		<div class="cell">
			<h2>내용</h2>
		</div>
		<div class="cell">
			<div class="cell right">
				<label>작성자 : ${reviewDto.reviewWriter}</label>
			</div>
		</div>
	</div>

	<hr>
	<div class="cell" style="min-height: 250px">
		${reviewDto.reviewContent}
	</div>
	<hr>

	<div class="cell flex-cell auto-width">
		<div class="cell">
			<a class="btn" href="list">목록으로</a> 
			<a class ="btn" href="write">리뷰글작성</a> 
			<a class="btn" href="/board/review/edit?reviewNo=${reviewDto.reviewNo}">리뷰글수정</a>
			<a class="btn negative" href="/board/review/delete?reviewNo=${reviewDto.reviewNo}">리뷰글삭제</a>
		</div>
	
		<div class="cell right">
			<div class="cell">
				<label>작성일 : ${reviewDto.reviewWdate} </label>
				<label>조회수 : ${reviewDto.reviewVcount}</label>
			</div>
		</div>
	</div>


</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>