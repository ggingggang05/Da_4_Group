<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<!-- 구매서 상세 페이지 -->



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

.linkBtn {
	padding: 14px !important;
	width: 100px !important;
	font-size: 14px !important;
}
</style>

<script>
	$(function(){
		$(".cancelOrderFail").on("click", function(){
			var choice = window.alert("주문서 취소 불가");
			return choice;
		});
	});
</script>


<!-- 로그인 한 회원의 구매서 목록 페이지 -->
<br>
<br>
<div class="container container-body">
	<!-- 왼쪽 사이드 바 -->
	<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>
	<!-- 오른쪽 내용 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-file-circle-check" style="color: #6c6e6e;"></i> ${sessionScope.loginId}님의 구매대행 신청서
			</div>
		</div>
		<!-- 구매자 정보 -->
		<div class="content content-body">
			<div class="info-head w-100">
				<strong>구매자 정보</strong>
			</div>
			<div class="info-body">
				<div class="info-group">
					<div class="info-label">아이디</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poCustomerId}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">이름(한글)</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poNameKor}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">이름(영문)</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poNameEng}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">개인통관고유번호</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poClearanceId}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">연락처</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poContact}</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 배송지 정보 -->
		<div class="content content-body">
			<div class="info-head w-100">
				<strong>배송지</strong>
			</div>
			<div class="info-body">
				<div class="info-group">
					<div class="info-label">주소</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poZipcode}</div>
						<div class="info-content">${poDto.poAddress1}</div>
						<div class="info-content">${poDto.poAddress2}</div>
					</div>
					<div class="info-group"></div>
					<div class="info-label">배송메모</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poDcomment}</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상품 정보 -->
		<div class="content content-body">
			<div class="info-head w-100">
				<strong>상품정보</strong>
			</div>
			<div class="info-body">
				<div class="info-group">
					<div class="info-label">구매대행정보</div>
					<div class="info-content-wrapper">
						<div class="info-content">국가 ${poDto.poCountry}</div>
						<div class="info-content">통화 ${poDto.poCurrency}</div>
						<div class="info-content">환율 ${poDto.poFxRate}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품링크</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poLink}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품금액(외화)</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poFx}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품이름(영문)</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poNameEng}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품카테고리</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poItemCategory}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품옵션1</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poItemOption1}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품옵션2</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poItemOption2}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품옵션3</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poItemOption3}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품수량</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poQty}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">상품수량</div>
					<div class="info-content-wrapper">
						<div class="info-content">${poDto.poQty}</div>
					</div>
				</div>
				<div class="info-group">
					<div class="info-label">신청서 작성시간</div>
					<div class="info-content-wrapper">
						<div class="info-content">
							<fmt:formatDate value="${poDto.poSdate}"
								pattern="y년 M월 d일 E H시 m분 s초" />
						</div>
					</div>
				</div>
			</div>
		</div> <!-- 상품 정보 닫는 태그 -->	
		<!-- 결제정보 -->
		<div class="content content-body">
			<div class="info-head w-100">
				<strong>결제정보</strong>
			</div>	
				<div class="info-body">
					<div class="info-group">
						<div class="info-label">상품금액(원화)</div>
						<div class="info-content-wrapper">
							<div class="info-content">
								${poDto.itemPrice}
							</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">부가세</div>
						<div class="info-content-wrapper">
							<div class="info-content">
								<c:choose>
								<c:when test="${poDto.itemPrice >= 200000}">
									${poDto.vat}
								</c:when>
								<c:otherwise>
									0
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">수수료</div>
						<div class="info-content-wrapper">
							<div class="info-content">
								${poDto.poServiceFee}
							</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">결제금액</div>
						<div class="info-content-wrapper">
							<div class="info-content">
								${poDto.poTotalPriceKrw}
							</div>
						</div>
					</div>
				</div>
		</div>
		<!-- 메뉴 -->			
		<div class="cell center flex-cell">
			<div class="cell w-50 right p-20">
				<a href="${pageContext.request.contextPath}/mypage/purchase/list" class="link">
					<button class="btn linkBtn">목록으로</button>
				</a>
			</div>
			<div class="cell w-50 left p-20">
				<form action="updateCancelStatus" method="post">
				    <c:choose>
				        <c:when test="${poDto.poStatus == '결제 대기 중' || poDto.poStatus == '주문정보 확인 중'}"> <!-- 주문 취소 가능한 상태일 때 -->
				            <input type="hidden" name="poNo" value="${poDto.poNo}">
				            <a href="${pageContext.request.contextPath}/mypage/purchase/list" class="link cancelOrderSuccess">
				                <button class="btn linkBtn">주문취소</button>
				            </a>
				        </c:when>
				        <c:otherwise> <!-- 주문 취소 불가능한 상태일 때 -->
				            <a href="${pageContext.request.contextPath}/mypage/purchase/list" class="link cancelOrderFail">
				                <button class="btn linkBtn">주문취소</button>
				            </a>
				        </c:otherwise>
				    </c:choose>
				</form>
			</div>
		</div>		
	</div><!-- 오른쪽 내용 닫는 태그 -->
	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>