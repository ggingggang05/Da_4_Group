<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
제목 : <input type="text" name="noticeTitle"><br><br>
내용 : <textarea name="noticeContent"></textarea><br><br>


<button>등록</button>
</form>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>