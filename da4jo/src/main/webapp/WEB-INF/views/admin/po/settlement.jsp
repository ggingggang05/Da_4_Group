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
	<div class="container container-body container-body-long">
		<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
		<div class="container inner-container">
			<div class="content content-head">
				<div class="content-head-text">
					<i class="fa-solid fa-pause"></i> 
				</div>
			</div>
			<div class="content content-body">
				<div class="cell listArea">
					<ul class="menu menu-type">
						<li id=""><strong></strong></li>
						<li id=""><strong></strong></li>
						<li id=""><strong></strong></li>
						<li id=""><strong></strong></li>
						<li id=""><strong></strong></li>
						<li id=""><strong></strong></li>
					</ul>
					<c:forEach var="" items="">
						<ul class="menu menu-list">
							<li id=""></li>
							<li id="">
							<fmt:formatDate value="" 
									pattern="Y-MM-DD HH:mm:ss"/>
							</li>
							<li id="poCustomerId">${poDto.poNameKor}</li>
							<li id="poClearanceId">${poDto.poClearanceId}</li>
							<li id="poAddress1">${poDto.poAddress1}</li>
							<li id="poDetail"><a
								href="processDetail?poNo=${poDto.poNo}"><i
									class="fa-solid fa-list"></i></a></li>
						</ul>
					</c:forEach>
				</div>
				<div class="cell searchArea center">
				<form action="list" method="get">
					<select name="column" class="searchSelect">
						<option value="po_no"
							${param.column == 'po_no' ? 'selected' : ''}>주문서</option>
						<option value="po_customer_id"
							${param.column == 'po_customer_id' ? 'selected' : ''}>주문자</option>
					</select> <input type="search" name="keyword" placeholder=""
						value="${param.keyword}" class="searchBar">
					<button class="btn searchBtn">
						<i class="fa-solid fa-search"></i>
					</button>
				</form>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>