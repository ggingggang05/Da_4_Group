<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


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
						<div class="right">
							<h2><a class="btn" href="/member/po/request" style="color: #B2BC76;">구매서 작성하기</a></h2>
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
								<li id="poItemEngName"><a href="/member/mypage/purchase/detail?poNo=${poDto.poNo}" >${poDto.poItemEngName}</li>
								<li id="poItemCategory">${poDto.poItemCategory}</li>
								<li id="poSdate">${poDto.poSdate}</li>
								<li id="poStatus">${poDto.poStatus}</li>
								<li id="poAwbNumber">${poDto.poAwbNumber}</li>
								<li id="poTotalPriceKrw">${poDto.poTotalPriceKrw}</li>
								<li id="poPayment"><a href="payment?poNo=${poDto.poNo}" style="color: #B2BC76;"><i
									class="fa-solid fa-wallet"></i></a> <!-- 결제 -->
								</li>
							</ul>
						</c:forEach>					
					</c:if><!-- 구매서 작성 내역이 있는 경우 닫는 태그 -->
				</div>
			</div><!-- 내용 바디 닫는 태그 -->
		</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>