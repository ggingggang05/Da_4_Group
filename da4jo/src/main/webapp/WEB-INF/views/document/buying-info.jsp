<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/document-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>구매대행 이용안내
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>구매대행이란?</h5>
			</div>
			<div class="cell content-body-text">
				해외에서 판매되는 상품중 회원가입이 어렵다거나 현지 결제수단이 있어야만 구매가 가능한 경우가 있습니다.<br>
				이때 다사조의 구매대행 서비스를 이용하시면 해외 사이트 회원가입과 결제등 구매와 관련된 모든것을 대행해드립니다.<br>
				거기다 현지 배송과 판매자 컨택까지 모든 사항을 일괄 처리해드려 안전하고 편리하게 해외직구를 이용 하실수 있습니다.
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>구매 전 주의사항</h5>
			</div>
			<div class="cell content-body-text">
				<div class="cell">
					<strong>1. 소요기간</strong><br>
					<ul class="info-list">
						<li>견적 : 영업일 기준 1~2일이내</li>
						<li>현지배송 : 구매완료일로부터 영업일 기준 평균 3~10일 정도의 기간 소요</li>
					</ul>
				</div>
				<div class="cell">
					<strong>2.구매요청시 옵션사항 기재</strong><br>
					구매요청시 사이즈, 색상등의 옵션사항등을 정확히 기재해 주시기 바랍니다.<br>
					옵션사항을 정확히 기재하지 않았을 경우에는 상품 재확인으로 인해 시간이 지연될수 있습니다.<br>
					구매견적 신청시 반드시 자세하게 기재 부탁드립니다.
				</div>
				<div class="cell">
					<strong>3. 해외주문완료 후 취소</strong><br>
					<ul class="info-list">
						<li>해외 온라인 쇼핑몰에서 주문완료후 재고가 없는 경우 구매대행 취소후 전액 환불처리해 드립니다.</li>
						<li>
							해외 주문완료 이후 단순한 고객 변심에 의한 취소처리는 불가합니다. 이에 환불 또한 불가능하므로 신중하게 구매결정을 내려주시기 바랍니다.<br>
							<span class="red">(※ 구매대행 신청서 결제전에는 언제든 취소 가능합니다.)</span>
						</li>
					</ul>					
				</div>
				<div class="cell">
					<strong>4. 구매대행에 대한 수수료, 차액 및 추가금</strong><br>
					구매대행 진행시 상품가격 외에 다사조 구매대행 수수료가 별도로 발생합니다. (전국가 상품가격의 10% 발생, 현지배송비에 대한 수수료는 없습니다.)<br>
					구매대행 상품의 결제는 2차례에 걸쳐 진행되며 결제내용과 결제시점은 아래와 같습니다.<br>
					<ul class="info-list">
						<li>1차결제 : 현지상품가 / 현지배송비 / 구매대행 수수료 결제 (고객님의 구매요청을 통해 담당자가 구매승인처리, 결제시점 : 다사조 담당자의 구매승인 처리후)</li>
						<li>2차결제 : 국제배송비 / 기타금액 (추가비용이 있을 경우만) 결제 (국제배송비는 각 센터의 국제배송비 기준 요금 부과, 결제시점 : 상품이 진행국가의 현지 물류센터에 도착하여 입고처리 완료된 후)</li>
					</ul>
				</div>
				<div class="cell">
					<strong>5. 입고/출고</strong><br>
					<ul class="info-list">
						<li>입고/출고는 배송대행 신청서를 통해서 확인 및 관리가 가능합니다.</li>
						<li>출고 스케쥴은 배송대행 스케쥴과 동일하게 적용됩니다.</li>
						<li>TV, 가구등 부피가 큰 물건들은 부피무게가 발생될 수 있으니 꼭 확인 후 결제 부탁드립니다.</li>
						<li>부피가 큰 제품들은 통관후 중형 화물택배로 배송될 수 있으며 이때 착불 비용이 발생합니다.</li>
					</ul>
				</div>
				<div class="cell">
					<strong>6. 통관 및 관부가세</strong><br>
					<ul class="info-list">
						<li>관부가세 중 부가세는 결제금액에 포함입니다.</li>
						<li>관세는 선결제가 아닌 직접 결제 방식으로 통관중 관세사에서 고객님께 따로 연락 하여 직접 결제 진행 됩니다.</li>
						<li>통관 가능 유무는 관세청으로 문의 부탁드립니다.</li>
						<li>통관불가 상품은 통관중에 폐기 처리됩니다. 이때 비용이 발생될수 있으며 구매하신 물건값은 환불되지 않습니다. 꼭 통관유무 확인후 구매 진행 부탁드립니다.</li>
					</ul>
				</div>
				<div class="cell">
					<strong>7. 반품</strong><br>
					<ul class="info-list">
						<li>구매 완료 후 취소는 불가능 하며 반품으로만 진행이 가능합니다.</li>
						<li>반품시 실비(국제배송비, 현지 반품비 등) + 반품 수수료(20,000원)가 추가 청구 됩니다.</li>
						<li>오배송, 파손으로 인한 반품은 배송대행 정책과 동일합니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>