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

.menu-type {
	background-color: #60A1F833 !important;
	height : 42px;
}

#poNo {
	width: 13%;
}

#poItemEngName {
	width: 31%;
}

#poStatus {
	width: 15%;
}

#poAwbNumber {
	width: 20%;
}

#poTotalPriceKrw{
	width: 20%;
} 

#poDetail {
	width: 11%;
}

</style>

<!-- 로그인 한 회원의 구매서 목록 페이지 -->
<br>
<br>
<div class="container container-body">
	<!-- 왼쪽 내용 -->
	<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>
	
	<!-- 오른쪽 내용 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-truck-fast" style="color: #6c6e6e;"></i> ${sessionScope.loginId}님의 배송현황
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<!-- 배송 진행 중인 구매서가 없다면 -->
				<c:if test="${empty poList}">
					<div class="cell center mt-30">
						<i class="fa-regular fa-circle-xmark fa-3x"></i>
						<h2>배송 진행 중인 구매서가 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/purchase/list" class="btn"> 
								<i class="fa-solid fa-paper"style="color: #B2BC76;"></i> 구매서 목록 보기
							</a>
						</h2>
					</div>
				</c:if><!-- 배송 진행 중인 구매서가 없다면 닫는 태그 -->
				<!-- 배송 진행 중인 구매서가 있다면 -->
				<c:if test="${!empty poList}">
					<ul class="menu menu-type">
						<li id="poNo"><strong>주문번호</strong></li>
						<li id="poItemEngName"><strong>주문서</strong></li><!-- 아이템 이름 -->
						<li id="poStatus"><strong>상태</strong></li>
						<li id="poAwbNumber"><strong>송장번호</strong></li>
						<li id="poTotalPriceKrw"><strong>결제금액</strong></li>
						<li id="poDetail"><strong>자세히</strong></li>
					</ul>	
				
					<c:forEach var="poDto" items="${poList}">
						<ul class="menu menu-list">
							<li id="poNo">${poDto.poNo}</li>
							<li id="poItemEngName">${poDto.poItemEngName}</li>
							<li id="poStatus">${poDto.poStatus}</li>
							<li id="poAwbNumber">${poDto.poAwbNumber}</li>
							<li id="poTotalPriceKrw"><fmt:formatNumber value="${poDto.poTotalPriceKrw}" pattern="#,##0"></fmt:formatNumber>원</li>
							<li id="poDetail"><a href="detail?poNo=${poDto.poNo}"><i class="fa-solid fa-magnifying-glass" style="color: #6c6e6e;"></i></a></li>
						</ul>
					</c:forEach>					
				</c:if><!-- 배송 진행 중인 구매서가 있다면 닫는 태그 -->
			</div><!-- 구매서 리스트 닫는 태그-->
		</div><!-- 내용 바디 닫는 태그 -->
		<div class="page-navigator"> <!-- 네비게이터 태그 -->
			<%-- 이전이 있을 경우만 링크를 제공 --%>
			<c:choose>
				<c:when test="${pageVO.isFirstBlock()}">
					<a class="off">&lt;이전</a>
				</c:when>
				<c:otherwise>
					<a href="pendingPayment?page=${pageVO.getPrevBlock()}&${pageVO.getQueryString()}">&lt;이전</a>
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
						<a href="pendingPayment?page=${i}&${pageVO.getQueryString()}">${i}</a>
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
						href="pendingPayment?page=${pageVO.getNextBlock()}&${pageVO.getQueryString()}">다음&gt;</a>
				</c:otherwise>
			</c:choose>
		</div><!-- 네비게이터 닫는 태그 -->
	</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>