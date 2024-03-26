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

#shipNo {
	width: 10%;
}

#shipPayDate {
	width: 15%;
}

#shipNameKor {
	width: 10%;
}


#shipCustomerId {
	width: 20%;
}

#shipAddress1 {
	width: 30%;
}
#shipStatus {
	width: 10%;
}
#shipStatusChange {
	width: 20%;
}

#shipDetail {
	width: 7%;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#changeStatusButton").on("click", function(e) {
			if ($("#StatusSelect").val() === "") {
				e.preventDefault(); // 폼의 제출을 막음
				return; // 버튼 동작 중지
			}
		});
	})
</script>

<div class="container container-body container-body-long">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 구매대행 배송처리 목록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell listArea">
				<ul class="menu menu-type">
					<li id="shipNo"><strong>주문서번호</strong></li>
					<li id="shipPayDate"><strong>결제시간</strong></li>
					<li id="shipNameKor"><strong>주문자</strong></li>
					<li id="shipClearanceId"><strong>개인통관고유번호</strong></li>
					<li id="shipAddress1"><strong>주소</strong></li>
					<li id="shipStatus"><strong>상태</strong></li>
					<li id="shipStatusChange"><strong>상태변경</strong></li>
					<li id="shipDetail"><strong>상세</strong></li>
				</ul>
				<c:forEach var="shipDto" items="${shipList}">
					<c:if test="${shipDto.shipSvcStatus == '배송 중'}">
						<form action="processingList" method="post">
							<input name="shipSvcNo" value="${shipDto.shipSvcNo}" type="hidden">
							<ul class="menu menu-list">
								<li id="shipNo">${shipDto.shipSvcNo}</li>
								<li id="shipPayDate"><fmt:formatDate
										value="${shipDto.shipSvcPayDate}" pattern="Y-MM-dd HH:mm" /></li>
								<li id="shipNameKor">${shipDto.shipSvcNameKor}</li>
								<li id="shipClearanceId">${shipDto.shipSvcClearanceId}</li>
								<li id="shipAddress1">${shipDto.shipSvcAddress1}</li>
								<li id="shipStatus">${shipDto.shipSvcStatus}</li>
								<li id="shipStatusChange" class="flex-cell">
									<select name="shipSvcStatus" id="StatusSelect" class="tool w-75">
										<option value="">선택하세요</option>
										<option value="배송 중">배송중</option>
										<option value="배송완료">배송완료</option>
									</select>
									<button id="changeStatusButton" class="w-25">변경</button>
								</li>
								<li id="shipDetail"><a href="processDetail?shipSvcNo=${shipDto.shipSvcNo}"><i
										class="fa-solid fa-list"></i></a></li>
							</ul>
						</form>
						
					</c:if>
				</c:forEach>
			</div>
			<div class="cell searchArea center">
				<form action="processingList" method="get">
					<select name="column" class="searchSelect">
						<option value="ship_no" ${param.column == 'shipSvc_no' ? 'selected' : ''}>주문서</option>
						<option value="ship_customer_id"
							${param.column == 'shipSvc_customer_id' ? 'selected' : ''}>주문자</option>
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
						href="processingList?page=${pageVO.getPrevBlock()}&${pageVO.getQueryString()}">&lt;이전</a>
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
						<a href="processingList?page=${i}&${pageVO.getQueryString()}">${i}</a>
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
						href="processingList?page=${pageVO.getNextBlock()}&${pageVO.getQueryString()}">다음&gt;</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>
</body>
</html>