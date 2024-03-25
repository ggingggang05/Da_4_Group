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
	width: 25%;
}

#creditCharge {
	width: 25%;
}

#creditStatus {
	width: 25%;
	display: flex;
}
</style>
<!-- 캐시 충전 승인 요청/처리 페이지 -->
<div class="container container-body container-body-long">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 캐시 충전
			</div>
		</div>
		<div class="content content-body">
			<div class="cell listArea">
				<ul class="menu menu-type">
					<li id="memberId"><strong>회원ID</strong></li>
					<li id="creditCharge"><strong>충전금액</strong></li>
					<li id="creditStatus"><strong>현재상태</strong></li>
					<li id="statusBtn"></li>
				</ul>
				<script type="text/javascript">
					$(function() {
						$("#changeStatusButton").on("click", function(e) {
							if ($("#creditStatusSelect").val() === "") {
								e.preventDefault(); // 폼의 제출을 막음
								return; // 버튼 동작 중지
							}
						});
					})
				</script>
				<c:forEach var="creditDto" items="${creditList}">
					<form action="creditList" method="post">
						<ul class="menu menu-list">
							<input name="creditNo" value="${creditDto.creditNo}"
								type="hidden">
							<input name="memberId" value="${creditDto.memberId}"
								type="hidden">
							<input name="creditCharge" value="${creditDto.creditCharge}"
								type="hidden">

							<li id="memberId">${creditDto.memberId}</li>
							<li id="creditCharge"><fmt:formatNumber
									value="${creditDto.creditCharge}" pattern="#,##0"></fmt:formatNumber>원</li>

							<li id="creditStatus"><select name="creditStatus"
								id="creditStatusSelect" class="tool w-75">
									<option value="">선택하세요</option>
									<option value="승인 완료">승인 완료</option>
									<option value="승인 반려">승인 반려</option>
							</select>
								<button id="changeStatusButton" class="w-25">상태변경</button></li>
						</ul>
					</form>
				</c:forEach>
			</div>
		</div>
		<div class="cell">
			<%--네비게이터 --%>
			<jsp:include page="/WEB-INF/views/template/navigator.jsp"></jsp:include>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>