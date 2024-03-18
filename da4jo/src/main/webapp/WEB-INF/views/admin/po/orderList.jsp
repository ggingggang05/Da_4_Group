<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<i class="fa-solid fa-pause"></i> 구매대행목록
				</div>
			</div>
			<div class="content content-body">
				<div class="cell listArea">
					<ul class="menu menu-type">
						<li id="poNo"><strong>주문서번호</strong></li>
						<li id="poCustomerId"><strong>주문자</strong></li>
						<li id="poClearanceId"><strong>개인통관고유번호</strong></li>
						<li id="poContact"><strong>전화번호</strong></li>
						<li id="poAddress1"><strong>주소</strong></li>
						<li id="poStatus"><strong>상태</strong></li>
						<li id="poDetail"><strong>상세</strong></li>
					</ul>
					<c:forEach var="poDto" items="${poList}">
						<c:if test="${poDto.poStatus == '주문정보 확인 중'}">
						<ul class="menu menu-list">
							<li id="poNo">${poDto.poNo}</li>
							<li id="poCustomerId">${poDto.poCustomerId}</li>
							<li id="poClearanceId">${poDto.poClearanceId}</li>
							<li id="poContact">${poDto.poContact}</li>
							<li id="poAddress1">${poDto.poAddress1}</li>
							<li id="poStatus">${poDto.poStatus}</li>
							<li id="poDetail"><a
								href="orderDetail?poNo=${poDto.poNo}"><i
									class="fa-solid fa-list"></i></a></li>
						</ul>
						</c:if>			
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