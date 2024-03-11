<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div>
<div><h1>공지사항</h1></div>
<form action="write" method="post" autocapitalize="off"> 
<!-- checkForm 해서 검사한번해야함 onsubmit="return checkForm" -->
<input type="hidden" name="noticeNo" value="${param.noticeNo}">
제목 : <input type="text" name="noticeTitle"><br><br>
내용 : <input type="text" name="noticeContent"><br><br>
작성자 : <input type="text" name="noticeWriter"><br><br>
작성일 : <input type="text" name="noticeWdate"><br><br>
조회수 : <input type="text" name="noticeVcount"><br><br>

<button>등록</button>
</form>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>