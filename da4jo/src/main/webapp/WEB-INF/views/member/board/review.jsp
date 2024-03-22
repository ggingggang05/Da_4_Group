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

#reviewNo {
	width: 15%;
}
#reviewTitle {
	width: 60%;
}
#reviewWriter {
	width: 15%;
}
#reviewWdate {
	width: 15%;
}
.truncate-text {
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 50ch; /* 최대 10글자로 설정 */
}

.truncate-name {
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 15ch; /* 최대 10글자로 설정 */
}

.menu-type {
	background-color: #60A1F833 !important;
	height : 42px;
}

</style>


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
				<i class="fa-solid fa-pause"></i> ${sessionScope.loginId}님의 리뷰내역
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<c:if test="${empty reviewList}">
					<!-- 구매서 작성 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-circle-xmark fa-3x"></i>
						<h2>남기신 후기가 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/member/board/review" class="btn"> <i
								class="fa-solid fa-paper" style="color: #B2BC76;"></i> 후기 작성하러
								가기
							</a>
						</h2>
					</div>
				</c:if>
				<!-- 문의 내역이 없는 경우 닫는 태그 -->
				<c:if test="${!empty reviewList}">
					<!-- 문의 내역이 있는 경우 -->
					<div class="cell flex-cell">
						<div class="cell searchArea w-75 left"><!-- 검색 기능 -->
							<form action="review" method="get">
								<select name="column" class="searchSelect searchOption">
									<option value="review_no" ${empty param.column || param.column == 'review_no' ? 'selected' : ''} >글번호</option>
									<option value="review_title" ${param.column == 'review_sdate' ? 'selected' : ''}>제목</option>
									<option value="review_writer" ${param.column == 'review_sdate' ? 'selected' : ''}>작성자</option>
								</select> 
								<!-- <div class="DateInput" style="display: none;">
									<input type="text" name="startDate" placeholder="날짜 선택" value="$(settlementVO.reviewPayDate)">
								</div> -->
								<input type="search" name="keyword" placeholder="" value="${param.keyword}" class="searchBar" autocomplete="off">
								<button class="btn searchBtn" type="submit">
									<i class="fa-solid fa-search"></i>
								</button>
							</form>
						</div><!-- 검색기능 닫는 태그 -->
						<div class="cell w-25 right">
							<a class="btn requestBtn" href="/member/review/request" style="color: #B2BC76;">리뷰 작성하기</a>
						</div>
					</div>

					<ul class="menu menu-type">
						<li id="reviewNo"><strong>글번호</strong></li>
						<li id="reviewTitle"><strong>제목</strong></li>
						<!-- 아이템 이름 -->
						<li id="reviewWriter"><strong>작성자</strong></li>
						<li id="reviewWdate"><strong>작성일</strong></li>
					</ul>


					<c:forEach var="reviewDto" items="${reviewList}">
						<ul class="menu menu-list">
							<li id="reviewNo">${reviewDto.reviewNo}</li>
							<li id="reviewTitle" class="cell left ms-20 truncate-text">${reviewDto.reviewTitle }</li>
							<li id="reviewWriter" class="truncate-name">${reviewDto.reviewWriter}</li>
							<li id="reviewWdate">${reviewDto.reviewWdate}</li>
						</ul>
					</c:forEach>
				</c:if>
				<!-- 구매서 작성 내역이 있는 경우 닫는 태그 -->
			</div>
			<!-- 구매서 리스트 닫는 태그-->
		</div>
		<!-- 내용 바디 닫는 태그 -->
		<div class="page-navigator"> <!-- 네비게이터 태그 -->
			<%-- 이전이 있을 경우만 링크를 제공 --%>
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
		</div><!-- 네비게이터 닫는 태그 -->
	</div>
	<!-- 오른쪽 내용 닫는 태그 -->
</div>
<!-- 컨테이너 자리 닫는 태그 -->		



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>