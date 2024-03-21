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

.pt-15 {
	padding-top: 15px !important;
}
</style>


<!-- 로그인 한 회원의 구매서 목록 페이지 -->
<br>
<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>${shipSvcDto.shipSvcCustomerId}님의
				구매서 목록
			</div>
		</div>

		<div class="container inner-container">
			<div class="content content-head">
				<div class="content-head-text">
					<i class="fa-solid fa-user"></i>구매대행 신청서 목록
				</div>
			</div>
			<div class="content content-body">
				<div class="info-head w-100">
					<strong>배송대행 비용 견적서</strong>
				</div>
				<div class="info-body">
					<div class="info-group">
						<div class="info-label">주문번호</div>
						<div class="info-content-wrapper">
							<div class="info-content">${shipSvcDto.shipSvcNo}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">구매자</div>
						<div class="info-content-wrapper">
							<div class="info-content">${shipSvcDto.shipSvcNameKor}(${shipSvcDto.shipSvcNameEng})</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">환율</div>
						<div class="info-content-wrapper">
							<div class="info-content">${shipSvcDto.shipSvcFxRate}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">상품금액(외화)</div>
						<div class="info-content-wrapper">
							<div class="info-content">${shipSvcDto.shipSvcFx}</div>
						</div>
					</div>
					<!-- 여기서부터 DB에 전송할 데이터 값 -->
					<form action="orderInvoice" method="post">
						<div class="info-group pt-15">
							<div class="info-label">상품금액(원화)</div>
							<div class="info-content-wrapper">
								<input type="text" name="shipSvcItemPriceKrw" class="itemPrice"
									value="${shipSvcDto.itemPrice}" readonly>
							</div>
						</div>
						<div class="info-group pt-15">
							<div class="info-label">무게</div>
							<div class="info-content-wrapper">
								<input type="text" name="shipSvcItemWeight">
							</div>
						</div>
						<div class="info-group pt-15">
							<div class="info-label">총 결제금액</div>
							<div class="info-content-wrapper">
								<div class="info-content">${shipSvcDto.shipSvcTotalPriceKrw}</div>
							</div>
						</div>
						<div class="cell center pt-15">
							<input type="hidden" name="shipSvcNo"
								value="${shipSvcDto.shipSvcNo}">
							<button type="submit" class="btn">계산하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="">
			<a href="/admin/ship/orderDetail?shipSvcNo=${shipSvcDto.shipSvcNo}"
				class="link">
				<button class="btn">상세목록</button>
			</a>
		</div>
		<!-- 오른쪽 내용 닫는 태그 -->
	</div>
</div>
<!-- 컨테이너 자리 닫는 태그 -->





<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>