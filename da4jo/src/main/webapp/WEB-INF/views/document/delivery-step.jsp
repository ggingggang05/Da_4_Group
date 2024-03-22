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
				<i class="fa-solid fa-pause"></i>배송대행 신청방법
			</div>
		</div>
		<h1>이미지는 디자인 다 끝나면 교체예정 임시로 자리만 잡음</h1>
		<div class="content content-body">
			<div class="cell content-body-text">
				<div class="cell">
					<strong>1. 배송대행 신청서 작성하기</strong><br> 
					<ul class="info-list">
						<li>해외의 온라인 쇼핑몰에서 상품을 주문 후, 즉시 짐패스 배송대행 신청서를 작성합니다. 짐패스 사이트의 [배송대행 신청] 메뉴를 클릭하여 이동합니다</li>
					</ul>
				</div>
				<div class="cell center">
				<img src="/image/신청서작성1.jpg">
				</div>
				<div class="cell">
					<strong>2. 주의사항 확인 후 신청서 작성 </strong><br> 
					<ul class="info-list">
						<li>신청서 작성시 주의사항을 자세하게 확인, 숙지해 주십시오. 주의사항 미확인으로 발생하는 불편에 대해서는 짐패스에서 책임지지 않으므로 양해바랍니다.</li>
						<li>배송대행을 원하는 상품의 정보를 상세히 기록, 필요한 서비스 내역을 선택하여 신청서를 작성합니다.</li>
					</ul>
				</div>
				<div class="cell center" style="border: 1px solid #DEE2E6;">
				<img src="/image/신청서작성2.png" width="800px">
				</div>
				<br>
				<div class="cell">
					<strong>3. 수령지 정보 입력</strong><br>
					<ul class="info-list">
						<li>상품을 받으실 수령지 정보를 정확하게 입력해주세요. 신청 완료를 누르면 배송대행 신청이 끝나게 됩니다.</li>
					</ul>
				</div>
				<div class="cell">
					<strong>4. 신청서 확인</strong>
					<ul class="info-list">
						<li>짐패스 마이페이지에서 작성하신 신청서를 확인할 수 있습니다</li>
					</ul>
				</div>
				<div class="cell">
					<strong>5. 배송대행 불가한 경우</strong><br>
					<ul class="info-list">
						<li>배송대행 신청 후 관리자 판단하에 배송대행 접수가 불가한 경우가 있습니다. 이 경우 마이페이지 > 구매신청 > 구매취소에서 확인하실수 있습니다.</li>
					</ul>
				</div>
				<div class="cell">
					<strong>6. 정상 승인</strong><br>
					<ul class="info-list">
						<li>정상적으로 구매 승인이 났더라도 해당 상품에 대해서 상품값 결제를 해주셔야만 다사조가 실제 구매를 하게됩니다.</li>
						<li>마이페이지>배송대행 결제대기에서 구매 승인이 난 제품들에 대해서만 상품값을 결제 하실 수 있습니다.</li>
					</ul>
				</div>
				<div class="cell">
					<img src="/image/신청서작성3.png" width="800px">
				</div>
				<div class="cell">
					<strong>7. 신청서 확인</strong><br>
					<ul class="info-list">
						<li>결제가 끝나면 마이페이지>구매신청>결제완료로 상품이 이동됩니다.</li>
						<li>결제완료로 이동과 동시에 "배송신청 > 신청서 접수"에 배송대행 신청서가 자동으로 생성됩니다.</li>
						<li>자동 생성된 신청서의 수정 기능을 이용해 검수 옵션 등을 지정해 주시고 신청을 완료하시면 됩니다.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>