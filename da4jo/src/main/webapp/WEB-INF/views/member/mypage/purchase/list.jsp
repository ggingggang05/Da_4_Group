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
	<!-- 마이페이지 헤더 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>${session.loginId}님의 구매서 목록
			</div>
		</div>
	</div>
	<!-- 왼쪽 내용 -->
	<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>
	
	<!-- 오른쪽 내용 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 구매대행 신청서 목록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell listArea">
				<c:if test="${empty poList}"><!-- 구매서 작성 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-face-sad-tear fa-3x"></i>
						<h2>구매서 작성 내역이 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/member/po/request" class="btn"> 
								<i class="fa-solid fa-paper"style="color: #B2BC76;"></i> 작성하러 가기
							</a>
						</h2>
					</div>
				</c:if><!-- 구매서 작성 내역이 없는 경우 닫는 태그 -->
				<c:if test="${!empty poList}"><!-- 구매서 작성 내역이 있는 경우 -->
					<div class="cell flex-cell">
						<div class="cell searchArea w-75 left"><!-- 검색 기능 -->
							<form action="list" method="get">
								<select name="column" class="searchSelect">
									<option value="po_no" ${param.column == 'po_no' ? 'selected' : ''}>주문번호</option>
									<option value="po_status" ${param.column == 'po_status' ? 'selected' : ''}>상태</option>
									<option value="po_sdate" ${param.column == 'po_sdate' ? 'selected' : ''}>작성일</option>
								</select> 
								<input type="search" name="keyword" placeholder="" value="${param.keyword}" class="searchBar">
								<button class="btn searchBtn">
									<i class="fa-solid fa-search"></i>
								</button>
							</form>
						</div><!-- 검색기능 닫는 태그 -->
						<div class="cell w-25 right">
							<h2><a class="btn" href="/member/po/request" style="color: #B2BC76;">구매서 작성하기</a></h2>
						</div>
					</div>
					
					<ul class="menu menu-type">
						<li id="poNo"><strong>주문번호</strong></li>
						<li id="poItemEngName"><strong>주문서</strong></li><!-- 아이템 이름 -->
						<li id="poItemCategory"><strong>분류</strong></li>
						<li id="poSdate"><strong>작성일</strong></li>
						<li id="poStatus"><strong>상태</strong></li>
						<li id="poAwbNumber"><strong>송장번호</strong></li>
						<li id="poTotalPriceKrw"><strong>최종 결제금액</strong></li>
						<li id="poPayment"><strong>결제하기</strong></li>
					</ul>
					
				
					<c:forEach var="poDto" items="${poList}">
						<ul class="menu menu-list">
							<li id="poNo">${poDto.poNo}</li>
							<li id="poItemEngName"><a href="/member/mypage/purchase/detail?poNo=${poDto.poNo}" >${poDto.poItemEngName}</a></li>
							<li id="poItemCategory">${poDto.poItemCategory}</li>
							<li id="poSdate"><fmt:formatDate value="${poDto.poSdate}" pattern="y년 M월 d일 H시 m분 s초" /></li>
							<li id="poStatus">${poDto.poStatus}</li>
							<li id="poAwbNumber">${poDto.poAwbNumber}</li>
							<li id="poTotalPriceKrw"><fmt:formatNumber value="${poDto.poTotalPriceKrw}" pattern="#,##0"></fmt:formatNumber>원</li>
							<!-- 결제 -->
							<c:choose>
								<c:when test="${poDto.poStatus != '결제 대기 중'}"><!-- 만약 구매서 상태가 '결제 대기 중'이 아니라면 -->
									<!-- 결제 창 이동 막기 -->
									<li id="poPayment" class="payAlert">
										<a href="#" style="color: #B2BC76;">
											<i class="fa-solid fa-wallet"></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<!-- 결제 창으로 이동 -->
									<li id="poPayment">
										<a href="payment?poNo=${poDto.poNo}" style="color: #B2BC76;">
											<i class="fa-solid fa-wallet"></i>
										</a> 
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</c:forEach>					
				</c:if><!-- 구매서 작성 내역이 있는 경우 닫는 태그 -->
			</div><!-- 구매서 리스트 닫는 태그-->
		</div><!-- 내용 바디 닫는 태그 -->
	</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>