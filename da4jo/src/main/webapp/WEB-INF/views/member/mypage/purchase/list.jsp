<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.boxInfo{
	border-color: #6c6e6e33;
	border-width: 1px;
    border-style: solid;
	boarder-radius: 2px;
	font-size: 14px;
}

.memberInfo{
	font-size:14px;
	border-bottom-color: #6c6e6e33;
	border-bottom-width: 1px;
    border-bottom-style: solid;
}

.detailInfo,
.btn {
	font-size: 12px;
	padding: 5px;
}

.profileEdit{
	display : none;
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
				<i class="fa-solid fa-pause"></i>${session.loginId}님의 구매서 목록
			</div>
		</div>
	</div>
	<div class="container flex-container">
		<!-- 왼쪽 사이드 바 -->
		<div class="container inner-container">
			<!-- 회원 정보 -->
			<div class="boxInfo">
				<div class="cell center memberInfo">
					<img src="img" width="100%" class="newProfile">
					<div class="cell">
						<label for="edit-profile"><i class="fa-solid fa-plus">수정</i></label>
						<input type="file" name="img" class="tool w-100 profileEdit" id="edit-profile">
					</div>
					<p><b>'${memberDto.memberId}'</b> 회원님</p>
				</div>
				<div class="cell center detailInfo">
					<p><b>'${memberDto.memberLevel}'</b> 입니다</p>
					<div class="cell pt-10">
						<a class="btn w-50" href="/member/mypage/change">개인정보 변경</a>
					</div>
					<div class="cell">
						<a class="btn w-150" href="/member/mypage/password">비밀번호 변경</a>
					</div>
				</div>
			</div>
			<br><br>
			<!-- 메뉴바 -->
			<div class="title title-head">
				<div>MENU</div>
			</div>
			<div class="title title-body">
				<div class="title-body-main">
					<div class="title-body-text">
						<a class="link">구매대행</a>
					</div>
					<div class="title-body-sub">
						<div class="title-body-text">
							<a class="link">구매대행 신청서 작성</a>
						</div>
						<div class="title-body-text">
							<a class="link">구매대행 결제대기</a>
						</div>
						<div class="title-body-text">
							<a class="link">구매대행 신청 내역</a>
						</div>
					</div>
				</div>
				<div class="title-body-main">
					<div class="title-body-text">
						<a class="link">QNA</a>
					</div>
				</div>
				<div class="title-body-main">
					<div class="title-body-text">
						<a class="link" href="/member/board/review">내가 쓴 리뷰</a>
					</div>
				</div>
			</div>
		</div><!-- 왼쪽 사이드 바 닫는 태그 -->
		<!-- 오른쪽 내용 -->
		<div class="container inner-container">
			<div class="content content-body">
				<c:if test="${empty poList}"><!-- 구매서 작성 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-face-sad-tear fa-3x"></i>
						<h2>구매서 작성 내역이 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/member/po/request" class="btn"> 
								<i class="fa-solid fa-paper"style="color: #B2BC76;"></i> 작성하러 가기
							</a>
						</h2>
					</div>
				</c:if><!-- 구매서 작성 내역이 없는 경우 닫는 태그 -->
				<c:if test="${!empty poList}"><!-- 구매서 작성 내역이 있는 경우 -->
					<div class="right">
						<h2><a class="btn" href="/member/po/request" style="color: #B2BC76;">구매서 작성하기</a></h2>
					</div>
					<ul class="menu title">
						<li>주문번호</li>
						<li>주문서</li> <!-- 아이템 이름 -->
						<li>분류</li>
						<li>작성일</li>
						<li>상태</li>
						<li>송장번호</li>
						<li>외화금액</li>
						<li>구매대행 이용료</li>
						<li>최종 결제금액</li>
						<li>결제하기</li>
					</ul>
				
					<c:forEach var="poDto" items="${poList}">
						<ul class="menu list">
							<li>${poDto.poNo}</li>
							<li><a href="/mypage/detail?poNo=${poDto.poNo}">${poDto.poItemEngName}</li>
							<li>${poDto.poItemCategory}</li>
							<li>${poDto.poSdate}</li>
							<li>${poDto.poStatus}</li>
							<li>${poDto.poAwbNumber}</li>
							<li>${poDto.poFx}</li>
							<li>${poDto.poServiceFee}</li>
							<li>${poDto.poTotalPriceKrw}</li>
							<li><a href="payment?poNo=${poDto.poNo}" style="color: #B2BC76;">이동</a>
							</li>
						</ul>
					</c:forEach>
					
				</c:if><!-- 구매서 작성 내역이 있는 경우 닫는 태그 -->
			</div>
			</div>
		</div><!-- 오른쪽 내용 닫는 태그 -->
	</div><!-- 컨텐트 자리 닫는 태그 -->
</div>

	



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>