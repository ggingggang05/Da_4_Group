<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<%-- UL로 변경 --%>

<div class="container w-1000">
	<div class="cell my-50">
		<h1>${qnaDto.qnaNo}번 Q&A</h1>
	</div>
	
	<div class="cell">
		<h2>제목 : ${qnaDto.qnaTitle}</h2>
	</div>

	<div class="cell flex-cell auto-width">
		<div class="cell">
			<h2>내용</h2>
		</div>
		<div class="cell">
			<div class="cell right">
				<label>작성자 : ${qnaDto.qnaWriter}</label>
			</div>
		</div>
	</div>

	<hr>
	<div class="cell" style="min-height: 250px">
		${qnaDto.qnaContent}
	</div>
	<hr>

	<div class="cell flex-cell auto-width">
		<div class="cell">
			<a class="btn" href="list">목록으로</a> 
			<a class ="btn" href="write">질문글작성</a> 
			<a class="btn" href="/board/qna/edit?qnaNo=${qnaDto.qnaNo}">질문글수정</a>
			<a class="btn negative" href="/board/qna/delete?qnaNo=${qnaDto.qnaNo}">질문글삭제</a>
		</div>
	
		<div class="cell right">
			<div class="cell">
				<label>작성일 : ${qnaDto.qnaWdate} </label>
				<label>조회수 : ${qnaDto.qnaVcount}</label>
			</div>
		</div>
	</div>


</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>