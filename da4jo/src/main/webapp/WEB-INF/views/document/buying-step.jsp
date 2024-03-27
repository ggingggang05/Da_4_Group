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
				<i class="fa-solid fa-pause"></i>구매대행 신청방법
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-text">
				※ 신청서 작성 전 "구매대행 이용안내" 의 구매 전 주의사항을 꼭 숙지 부탁드립니다.
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-text">
				<div class="cell">
					<strong>1. 다사조.com 에 로그인 후 [구매대행 신청] 메뉴를 클릭하여 이동합니다.</strong><br> 
				</div>
				<br>
				<div class="cell center">
				<img src="${pageContext.request.contextPath}/image/신청서작성00.png" width="20%" height="50%">
				</div>
				<div class="cell">
					<strong>2. 구매대행시 주의사항을 꼼꼼하게 확인 후 동의해 주십시오. </strong><br> 
					<ul class="info-list">
						<li>주의사항 미확인으로 발생하는 문제에 대해서는 다사조.com는 책임지지 않으므로 양해바랍니다.</li>
						<li>하단의 구매대행 신청서 작성폼에 구매할 상품의 상품명, 품목분류, 브랜드/셀러, 단가, 수량, 제품색상(영문), 제품사이즈(영문) 등의 필요사항을 정확하게 기입하신 후 [신청하기] 버튼을 클릭합니다.</li>
					</ul>
				</div>
				<div class="cell center" style="border: 1px solid #DEE2E6;">
				<img src="${pageContext.request.contextPath}/image/신청서작성2.png" width="800px">
				</div>
				<br>
				<div class="cell">
					<strong>3. 구매대행을 신청하시겠습니까? 라는 메세지 창이 뜨면 [확인] 버튼을 클릭합니다. </strong><br>
					<ul class="info-list">
						<li>이후 신청이 정상적으로 접수되었다는 메시지 창이 뜹니다.</li>
						<li>[확인] 버튼 클릭하면 구매대행 신청이 모두 완료됩니다. 이와 같은 방법으로 복수의 상품을 구매대행 신청을 하실 수 있습니다.
						</li>
					</ul>
				</div>
				<div class="cell">
					<strong>4. 관리자가 구매대행 가능여부를 파악</strong>
					<ul class="info-list">
						<li>통관 및 재고 확인을한 후 구매승인(영업일 기준 1~2일이내)을 내드립니다.</li>
						<li>고객님의 마이페이지>구매대행 결제대기에서 견적가격을 확인후 결제(1차 결제)를 해주시면 관리자가 실제 구매대행을 해드립니다.</li>
					</ul>
				</div>
				<div class="cell">
					<strong>5. 구매대행 불가한 경우</strong><br>
					<ul class="info-list">
						<li>구매대행 신청 후 관리자 판단하에 구매대행 접수가 불가한 경우가 있습니다. 이 경우 마이페이지 > 구매신청 > 구매취소에서 확인하실수 있습니다.</li>
					</ul>
				</div>
				<div class="cell">
					<strong>6. 정상 승인</strong><br>
					<ul class="info-list">
						<li>정상적으로 구매 승인이 났더라도 해당 상품에 대해서 상품값 결제를 해주셔야만 다사조가 실제 구매를 하게됩니다.</li>
						<li>마이페이지>구매대행 결제대기에서 구매 승인이 난 제품들에 대해서만 상품값을 결제 하실 수 있습니다.</li>
					</ul>
				</div>
				<div class="cell">
					<img src="${pageContext.request.contextPath}/image/신청서작성3.png" width="800px">
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