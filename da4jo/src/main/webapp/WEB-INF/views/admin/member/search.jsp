<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.menu-type {
	background-color: #F1F3F5;
	border-bottom: 1px solid #2D3436;
	border-top: 1px solid #2D3436;
}
.menu-list {
	border-bottom: 1px solid #DEE2E6;
}
.menu-type li:nth-child(4),
.menu-list li:nth-child(4) {
	width: 350px;
}
.menu-type li:nth-child(7),
.menu-list li:nth-child(7) {
	width: 100px;
}
.menu-type li:nth-child(8),
.menu-list li:nth-child(8) {
	width: 100px;
}


</style>
<form action="search" method="get">
	<div class="container container-body">
		<div class="cell listArea">
			<ul class="menu menu-type">
				<li>아이디</li>
				<li>이름</li>
				<li>이름(영문)</li>
				<li>이메일</li>
				<li>개인통관고유부호</li>
				<li>차단여부</li>
				<li>상세</li>
			</ul>
			<c:forEach var="memberDto" items="${list}">
				<ul class="menu menu-list">
					<li>${memberDto.memberId}</li>
					<li>${memberDto.memberNameKor}</li>
					<li>${memberDto.memberNameEng}</li>
					<li>${memberDto.memberEmail}</li>
					<li>${memberDto.memberClearanceId}</li>
					<li>${memberDto.memberBlock}</li>
					<li><a href="detail?memberId=${memberDto.memberId}"><i
							class="fa-solid fa-list"></i></a></li>
				</ul>
			</c:forEach>
		</div>
		<div class="cell searchArea center">
			<select name="column" class="searchSelect">
				<option value="MEMBER_ID"
					${param.column == 'MEMBER_ID' ? 'selected' : ''}>아이디</option>
				<option value="MEMBER_NAME_KOR"
					${param.column == 'MEMBER_NAME_KOR' ? 'selected' : ''}>이름</option>
				<option value="MEMBER_NAME_ENG"
					${param.column == 'MEMBER_NAME_ENG' ? 'selected' : ''}>이름(영문)</option>
				<option value="MEMBER_EMAIL"
					${param.column == 'MEMBER_EMAIL' ? 'selected' : ''}>이메일</option>
				<option value="MEMBER_CLEARANCE_ID"
					${param.column == 'MEMBER_CLEARANCE_ID' ? 'selected' : ''}>통관부호</option>
			</select> <input type="search" name="keyword" placeholder=""
				value="${param.keyword}" class="searchBar">
			<button class="btn searchBtn">
				<i class="fa-solid fa-search"></i>
			</button>
		</div>
	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>