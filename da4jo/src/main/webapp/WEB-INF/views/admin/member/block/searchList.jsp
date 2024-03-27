<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.menu-type {
	margin: 0px !important;
}

.menu-list {
	margin: 0px !important;
}

.menu-list > li, .menu-type > li {
	margin: 0 5px 0 5px !important;
	padding: 0px !important;
}

.listArea {
	border: 1px solid #ced3d6;
}

#memberId {
	width: 18%;
}

#memberName {
	width: 20%;
}

#memberStatus {
	width: 13%;
}

#blockDate {
	width: 50%;
}
#blockReason {
	width: 20%;
}
#detail {
	width: 8%;
}
</style>
<form action="searchList" method="get">
	<div class="container container-body  container-body-long">
		<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
		<div class="container inner-container">
			<div class="content content-head">
				<div class="content-head-text">
					<i class="fa-solid fa-pause"></i> 차단회원관리
				</div>
			</div>
			<div class="content content-body">
				<div class="cell listArea">
					<ul class="menu menu-type">
						<li id="memberId"><strong>아이디</strong></li>
						<li id="memberName"><strong>이름</strong></li>
						<li id="memberStatus"><strong>상태</strong></li>
						<li id="blockDate"><strong>차단일자</strong></li>
						<li id="blockReason"><strong>차단이유</strong></li>
						<li id="detail"><strong>상세</strong></li>
					</ul>
					<c:forEach var="blockMemberVO" items="${list}">
						<ul class="menu menu-list">
							<li id="memberId">${blockMemberVO.memberId}</li>
							<li id="memberName">${blockMemberVO.memberNameKor}</li>
							<li id="memberStatus">${blockMemberVO.blockStatus}</li>
							<li id="blockDate"><fmt:formatDate value="${blockMemberVO.blockTimeDate}"
									pattern="y년 M월 d일 E H시 m분 s초" /></li>
							<li id="blockReason">${blockMemberVO.blockReason}</li>
							<li id="detail"><a
								href="${pageContext.request.contextPath}/admin/member/detail?memberId=${blockMemberVO.memberId}"><i
									class="fa-solid fa-list"></i></a></li>
						</ul>
					</c:forEach>
				</div>
				<div class="cell searchArea center">
					<input type="search" name="memberId" placeholder="아이디 검색"
						value="${param.memberId}" class="searchBar">
					<button class="btn searchBtn">
						<i class="fa-solid fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</form>



<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>
</body>
</html>