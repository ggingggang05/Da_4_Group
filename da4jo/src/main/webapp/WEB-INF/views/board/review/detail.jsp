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
	
	<div class="flex-cell">
	<div class="cell w-50">
		<h2>내용</h2>
	</div>
	
	<div class="cell w-50">
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
	
	<div class="cell right">
		<label>작성일</label>
		${reviewDto.reviewWdate}
		
		<label>조회수</label>
		${reviewDto.reviewVcount}
	</div>
	
	
  
	<div>
		<h2><a href="write">글쓰기</a></h2>
	</div>
	
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>