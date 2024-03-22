<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- lightpick CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<script type="text/javascript">
	// lightpick
	$(function(){
		var picker = new Lightpick({
		    field: $("[name=startDate]")[0], // 시작일
		    secondField: $("[name=endDate]")[0], // 종료일
		    format: "YYYY-MM-DD",
 		    singleDate: false,
	        numberOfMonths: 2,
	        numberOfColumns: 2,
	        selectForword: true,
		});
	});
</script>


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
    // 총합 계산을 위한
    document.addEventListener("DOMContentLoaded", function() {
        var totalPriceElements = document.querySelectorAll("#poTotalPrice");
        var totalCountElements = document.querySelectorAll("#count");
        var totalPrice = 0;
        var totalCount = 0;

        // 각 항목의 금액 계산
        totalPriceElements.forEach(function(element) {
            totalPrice += parseInt(element.textContent.replace(/,/g, ""));
        });
        //각 항목의 건수 계산
        totalCountElements.forEach(function(element) {
            totalCount += parseInt(element.textContent.replace(/,/g, ""));
        });

        // 총합을 출력하는 영역에 결과를 삽입
        var totalPriceDisplay = document.getElementById("totalPrice");
        totalPriceDisplay.textContent = totalPrice.toLocaleString();
    	
        // 총 건수를 출력하는 영역에 결과를 삽입
        var totalCountDisplay = document.getElementById("totalCount");
        totalCountDisplay.textContent = totalCount.toLocaleString();
    });
    

</script>

<script>
	function s_function() {
		$('#settlement').submit();
	}
</script>

<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 일자별 정산 내역
			</div>
		</div>
		
		<form action="settlement">
	        <!-- 날짜 범위 선택을 위한 입력 상자 -->
	        <div class="cell plex-cell right">
	        ㆍ기간별 검색
		        <input type="text"  name="startDate" placeholder="시작일" value="$(settlementVO.poPayDate)"> &ensp;~&ensp;
	         	<input type="text"  name="endDate" placeholder="종료일" value="$(settlementVO.poPayDate)">
		        <button><i class="fa-solid fa-magnifying-glass"></i></button>
	        </div>
    	</form>
    	
    	
		<div class="content content-body">
			<div class="cell listArea">
				<ul class="menu menu-type">
					<li><strong>날짜</strong></li>
					<li><strong>건수</strong></li>
					<li><strong>총 금액(원)</strong></li>
					<li><strong>상세</strong></li>
				</ul>
				
				<c:forEach var="settlementVO" items="${list}">
						<ul class="menu menu-list">
							<li id="poPayDate">${settlementVO.poPayDate}</li>
							<li id="count">
								<fmt:formatNumber value="${settlementVO.count}"  pattern="#,##0"/>
							</li>
							<li id="poTotalPrice">
								<fmt:formatNumber value="${settlementVO.poTotalPrice}"  pattern="#,##0"/>
							</li>

							<li id="dailyDetail"><a href="dailyDetail?poPayDate=${settlementVO.poPayDate}"><i
									class="fa-solid fa-list"></i></a></li>
						</ul>
				</c:forEach>
				<ul class="menu menu-list">
					<li><strong>합계</strong></li>
					<li><strong id= "totalCount"></strong></li>
					<li><strong id="totalPrice"></strong></li>
					<li id="poDetail"><strong></strong></li>
				</ul>
				
			</div>
		</div>
		
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>
</body>
</html>