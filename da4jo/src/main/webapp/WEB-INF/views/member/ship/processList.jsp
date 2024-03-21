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
				<i class="fa-solid fa-pause"></i> ${session.loginId}님의 배송현황
			</div>
		</div>
		<div class="content content-body">
			<div class="cell listArea">
				<!-- 배송 진행 중인 구매서가 없다면 -->
				<c:if test="${empty shipList}">
					<div class="cell center mt-30">
						<i class="fa-regular fa-face-sad-tear fa-3x"></i>
						<h2>배송 진행 중인 배송 대행서가 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/ship/list" class="btn"> 
								<i class="fa-solid fa-paper"style="color: #B2BC76;"></i> 배송 대행서 목록 보기
							</a>
						</h2>
					</div>
				</c:if><!-- 배송 진행 중인 구매서가 없다면 닫는 태그 -->
				<!-- 배송 진행 중인 구매서가 있다면 -->
				<c:if test="${!empty shipList}">
					<ul class="menu menu-type">
						<li id="shipSvcNo"><strong>주문번호</strong></li>
						<li id="shipSvcItemEngName"><strong>주문서</strong></li><!-- 아이템 이름 -->
						<li id="shipSvcStatus"><strong>상태</strong></li>
						<li id="shipSvcAwbNumber"><strong>송장번호</strong></li>
						<li id="shipSvcTotalPriceKrw"><strong>결제금액</strong></li>
						<li id="shipSvcDetail"><strong>자세히 보기</strong></li>
					</ul>	
				
					<c:forEach var="shipSvcDto" items="${shipList}">
						<ul class="menu menu-list">
							<li id="shipSvcNo">${shipSvcDto.shipSvcNo}</li>
							<li id="shipSvcItemEngName">${shipSvcDto.shipSvcItemEngName}</li>
							<li id="shipSvcStatus">${shipSvcDto.shipSvcStatus}</li>
							<li id="shipSvcAwbNumber">${shipSvcDto.shipSvcAwbNumber}</li>
							<li id="shipSvcTotalPriceKrw">${shipSvcDto.shipSvcTotalPriceKrw}</li>
							<li id="shipSvcDetail"><a href="/mypage/ship/detail?shipSvcNo=${shipSvcDto.shipSvcNo}"><i class="fa-solid fa-magnifying-glass"></i></a></li>
						</ul>
					</c:forEach>					
				</c:if><!-- 배송 진행 중인 구매서가 있다면 닫는 태그 -->
			</div><!-- 구매서 리스트 닫는 태그-->
		</div><!-- 내용 바디 닫는 태그 -->
		<div class="cell">
			<%--네비게이터 --%>
			<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
		</div>
	</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>