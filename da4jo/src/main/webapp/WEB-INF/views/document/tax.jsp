<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.text-box {
	border: 1px solid #d8d8d8;
	background-color: #f8f8f8;
	padding: 10px;
}
h6 {
	font-size: 14px;
	margin: 10px 0 10px 0;
}
</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/document-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>관/부가세 안내
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>관/부가세 안내</h5>
			</div>
			<div class="cell content-body-text">
				<strong>관세란 </strong>해외에서 구매한 물건에 대해 부과/징수하는 세금이며,<br> 
				부가세는 	해외에서 관세에 대한 부가가치세(부가세)를 합한 세금입니다.
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					※ 관부가세 계산법<br> - 과세가격 = 총 결제 금액(상품가+현지운송비+TAX) X 관세청 고시환율 X
					과세운임<br> - 관세 = 과세가격 X 구입한 품목의 관세율<br> - 부가세 = (과세가격 X
					관세) X 10%
				</div>
			</div>
			<div class="cell content-body-text">
				<h6>○ 합산과세란</h6>
				동일한 날에 2건 이상이 통관됨에 따라 면세 기준 금액임에도 과세되는 세금입니다.
				<ul class="info-list">
					<li>동일 수취인 앞으로 동일한 날짜에 2건 이상 수입신고 시</li>
					<li>입항날짜가 다른 경우 자가사용으로 인정되며 개별 면세하되, 전산자료 등을 분석하여 부당면세 협의가 있는 경우 추징됩니다.</li>
					<li>
						동일 국가에서 동일 수령인에게 발송되어 같은날 한국 세관 통관장에 도착하는 경우,<br>
						해당되는 상품의 가격은 모두 합산되어 과세 여부가 결정 됩니다.<br>
						특히, 각 신청서의 상품이 면세범위 가격이더라도 같은날 통관장에 반입되고 수령인이 같다면<br>
						상품의 금액이 모두 더해지고, 더해진 금액이 과세 면세범위를 초과한다면 관세가 발생합니다.
					</li>
					<li>
						합산과세가 걱정되시는 경우에는 [출고보류] 기능을 활용하시어<br>
						합산되지 않도록 순차 출고를 하시도록 권해 드립니다.<br>
						다사조는 배송대행지로 과세에 대해서는 일절 개입이 불가하며<br>
						과세되는 경우 책임을 져 드릴수 없으므로 꼭 주의를 부탁드립니다.
					</li>
					<li>
						합산과세로 인하여 고객님께 과세가 되면 통관업체에서 고객님께 연락이 가게 되며,<br>
						해당되는 금액을 직접 통관업체에 과세금액을 지불하셔야 통관이 진행됩니다.
					</li>	
				</ul>
			<h6>○ 과세가격이란</h6>
			해외에서 산 물건에 대해 관세를 부가하는 기준이 되는 가격을 의미<br>
			실제 구매가격에 운임 및 보험료를 포함한 가격이 관세의<br>
			<h6>○ 고시환율</h6>
			해외에서 구매한 물품을 통관할 때 물품의 가격을 측정하는 기준 환율<br>
			<h6>○ 과세운임</h6>
			해외에서 국내로 반입되는 화물의 운임이며 과세가격을 결정하기 위해 적용하는 운임임<br>
			<h6>○ 소액 면세제도</h6>
			수입되는 물품 중 일정금액 이하인 자가 사용물품에 대해 관세 등의 세금을 면제해주는 제도<br>
			<h6>○ 각국 면세 범위</h6>
			미국 : 목록통관상품 200불 / 일반통관상품 150불<br>
			그외 국가 : 150불
			→ 일반통관 제품이 1개라도 있을경우, 그 건은 일반통관으로 진행됩니다.<br>
			일반통관/목록통관에 관한 내용은 하기 페이지에서 확인 부탁드립니다.<br>
			[일반통관/목록통관 확인하러 가기]<br>
			<h6>○ 나눔배송</h6>
			원칙적으로, 1개의 주문은 무조건 1건으로 수령해야 합니다.<br>
			과세회피 목적으로 나눔배송 시 통관중에 세관에서 의심건으로 분류될수 있으며,<br>
			의심건으로 분류되면 오더내역, 카드결제내역 등을 제출해야하고 벌금 10만원이상 + 원래 발생하는 관부가세 가 부과 될수 있습니다.<br>
			다사조에서는 통관에 개입하지 않으며, 혹시 위와같은 상황으로 통관시 문제 발생할 경우 통관업체에서 고객님께 연락이 가게 되며, 고객님께서 직접 대응하셔야 합니다.<br>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>