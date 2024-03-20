<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>게시글 수정</h1>

<form action="edit" method="post">
	<input type="hidden" name="noticeNo" value="${noticeDto.noticeNo}">
	
	제목 <input type="text" name="noticeTitle" value="${noticeDto.noticeTitle}" required> <br><br>
	내용 <textarea name="noticeContent" required>${noticeDto.noticeContent}</textarea><br><br>
	<button>수정</button>	
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>