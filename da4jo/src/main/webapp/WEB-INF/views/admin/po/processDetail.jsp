<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
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
<script type="text/javascript">
	$(function() {
		if ($(".isBlock").text().trim() === "N") {
			$(".isBlock").css("color", "rgb(71, 163, 255)");
		} else if ($(".isBlock").text().trim() === "Y") {
			$(".isBlock").css("color", "#D1180B");
		}
	});
</script>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-user"></i> ${poDto.poCustomerId} 님의 구매대행 배송대기 상세
			</div>
		</div>
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
					<div class="info-label">신청서 작성시간</div>
					<div class="info-content-wrapper">
						<div class="info-content">
							<fmt:formatDate value="${poDto.poSdate}"
								pattern="y년 M월 d일 E H시 m분 s초" />
						</div>
					</div>
				</div>
				<div class="info-head w-100">
					<strong>배송정보입력</strong>
				</div>
				<form action="processDetail" method="post" autocomplete="off">
					<div class="info-body">
						<div class="info-group">
							<div class="info-label">배송사</div>
							<div class="info-content-wrapper">
								<div class="info-content">
									<input type="text" name="poShipper" value="${poDto.poShipper}">
								</div>
							</div>
						</div>
						<div class="info-group">
							<div class="info-label">송장번호</div>
							<div class="info-content-wrapper">
								<div class="info-content">
									<input type="text" name="poAwbNumber"
										value="${poDto.poAwbNumber}">
								</div>
							</div>
						</div>
						<div class="info-group">
							<div class="info-label">메모</div>
							<div class="info-content-wrapper">
								<div class="info-content">
									<input type="text" name="poAdminComment"
										value="${poDto.poAdminComment}">
								</div>
							</div>
						</div>
						<input type="hidden" name="poNo" value="${poDto.poNo}">
						<div class="cell right">
							<button type="submit" class="btn">사용자에게 전송</button>
						</div>
					</div>
				</form>
				<div class="cell center">
					<a href="${pageContext.request.contextPath}/admin/po/processList" class="link">
						<button class="btn">목록으로</button></a>
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>
</body>
</html>