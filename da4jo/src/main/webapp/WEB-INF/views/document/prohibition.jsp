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
				<i class="fa-solid fa-pause"></i>수입금지품목
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>배송불가 수입금지 리스트</h5>
			</div>
			<div class="cell content-body-text">
				대한민국 관세청에서 수입을 금지하는 품목들이 있습니다.<br>
				하기 표기된 상품들은 배송대행이 절대 불가합니다.<br><br>
				발송한 상품이 적발되면 해외 물류센터에 영업정지등의 처분이 내려질수 있기 때문에<br>
				어떤이유가 있어도 출고가 불가합니다.<br><br>
				구매하시려는 상품이 수입이 금지된 상품인지 아닌지 꼭 확인하시고 주문해주세요.<br><br>
				수입금지 항목을 구매하신후 신청서를 작성해주셔도 출고가 되지 않으며,<br>
				주문한 상품의 폐기 혹은 반품을 진행해 주셔야 합니다.<br><br>
				<ul class="info-list">
					<li class="red">관세청 문의 국번없이 125</li>
					<li class="red">식약청 문의 1577-1255</li>
				</ul>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>해외에서 구매하시기 전 꼭 수입금지 품목을 확인해 주세요!</h5>
			</div>
			<div class="cell content-body-text">
				비타민/건강식품은 한번에 6병까지만 통관이 가능합니다.
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>