<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<i class="fa-solid fa-pause"></i> 배송대기목록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell listArea">
				<ul class="menu menu-type">
					<li id="poNo"><strong>주문서번호</strong></li>
					<li id="poContact"><strong>결제시간</strong></li>
					<li id="poCustomerId"><strong>주문자</strong></li>
					<li id="poClearanceId"><strong>개인통관고유번호</strong></li>
					<li id="poAddress1"><strong>주소</strong></li>
					<li id="poStatus"><strong>상태</strong></li>
					<li id="poDetail"><strong>상세</strong></li>
				</ul>
				<c:forEach var="poDto" items="${poDto}">
					<c:if test="${poDto.poStatus == '결제완료'}">
						<ul class="menu menu-list">
							<li id="poNo">${poDto.poNo}</li>
							<li id="poContact"><fmt:formatDate
									value="${poDto.poPayDate}" pattern="Y-MM-dd HH:mm:ss" /></li>
							<li id="poCustomerId">${poDto.poNameKor}</li>
							<li id="poClearanceId">${poDto.poClearanceId}</li>
							<li id="poAddress1">${poDto.poAddress1}</li>
							<li id="poStatus">${poDto.poStatus}</li>
							<li id="poDetail"><a href="processDetail?poNo=${poDto.poNo}"><i
									class="fa-solid fa-list"></i></a></li>
						</ul>
					</c:if>
				</c:forEach>
			</div>
			<div class="cell searchArea center">
				<form action="processList" method="get">
					<select name="column" class="searchSelect">
						<option value="po_no" ${param.column == 'po_no' ? 'selected' : ''}>주문서</option>
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
		<div class="page-navigator">
			<%-- 이전이 있을 경우만 링크를 제공 --%>
			<c:choose>
				<c:when test="${pageVO.isFirstBlock()}">
					<a class="off">&lt;이전</a>
				</c:when>
				<c:otherwise>
					<a
						href="processList?page=${pageVO.getPrevBlock()}&${pageVO.getQueryString()}">&lt;이전</a>
				</c:otherwise>
			</c:choose>

			<%-- for(int i=beginBlock; i <= endBlock; i++) { .. } --%>
			<c:forEach var="i" begin="${pageVO.getBeginBlock()}"
				end="${pageVO.getEndBlock()}" step="1">
				<%-- 다른 페이지일 경우만 링크를 제공 --%>
				<c:choose>
					<c:when test="${pageVO.isCurrentPage(i)}">
						<a class="on">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="processList?page=${i}&${pageVO.getQueryString()}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<%-- 다음이 있을 경우만 링크를 제공 --%>
			<c:choose>
				<c:when test="${pageVO.isLastBlock()}">
					<a class="off">다음&gt;</a>
				</c:when>
				<c:otherwise>
					<a
						href="processList?page=${pageVO.getNextBlock()}&${pageVO.getQueryString()}">다음&gt;</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>