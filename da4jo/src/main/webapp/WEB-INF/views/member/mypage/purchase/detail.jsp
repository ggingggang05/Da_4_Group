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
</style>



<!-- 로그인 한 회원의 구매서 목록 페이지 -->
<br>
<br>
<div class="container container-body">
	<!-- 마이페이지 헤더 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>${session.loginId}님의 구매서
			</div>
		</div>
	</div>
	<div class="container flex-container">
		<!-- 왼쪽 사이드 바 -->
		<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>
		<!-- 오른쪽 내용 -->
		<div class="container inner-container">
			<div class="content content-head">
				<div class="content-head-text">
					<i class="fa-solid fa-user"></i>구매대행 신청서
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
				<!-- 결제정보 -->
				<div class="content content-body">
					<div class="info-head w-100">
						<strong>결제정보</strong>
					</div>	
					<form action="orderDetail" method="post" autocomplete="off">
						<div class="info-body">
							<div class="info-group">
								<div class="info-label">상품금액</div>
								<div class="info-content-wrapper">
									<div class="info-content">
										<input type="text" name="poServiceFee">
									</div>
								</div>
							</div>
							<div class="info-group">
								<div class="info-label">수수료</div>
								<div class="info-content-wrapper">
									<div class="info-content">
										<input type="text" name="poServiceFee">
									</div>
								</div>
							</div>
							<div class="info-group">
								<div class="info-label">결제금액</div>
								<div class="info-content-wrapper">
									<div class="info-content">
										<input type="text" name="poTotalPriceKrw">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- 메뉴 -->			
				<div class="cell center">
					<a href="/admin/po/orderList" class="link">
						<button class="btn">목록으로</button>
					</a> <a href="#"
						class="link">
						<button class="btn">수정</button>
					</a> <a href="#"
						class="link">
						<button class="btn">삭제</button>
					</a>
				</div>
			</div> <!-- 상품 정보 닫는 태그 -->			
		</div><!-- 오른쪽 내용 닫는 태그 -->
	
</div><!-- 컨테이너 자리 닫는 태그 -->

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>