<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

  <!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>


<style>
.menu-type {
	margin: 0px !important;
}

.menu-list {
	margin: 0px !important;
}

.listArea {
	border: 1px solid #ced3d6;
}

#memberId {
	width: 23%;
}

#memerName {
	width: 13%;
}

#memberEmail {
	width: 50%;
}

#memberCode {
	width: 32%;
}

#isBlock, #memberDetail {
	width: 9%;
}
</style>
<form action="search" method="get">
	<div class="container container-body">
		<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
		<div class="container inner-container">
			<div class="content content-head">
				<div class="content-head-text">
					<i class="fa-solid fa-pause"></i> 멤버 찾기
				</div>
			</div>
			<div class="content content-body">
				<div class="cell listArea">
					<ul class="menu menu-type">
						<li id="memberId"><strong>아이디</strong></li>
						<li id="memberName"><strong>이름</strong></li>
						<li id="memberEmail"><strong>이메일</strong></li>
						<li id="memberCode"><strong>개인통관고유부호</strong></li>
						<li id="isBlock"><strong>차단</strong></li>
						<li id="memberDetail"><strong>상세</strong></li>
					</ul>
					<c:forEach var="memberDto" items="${list}">
						<ul class="menu menu-list">
							<li id="memberId">${memberDto.memberId}</li>
							<li id="memberName">${memberDto.memberNameKor}</li>
							<li id="memberEmail">${memberDto.memberEmail}</li>
							<li id="memberCode">${memberDto.memberClearanceId}</li>
							<li id="isBlock">${memberDto.memberBlock}</li>
							<li id="memberDetail"><a
								href="detail?memberId=${memberDto.memberId}"><i
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
		</div>
	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>