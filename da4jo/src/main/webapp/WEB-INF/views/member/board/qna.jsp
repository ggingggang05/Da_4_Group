<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- lightpick CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>

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

#qnaNo {
	width: 10%;
}
#qnaSecret {
	width: 10%;
}
#qnaTitle {
	width: 60%;
}
#qnaWdate {
	width: 15%;
}



#isBlock, #memberDetail {
	width: 9%;
}

.menu-type {
	background-color: #60A1F833 !important;
	height : 42px;
}
.menu-list {
	margin: 0px !important;
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
				<i class="fa-solid fa-pause"></i> ${sessionScope.loginId}님의 문의내역
			</div>
		</div>
		<div class="content content-body">
			<div class="cell">
				<c:if test="${empty qnaList}">
					<!-- 구매서 작성 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-circle-xmark fa-3x"></i>
						<h2>문의내역이 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
							<a href="/member/board/qna" class="btn"> <i
								class="fa-solid fa-paper" style="color: #B2BC76;"></i> 문의 작성하러
								가기
							</a>
						</h2>
					</div>
				</c:if>
				<!-- 문의 내역이 없는 경우 닫는 태그 -->
				<c:if test="${!empty qnaList}">
					<!-- 문의 내역이 있는 경우 -->
					
					<div class="cell flex-cell">
						<div class="cell searchArea w-75 left"><!-- 검색 기능 -->
							<form action="qna" method="get">
								<select name="column" class="searchSelect searchOption">
									<option value="qna_no" ${empty param.column || param.column == 'qna_no' ? 'selected' : ''} >글번호</option>
									<option value="qna_secret" ${param.column == '"qna_secret"' ? 'selected' : ''}>잠금현황</option>
									<option value="qna_title" ${param.column == 'qna_sdate' ? 'selected' : ''}>제목</option>
								</select> 
								<!-- <div class="DateInput" style="display: none;">
									<input type="text" name="startDate" placeholder="날짜 선택" value="$(settlementVO.qnaPayDate)">
								</div> -->
								<input type="search" name="keyword" placeholder="" value="${param.keyword}" class="searchBar" autocomplete="off">
								<button class="btn searchBtn" type="submit">
									<i class="fa-solid fa-search"></i>
								</button>
							</form>
						</div><!-- 검색기능 닫는 태그 -->
						<div class="cell w-25 right">
							<a class="btn requestBtn" href="/board/qna/write" style="color: #60A1F8;">문의 작성하기</a>
						</div>
					</div>

					<ul class="menu menu-type">
						<li id="qnaNo"><strong>글번호</strong></li>
						<li id="qnaSecret"><strong>비밀글</strong></li>
						<!-- 아이템 이름 -->
						<li id="qnaTitle"><strong>제목</strong></li>
						<li id="qnaWdate"><strong>작성일</strong></li>
					</ul>

						<c:forEach var="qnaDto" items="${qnaList}">
							<ul class="menu menu-list">
								<li id="qnaNo">${qnaDto.qnaNo}</li>
								<li id="qnaSecret"><a
									href="/board/qna/detail?qnaNo=${qnaDto.qnaNo}">${qnaDto.qnaSecret}</a></li>
								<li id="qnaTitle" class="cell left"><c:set
										var="formattedTitle"
										value="${fn:replace(qnaDto.qnaTitle, ',', '')}" />
									${formattedTitle}</li>
								<li id="qnaWdate">${qnaDto.qnaWdate}</li>
							</ul>
						</c:forEach>
					<!-- 작성자가 로그인 아이디랑 같을때 출력하는 구문 -->
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
					<a href="qna?page=${pageVO.getPrevBlock()}&${pageVO.getQueryString()}">&lt;이전</a>
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
						<a href="qna?page=${i}&${pageVO.getQueryString()}">${i}</a>
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
						href="qna?page=${pageVO.getNextBlock()}&${pageVO.getQueryString()}">다음&gt;</a>
				</c:otherwise>
			</c:choose>
		</div><!-- 네비게이터 닫는 태그 -->
	</div>
	<!-- 오른쪽 내용 닫는 태그 -->
</div>
<!-- 컨테이너 자리 닫는 태그 -->


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
