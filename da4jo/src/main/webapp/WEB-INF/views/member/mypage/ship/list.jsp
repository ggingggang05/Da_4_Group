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


</style>


<script type="text/javascript">    
     $(function(){
            $(".payAlert").on("click", function() {
				var choice = window.alert("결제 단계가 아닙니다!");
				if(choice == false) return;
    		});
        });
</script>


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
				<i class="fa-solid fa-pause"></i> ${sessionScope.loginId}님의 배송대행 신청서 목록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell listArea">
				<c:if test="${empty shipList}"><!-- 배송 대행서 작성 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-circle-xmark fa-3x"></i>
						<h2>배송 대행서 작성 내역이 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/member/ship/request" class="btn"> 
								<i class="fa-solid fa-paper"style="color: #B2BC76;"></i> 작성하러 가기
							</a>
						</h2>
					</div>
				</c:if><!-- 배송 대행서 작성 내역이 없는 경우 닫는 태그 -->
				<c:if test="${!empty shipList}"><!-- 배송 대행서 작성 내역이 있는 경우 -->
					<div class="cell flex-cell">
						<div class="cell searchArea w-75 left"><!-- 검색 기능 -->
							<form action="list" method="get">
								<select name="column" class="searchSelect">
									<option value="shipsvc_no" ${param.column == 'shipsvc_no' ? 'selected' : ''}>주문번호</option>
									<option value="shipsvc_status" ${param.column == 'shipsvc_status' ? 'selected' : ''}>상태</option>
									<%-- <option value="shipsvc_sdate" ${param.column == 'shipsvc_sdate' ? 'selected' : ''}>작성일</option> --%>
								</select> 
								<input type="search" name="keyword" placeholder="" value="${param.keyword}" class="searchBar">
								<button class="btn searchBtn">
									<i class="fa-solid fa-search"></i>
								</button>
							</form>
						</div><!-- 검색기능 닫는 태그 -->
						<div class="cell w-25 right">
							<h2><a class="btn" href="/member/ship/request" style="color: #B2BC76;">배송서 작성하기</a></h2>
						</div>
					</div>
					
					<ul class="menu menu-type">
						<li id="shipSvcNo"><strong>주문번호</strong></li>
						<li id="shipSvcItemEngName"><strong>주문서</strong></li><!-- 아이템 이름 -->
						<li id="shipSvcItemCategory"><strong>분류</strong></li>
						<li id="shipSvcSdate"><strong>작성일</strong></li>
						<li id="shipSvcStatus"><strong>상태</strong></li>
						<li id="shipSvcTotalPriceKrw"><strong>최종 결제금액</strong></li>
						<li id="shipSvcPayment"><strong>결제하기</strong></li>
					</ul>
					
				
					<c:forEach var="shipSvcDto" items="${shipList}">
						<ul class="menu menu-list">
							<li id="shipSvcNo">${shipSvcDto.shipSvcNo}</li>
							<li id="shipSvcItemEngName"><a href="/member/mypage/purchase/detail?shipSvcNo=${shipSvcDto.shipSvcNo}" >${shipSvcDto.shipSvcItemEngName}</a></li>
							<li id="shipSvcItemCategory">${shipSvcDto.shipSvcItemCategory}</li>
							<li id="shipSvcSdate"><fmt:formatDate value="${shipSvcDto.shipSvcSDate}" pattern="y년 M월 d일" /></li>
							<li id="shipSvcStatus">${shipSvcDto.shipSvcStatus}</li>
							<li id="shipSvcTotalPriceKrw"><fmt:formatNumber value="${shipSvcDto.shipSvcTotalPriceKrw}" pattern="#,##0"></fmt:formatNumber>원</li>
							<!-- 결제 -->
							<c:choose>
								<c:when test="${shipSvcDto.shipSvcStatus != '결제 대기 중'}"><!-- 만약 구매서 상태가 '결제 대기 중'이 아니라면 -->
									<!-- 결제 창 이동 막기 -->
									<li id="shipSvcPayment" class="payAlert">
										<a href="#" style="color: #B2BC76;">
											<i class="fa-solid fa-wallet"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<!-- 결제 창으로 이동 -->
									<li id="shipSvcPayment">
										<a href="payment?shipSvcNo=${shipSvcDto.shipSvcNo}" style="color: #B2BC76;">
											<i class="fa-solid fa-wallet"></i>
										</a> 
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:forEach>					
				</c:if><!-- 배송 대행서 내역이 있는 경우 닫는 태그 -->
			</div><!-- 배송서 리스트 닫는 태그-->
		</div><!-- 내용 바디 닫는 태그 -->
		<div class="cell">
			<%--네비게이터 --%>
			<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
		</div>
	</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>