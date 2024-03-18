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


<!-- 로그인 한 회원의 구매서 목록 페이지 -->
<br>
<br>
<div class="container container-body">
	<!-- 마이페이지 헤더 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>${memberDto.memberId}님의 문의내역
			</div>
		</div>
	</div>
		<!-- 왼쪽 내용 -->
	<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>

	<!-- 오른쪽 내용 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 나의 문의내역
			</div>
		</div>
		<div class="content content-body">
			<div class="cell listArea">
				<c:if test="${empty reviewList}">
					<!-- 구매서 작성 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-face-sad-tear fa-3x"></i>
						<h2>남기신 후기가 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/member/board/review" class="btn"> <i
								class="fa-solid fa-paper" style="color: #B2BC76;"></i> 리뷰 작성하러
								가기
							</a>
						</h2>
					</div>
				</c:if>
				<!-- 문의 내역이 없는 경우 닫는 태그 -->
				<c:if test="${!empty reviewList}">
					<!-- 문의 내역이 있는 경우 -->
					<div class="cell flex-cell">
						<div class="cell searchArea w-75 left">
							<!-- 검색 기능 -->
							<form action="list" method="get">
								<select name="column" class="searchSelect">
									<option value="review_title"
										${param.column == 'review_title' ? 'selected' : ''}>제목</option>
									<option value="review_content"
										${param.column == 'review_content' ? 'selected' : ''}>내용</option>
									<option value="review_wdate"
										${param.column == 'review_wdate' ? 'selected' : ''}>작성일</option>
								</select> <input type="search" name="keyword" placeholder=""
									value="${param.keyword}" class="searchBar">
								<button class="btn searchBtn">
									<i class="fa-solid fa-search"></i>
								</button>
							</form>
						</div>
						<!-- 검색기능 닫는 태그 -->
						<div class="cell w-25 right">
							<h2>
								<a class="btn" href="/board/review/write" style="color: #B2BC76;">리뷰
									작성하기</a>
							</h2>
						</div>
					</div>

					<ul class="menu menu-type">
						<li id="reviewNo"><strong>글번호</strong></li>
						<li id="reviewTitle"><strong>제목</strong></li>
						<!-- 아이템 이름 -->
						<li id="reviewContent"><strong>내용</strong></li>
						<li id="reviewWdate"><strong>작성일</strong></li>
					</ul>


					<c:forEach var="reviewDto" items="${reviewList}">
						<ul class="menu menu-list">
							<li id="reviewNo">${reviewDto.reviewNo}</li>
							<li id="reviewTitle">${reviewDto.reviewTitle }</li>
							<li id="reviewContent">${reviewDto.reviewContent}</li>
							<li id="reviewWdate">${reviewDto.reviewWdate}</li>
						</ul>
					</c:forEach>
				</c:if>
				<!-- 구매서 작성 내역이 있는 경우 닫는 태그 -->
			</div>
			<!-- 구매서 리스트 닫는 태그-->
		</div>
		<!-- 내용 바디 닫는 태그 -->
	</div>
	<!-- 오른쪽 내용 닫는 태그 -->
</div>
<!-- 컨테이너 자리 닫는 태그 -->		



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>