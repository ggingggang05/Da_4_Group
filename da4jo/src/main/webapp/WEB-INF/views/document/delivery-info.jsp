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
				<i class="fa-solid fa-pause"></i>배송대행 이용안내
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>배송대행이란?</h5>
			</div>
			<div class="cell content-body-text">
				해외쇼핑몰에서 제품을 구입하고 싶지만 한국으로 직접 배송을 하지 않는 경우가 많습니다.<br>
				한국으로 직접 배송을 한다고 해도 배송비가 너무 비싸거나, 배송기간이 지나치게 길며 배송추적이 잘 되지 않는 경우도 많습니다.<br>
				이런 경우, 다사조 해외 현지 거점(배송대행지/배대지)에서 제품을 대신 수령하여 국제항공 운송 및 수입통관을 거쳐 지정하신 한국주소로 배송을 해 드리는 서비스입니다.
			</div>
		</div>
		<div class="content content-body">
			<img src="${pageContext.request.contextPath}/image/delivery-process.jpg">
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>배송대행 절차</h5>
			</div>
			<div class="cell content-body-text">
				<div class="cell">
					<strong class="red">1. 해외 쇼핑몰 직접 상품 구매하기</strong><br>
					해외 쇼핑몰에서 원하시는 상품을 골라 직접 구매를 진행합니다.<br>
					구매가 완료되어 배송 받을 주소를 입력할 때, 짐패스 회원가입시 제공된 해외 주소지 (마이페이지 > 나의 주소)를 반드시 입력해주세요.
				</div>
				<div class="cell">
					<strong class="red">2. 배송대행 신청서 작성</strong><br>
					해외 쇼핑몰에서 주문이 완료되면, 곧바로 짐패스 배송대행 신청서를 작성해주세요.<br>
					배송대행신청서가 작성되지 않은 상태에서 물품이 현지센터에 입고되면 신속한 처리가 어려워지며,<br>
					배송지연 및 보관료등의 불이익이 발생할 수 있습니다.
					<span class="red"><a class="red" href="${pageContext.request.contextPath}/delivery-step"><br>
					→ [배송대행 신청방법 보기]</a></span>
				</div>
				<div class="cell">
					<strong class="red">3. 해외 현지 배송센터로 주문상품 배송</strong><br>
					구매하신 상품이 해외 현지 배송센터로 입고되면 알림 메일(문자)을 보내드립니다.<br>
					상품이 물류센터에 도착하면 상품의 확인, 검수, 포장, 무게측정 작업이 완료된 후 입고처리 되어 고객님께 배송비 결제 알림이 가게 됩니다.<br>
					(물류센터 내 물량, 작업속도 등에 따라 상품이 도착한 날짜로부터 시일이 다소 소요될 수 있습니다.)
				</div>
				<div class="cell">
					<strong class="red">4. 배송센터 주문 상품 입고</strong><br>
					작성하신 배송대행 신청서를 확인하여 입고 처리합니다.<br>
					합배송 신청/해제는 물류센터 입고 전까지만 가능하며,<br>
					상품 폐기신청은 물류센터 입고 전에는 무료이나 이후에는 수수료를 부담하셔야 합니다.
				</div>
				<div class="cell">
					<strong class="red">5. 상품무게 측정 및 배송비 결제</strong><br>
					입고 완료된 상품의 실측 중량, 부피무게를 기준으로 배송비가 책정되면 알림 메일(문자)을 보내 드리며 결제를 기다리게 됩니다.<br>
					검품/재포장 등 추가옵션을 선택하신 경우 추가비용이 포함된 최종 결제 금액을 안내해드립니다.<br>
					발송 보류 및 현지 반품/교환은 배송비 결제대기 단계까지만 신청 가능합니다.<br>
					* 각 센터별로 현지 통화 혹은 원화로 결제금액이 책정됩니다. 현지 통화로 적용되는 경우 짐패스 자체환율이 적용됩니다.<br>
					(현지통화의 경우 환율 변동으로 인하여 결제 타이밍에 따라서 금액이 다소 변동될 수 있습니다.)
				</div>
				<div class="cell">
					<strong class="red">6. 결제완료 및 발송준비</strong><br>
					배송비 결제가 완료되면 해당 주문건은 발송준비 상태로 전환됩니다.<br>
					결제 완료된 배송건은 1~2일 영업일 이내에 발송됩니다.
				</div>
				<div class="cell">
					<strong class="red">7. 국제배송 및 통관</strong><br>
					주문상품이 해외 현지에서 국내 배송지로 발송되며, 항공 운송시 보험가입이 불가한 상품의 파손일 경우 폐사에서 책임지지 않습니다. 상품이 국내에 도착하면 반드시 통관절차를 거치며, 면세범위를 초과할 경우 통관시 관세 등 세금이 발생하게 되며 수취인이 세금은 지불하게 됩니다.<br>
					따라서, 사전에 반드시 면세범위 등을 확인후 주문 바랍니다.<br>
					※ 면세기준 (미국 $ 200, 그외 해외국 $ 150)<br>
					<span class="red"><a class="red" href="${pageContext.request.contextPath}/prohibition">
					→ [수입제한 품목 확인하기]</a></span>
				</div>
				<div class="cell">
					<strong class="red">8. 국내배송 및 물품 수령</strong><br>
					통관이 완료된 상품은 국내 배송지로 상품이 배송되며 운송장 번호로 배송조회가 가능합니다.
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>