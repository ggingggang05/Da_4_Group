<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style> /* 레이아웃 디자인 */
.content-body {
	border: 1px solid #c3cacc;
	font-size: 14px;
	white-space: nowrap;
	margin: 20px 0 20px 0;
}

.info-head {
	font-size: 18px;
	text-align: left;
	background-color: #F5F6F7;;
	padding: 3px 0px 5px 10px;
	border-bottom: 1px solid #c3cacc;
	padding: 10px 0 12px 20px;
}

.info-body {
	padding: 15px 15px 15px 15px;
}

.info-group {
	display: flex;
	padding: 15px 0 15px 0;
	border-bottom: 1px solid #c3cacc;
}

.info-group:first-child {
	padding-top: 0;
}

.info-group:last-child {
	border: none;
	padding-bottom: 0;
}

.info-label {
	width: 20%;
	padding-right: 15px;
	text-align: right;
}

.info-content-wrapper {
	width: 80%;
	padding-left: 15px;
	text-align: left;
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
					<i class="fa-solid fa-money-check-dollar" style="color: #6c6e6e;"></i> ${sessionScope.loginId}님 결제
				</div>
			</div>
			<div class="content content-body">
				<div class="info-head w-100">
					<strong>영수증</strong>
				</div>
				<div class="info-body">
					<div class="info-group">
						<div class="info-label">주문번호</div>
						<div class="info-content-wrapper">
							<div class="info-content">${paymentVO.shipSvcNo}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">구매자</div>
						<div class="info-content-wrapper">
							<div class="info-content">${paymentVO.shipSvcNameKor}(${paymentVO.shipSvcNameEng})</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">환율</div>
						<div class="info-content-wrapper">
							<div class="info-content">${paymentVO.shipSvcFxRate}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">상품금액(외화)</div>
						<div class="info-content-wrapper">
							<div class="info-content">${paymentVO.shipSvcFx}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">상품금액(원화)</div>
						<div class="info-content-wrapper">
							<div class="info-content">${paymentVO.shipSvcItemPriceKrw}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">수수료</div>
						<div class="info-content-wrapper">
							<div class="info-content">${paymentVO.shipSvcServiceFee}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">총 결제금액</div>
						<div class="info-content-wrapper">
							<div class="info-content">${paymentVO.shipSvcTotalPriceKrw}</div>
						</div>
					</div>
				</div>
			</div><!-- content-body 닫는 태그 -->
			<div class="cell center flex-cell">
				<div class="cell w-50 right p-20">
					<a href="list" class="link">
						<button class="btn">목록으로</button>
					</a>
				</div>
				<div class="cell w-50 left p-20">
					<form action="payment" method="post">
						<input type="hidden" name="shipSvcNo" value="${paymentVO.shipSvcNo}">
						<input type="hidden" name="shipSvcPayDate" value="sysdate">
						<button type="submit" class="btn">결제하기</button> 
					</form>
				</div>
			</div>

		</div><!-- 오른쪽 내용 닫는 태그 -->
	</div>
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>