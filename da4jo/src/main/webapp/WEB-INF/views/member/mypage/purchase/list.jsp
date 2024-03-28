<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- lightpick CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

<!-- 기간별 검색 -->
<script type="text/javascript">
	// lightpick
	$(function(){
		var picker;

		$(".searchOption").on("input", function(){
			if($(this).val() == "po_sdate") {
				//$(".DateInput").show();
				picker = new Lightpick({
				    field: $("[name=keyword]")[0], //검색일
				    singleDate: true,
				    format: "YYYY-MM-DD", //검색 형태
				});
			} 
			else {
				//$(".DateInput").hide();
				if(picker) {
					picker.destroy();				
				}
			}
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

.menu-type {
	background-color: #60A1F833 !important;
	height : 42px;
}

#poNo {
	width: 10%;
}

#poItemEngName {
	width: 25%;
}

#poItemCategory {
	width: 10%;
}

#poSdate {
	width: 20%
}

#poStatus {
	width: 20%;
}

#poTotalPriceKrw {
	width: 15%;
}

.requestBtn {
	font-size: 15px !important;
}

.linkEffect {
    transition: filter 0.3s ease; /* 변경 효과 부드럽게 적용 */
}
.linkEffect:hover  {
	color: #60A1F888;
    filter: brightness(0.9);
}

</style>

<script type="text/javascript">    
     $(function(){
            $(".payAlert").on("click", function() {
				var choice = window.alert("결제 단계가 아닙니다!");
				if(choice == false) return;
    		});
        });
</script>


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
				<i class="fa-solid fa-list" style="color: #6c6e6e;"></i> ${sessionScope.loginId}님의 구매대행 신청서 목록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<c:if test="${empty poList}"><!-- 구매서 작성 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-circle-xmark fa-3x"></i>
						<h2>구매서 작성 내역이 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="${pageContext.request.contextPath}/member/po/request" class="btn"> 
								<i class="fa-solid fa-paper"style="color: #B2BC76;"></i> 작성하러 가기
							</a>
						</h2>
					</div>
				</c:if><!-- 구매서 작성 내역이 없는 경우 닫는 태그 -->
				<c:if test="${!empty poList}"><!-- 구매서 작성 내역이 있는 경우 -->
					<div class="cell flex-cell">
						<div class="cell searchArea w-75 left"><!-- 검색 기능 -->
							<form action="list" method="get">
								<select name="column" class="searchSelect searchOption">
									<option value="po_no" ${empty param.column || param.column == 'po_no' ? 'selected' : ''} >주문번호</option>
									<option value="po_status" ${param.column == 'po_status' ? 'selected' : ''}>상태</option>
									<option value="po_sdate" ${param.column == 'po_sdate' ? 'selected' : ''}>일자별</option>
								</select> 
								<!-- <div class="DateInput" style="display: none;">
									<input type="text" name="startDate" placeholder="날짜 선택" value="$(settlementVO.poPayDate)">
								</div> -->
								<input type="search" name="keyword" placeholder="" value="${param.keyword}" class="searchBar" autocomplete="off">
								<button class="btn searchBtn" type="submit">
									<i class="fa-solid fa-search"></i>
								</button>
							</form>
						</div><!-- 검색기능 닫는 태그 -->
						<div class="cell w-25 right">
							<a class="btn requestBtn" href="${pageContext.request.contextPath}/member/po/request" style="color: #60A1F8;">구매서 작성하기</a>
						</div>
					</div>
					
					<ul class="menu menu-type">
						<li id="poNo"><strong>주문번호</strong></li>
						<li id="poItemEngName"><strong>주문서</strong></li><!-- 아이템 이름 -->
						<li id="poItemCategory"><strong>분류</strong></li>
						<li id="poSdate"><strong>작성일</strong></li>
						<li id="poStatus"><strong>상태</strong></li>
						<li id="poTotalPriceKrw"><strong>최종 결제금액</strong></li>
					</ul>
					
				
					<c:forEach var="poDto" items="${poList}">
						<ul class="menu menu-list">
							<li id="poNo">${poDto.poNo}</li>
							<li id="poItemEngName"><a href="${pageContext.request.contextPath}/member/mypage/purchase/detail?poNo=${poDto.poNo}" class="linkEffect">${poDto.poItemEngName}</a></li>
							<li id="poItemCategory">${poDto.poItemCategory}</li>
							<li id="poSdate"><fmt:formatDate value="${poDto.poSdate}" pattern="y-MM-dd" /></li>
							<li id="poStatus">${poDto.poStatus}</li>
							<li id="poTotalPriceKrw"><fmt:formatNumber value="${poDto.poTotalPriceKrw}" pattern="#,##0"></fmt:formatNumber>원</li>
						</ul>
					</c:forEach>					
				</c:if><!-- 구매서 작성 내역이 있는 경우 닫는 태그 -->
			</div><!-- 구매서 리스트 닫는 태그-->
		</div><!-- 내용 바디 닫는 태그 -->
		<div class="page-navigator"> <!-- 네비게이터 태그 -->
			<c:if test="${empty poList}"> <%-- 리스트가 없을 땐 --%>
				<!-- 네비게이터 안 보여줌 -->
			</c:if>
			<c:if test="${!empty poList}">
				<c:choose>
					<c:when test="${pageVO.isFirstBlock()}">
						<a class="off">&lt;이전</a>
					</c:when>
					<c:otherwise>
						<a href="list?page=${pageVO.getPrevBlock()}&${pageVO.getQueryString()}">&lt;이전</a>
					</c:otherwise>
				</c:choose>
	
				<%-- for(int i=beginBlock; i <= endBlock; i++) { .. } --%>
				<c:forEach var="i" begin="${pageVO.getBeginBlock()}"
					end="${pageVO.getEndBlock()}" step="1">
					<%-- 다른 페이지일 경우만 링크를 제공 --%>
					<c:choose>
						<c:when test="${pageVO.isCurrentPage(i)}">
							<a class="on">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="list?page=${i}&${pageVO.getQueryString()}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
				<%-- 다음이 있을 경우만 링크를 제공 --%>
				<c:choose>
					<c:when test="${pageVO.isLastBlock()}">
						<a class="off">다음&gt;</a>
					</c:when>
					<c:otherwise>
						<a
							href="list?page=${pageVO.getNextBlock()}&${pageVO.getQueryString()}">다음&gt;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div><!-- 네비게이터 닫는 태그 -->
	</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>