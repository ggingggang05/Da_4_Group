<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container w-800">
<h1>공지사항</h1>
<hr>
<div class="cell center">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody align="center">
		<%-- 공지사항 리스트 반복구문 --%>		
	<c:forEach var="noticeDto" items="${noticeList}">
	    <tr>
	    	<td>${noticeDto.noticeNo}</td>
	    	<td><a class="link" href="detail?noticeNo=${noticeDto.noticeNo}">
	    	${noticeDto.noticeTitle}</a></td> <%-- 제목누르면 공지디테일로 이동 --%>
	        <td>${noticeDto.noticeWriter}</td>
	        <td>${noticeDto.noticeWdate}</td>
	        <td>${noticeDto.noticeVcount}</td>
	    </tr>
	</c:forEach>
	</table>

</div>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>