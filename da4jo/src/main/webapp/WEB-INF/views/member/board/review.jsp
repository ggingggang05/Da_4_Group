<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>




<!-- 리뷰 페이지 -->
	<div class="cell center">
		<h2>${memberDto.memberId}님의 리뷰 내역</h2>
	</div>

<!-- 리뷰 충전 내역 테이블 -->
		<div>
		<c:if test="${empty reviewList}"> <!-- 내가 쓴 리뷰가 없을 경우 -->
			<div class="cell center mt-30">
				<i class="fa-regular fa-face-sad-tear fa-3x"></i>
				<h2>작성한 리뷰가 없습니다</h2>
			</div>
			<div class="cell center">
				<h2>
					<a href="/board/review/write" class="btn"> 
					<i class="fa-solid fa-pen" style="color: #dbdd7e;"></i> 
					리뷰 작성하기
					</a>
				</h2>
			</div>
		</c:if><!-- 내가 쓴 리뷰가 없는 태그 닫기 -->
		</div>

		<c:if test="${!empty reviewList}"><!-- 리뷰 내역이 있는 경우 -->
			<div>
				<h2>
					리뷰 내역 &nbsp;&nbsp;&nbsp; 
					<a href="/board/review/write" class="btn">
					<i class="fa-solid fa-pen" style="color: #dbdd7e;"></i> 
					작성 하기
					</a>
				</h2>
			</div>
			<table class="table table-horizontal">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reviewDto" items="${reviewList}">
						<tr>
							<td align="center">
								${reviewDto.reviewNo}
							</td>
							<td align="center">
								${reviewDto.reviewTitle}
							</td>
							<td align="center"><fmt:formatDate value="${reviewDto.reviewWdate}"
									pattern="yyyy-MM-dd HH:mm" />
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</c:if><!-- 리뷰 내역이 있는 경우 닫는 태그 -->


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>