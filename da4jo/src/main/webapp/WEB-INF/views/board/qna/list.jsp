<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- jquery cdn -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>

<!-- select2 cdn -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
	
<script type="text/javascript">
	$(function() {
		$(".searchSelect").select2({
			minimumResultsForSearch : Infinity
		//selelct창에 검색 바 유무(주석처리 시 생김)
		});
	});
</script>

<style>
.menu.menu-type {
	border-bottom: 1px solid #CAE4FF;
	border-top: 1px solid #CAE4FF;
	background-color: #DEEEFF;
	font-size: 14px;
}

.menu.menu-list.menu li {
	font-size: 14px;
}

.menu.menu-list.menu li {
	font-size: 14px;
}

.bottom-bar div:first-child {
	width: 750px;
}

.menu.menu-type.qnaMenu {
	height: 40px !important;
}

.menu.menu-list.qnaMenu {
	height: 40px !important;
}

.qnaTitlteLock {
	color: #d63031 !important;
}

#qnaNo {
	width: 8% !important;
}

#qnaRock {
	width: 15% !important;
}

#typeQnaTitle {
	text-align: center;
	width: 70% !important;
}

#qnaTitle {
	text-align: left;
	width: 70% !important;
}

#qnaMember {
	text-align: left;
	width: 70% !important;
}

#qnaMember1 {
	text-align: center;
	width: 70% !important;
}

#qnaWdate {
	width: 20% !important;
}
/* .menu li { */
/*     font-size: 16px; */
/*     width: 200px; */
/*     color: #2D3436; */
/*     padding: 0.5em; */
/*     text-align: center; */
/* } */

</style>

<!-- select2 cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".searchSelect").select2({
			minimumResultsForSearch : Infinity
		//selelct창에 검색 바 유무(주석처리 시 생김)
		});
	});
</script>

<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> Q&A 게시판
			</div>
		</div>
		<div class="content content-body right">
			<div class="cell center"></div>
			<div class="cell center">


				<%-- 관리자 일때 --%>

				<%-- 목록 --%>
				<ul class="menu menu-type qnaMenu">
					<li id="qnaNo">번호</li>
					<c:if
						test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}">
						<li id="qnaRock">잠금상태</li>
					</c:if>
					<li id="typeQnaTitle">제목</li>
					<li>작성자</li>
					<li id="qnaWdate">작성일</li>
				</ul>

				<c:forEach var="qnaDto" items="${list}">
					<ul class="menu menu-list qnaMenu">
						<li id="qnaNo">${qnaDto.qnaNo}</li>
						<c:if
							test="${sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자'}">
							<li id="qnaRock">${qnaDto.qnaSecret}</li>
						</c:if>

						<c:choose>
							<c:when
								test="${sessionScope.loginId == qnaDto.qnaWriter || sessionScope.loginLevel == '관리자' || sessionScope.loginLevel == '총관리자' || qnaDto.qnaSecret == 'N'}">
								<c:set var="formattedTitle"
									value="${fn:replace(qnaDto.qnaTitle, ',', '')}" />
								<li id="qnaTitle"><a href="detail?qnaNo=${qnaDto.qnaNo}">${formattedTitle}</a></li>
							</c:when>
							<c:otherwise>
								<li id="qnaTitle" class="qnaTitlteLock"><i
									class="fa-solid fa-lock blue"> 이 글은 비밀글 입니다.</i></li>
							</c:otherwise>
						</c:choose>


						<c:choose>
							<c:when test="${qnaDto.qnaStatus == '답변용글'}">
								<li><span>답글[관리자]</span></li>
							</c:when>
							<c:otherwise>
								<li>${qnaDto.qnaWriter}</li>
							</c:otherwise>
						</c:choose>

						<li id="qnaWdate">${qnaDto.qnaWdate}</li>
					</ul>
				</c:forEach>

				<div class="flex-cell">
					<div class="cell flex-cell my-30 bottom-bar">
						<div class="cell">
							<%-- 검색창 --%>
							<form action="list" method="get" class="left">
								<select name="column" class="searchSelect">
									<option value="qna_no"
										${param.column == 'qna_no' ? 'selected' : ''}>글번호</option>
									<option value="qna_title"
										${param.column == 'qna_title' ? 'selected' : ''}>제목</option>
									<option value="qna_writer"
										${param.column == 'qna_writer' ? 'selected' : ''}>작성자</option>
									<option value="qna_content"
										${param.column == 'qna_content' ? 'selected' : ''}>내용</option>
								</select> <input class="searchBar w-400" type="search" name="keyword"
									placeholder="검색어 입력" required value="${param.keyword}">
								<button class="btn searchBtn">검색</button>
							</form>
						</div>
						<div class="cell right">
							<a href="write" class="link">질문글쓰기</a>
						</div>
					</div>
				</div>

				<div class="cell">
					<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>