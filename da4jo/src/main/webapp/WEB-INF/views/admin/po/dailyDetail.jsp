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
section{
	display: block;
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
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var totalPriceElements = document.querySelectorAll("#poTotalPrice");
		var totalVatElements = document.querySelectorAll("#vat");
		var totalQtyElements = document.querySelectorAll("#qty");
		
		//초기화
		var totalPrice = 0;
		var vat = 0;
		var totalQty = 0;
		
		//총 금액 계산
		totalPriceElements.forEach(function(element) {
            totalPrice += parseInt(element.textContent.replace(/,/g, ""));
        });
		//vat 계산
		totalVatElements.forEach(function(element) {
			vat += parseInt(element.textContent.replace(/,/g, ""));
        });
        //수량 계산
        totalQtyElements.forEach(function(element) {
        	totalQty += parseInt(element.textContent.replace(/,/g, ""));
        });
		
		//총 금액 계산 결과 값
        var totalPriceDisplay = document.getElementById("totalPrice");
        totalPriceDisplay.textContent = totalPrice.toLocaleString();
        
    	//총 부가세 계산 결과 값
        var vatDisplay = document.getElementById("totalVat");
        vatDisplay.textContent = vat.toLocaleString();
        
        // 총 건수를 출력하는 영역에 결과를 삽입
        var totalQtyDisplay = document.getElementById("totalQty");
        totalQtyDisplay.textContent = totalQty.toLocaleString();
	});
</script>

<div class="container container-body container-body-long">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 
				정산 내역
			</div>
		</div>
		    	
    	
		<div class="content content-body">
			<div class="cell listArea">
				<ul class="menu menu-type">
					<li><strong>결제시간</strong></li>
					<li><strong>주문시간</strong></li>
					<li><strong>주문번호</strong></li>
					<li><strong>아이디</strong></li>
					<li><strong>이름</strong></li>
					<li><strong>상품이름</strong></li>
					<li><strong>수량</strong></li>
					<li><strong>금액(원)</strong></li>
					<li><strong>부가세</strong></li>
					<li><strong>송장번호</strong></li>
				</ul>
				
				<c:forEach var="dailyDetailVO" items="${list}">
						<ul class="menu menu-list">
							<li id="poPayDate">
								<fmt:formatDate value="${dailyDetailVO.poPayDate}" pattern="Y-MM-dd HH:mm:ss" />
							</li>
							<li id="orderDate">
			                	<fmt:formatDate value="${dailyDetailVO.poSdate}" pattern="Y-MM-dd HH:mm:ss" />
		                	</li>
							<li id="poNo">${dailyDetailVO.poNo}</li>
			               	<li id="memberId">${dailyDetailVO.poCustomerId}</li>
			                <li id="memberName">${dailyDetailVO.poNameKor}</li>
			                <li id="itemName">${dailyDetailVO.poItemEngName}</li>
			                <li id="qty">${dailyDetailVO.poQty}</li>
			                <li id="poTotalPrice">
			                	<fmt:formatNumber value="${dailyDetailVO.poTotalPriceKrw}"  pattern="#,##0"/>
		                	</li>
			                <li id="vat">
			                	<fmt:formatNumber value="${dailyDetailVO.poItemVat}"  pattern="#,##0"/>
			                	</li>
			                <li id="awbNumber">${dailyDetailVO.poAwbNumber}</li>
						</ul>
				</c:forEach>
				<ul class="menu menu-list">
					<li><strong>${dailyDetailVO.poPayDate}</strong></li>
					<li>총 금액 : <strong id= "totalPrice"></strong></li>
					<li>부가세 : <strong id= "totalVat"></strong></li>
					<li>판매 수량 : <strong id= "totalQty"></strong></li>
				</ul>
				
			</div>
		</div>
		
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>
</body>
</html>