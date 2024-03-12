<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>${reviewDto.reviewNo}번 리뷰 보기</h1>

<table border="1" width="800">
	<tr>
		<td>
			${reviewDto.reviewTitle}
		</td>
	</tr>
	
	<tr>
		<td>
			${reviewDto.reviewWriter}
		</td>
	</tr>
	
	<tr height="200" valign="top">
		<td>
			${reviewDto.reviewContent}
		</td>
	</tr>
	
	<tr>
		<td>
			조회수[필요시에] ? 댓글 ? <br>
			작성날짜 : ${reviewDto.reviewWdate}
		</td>
	</tr>
</table>

<h2><a href="write">글쓰기</a></h2>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>