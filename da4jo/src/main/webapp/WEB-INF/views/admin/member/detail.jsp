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

.contact-wrapper {
	display: flex;
}
</style>
<form action="detail" method="get" autocomplete="off">
	<div class="container container-body">
		<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
		<div class="container inner-container">
			<div class="content content-head">
				<div class="content-head-text">
					<i class="fa-solid fa-user"></i> ${memberDto.memberId}
				</div>
			</div>
			<div class="content content-body">
				<div class="info-head w-100">
					<strong>개인정보</strong>
				</div>
				<div class="info-body">
					<div class="info-group">
						<div class="info-label">아이디</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberId}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">이름</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberNameKor}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">이름(영문)</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberNameEng}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">이메일</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberEmail}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">연락처</div>
						<div class="info-content-wrapper contact-wrapper">
							<div class="info-content contact1">
								${memberDto.memberContact1}</div>
							<div class="info-content contact2">
								${memberDto.memberContact2}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">생년월일</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberBirth}</div>
						</div>
					</div>
				</div>
			</div>
			<div class="content content-body">
				<div class="info-head w-100">
					<strong>통관부호</strong>
				</div>
				<div class="info-body">
					<div class="info-group">
						<div class="info-label">개인통관고유부호</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberClearanceId}</div>
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
							<div class="info-content">${memberDto.memberZipcode}</div>
							<div class="info-content">${memberDto.memberAddress1}</div>
							<div class="info-content">${memberDto.memberAddress2}</div>
						</div>
					</div>
				</div>
			</div>
			<div class="content content-body">
				<div class="info-head w-100">
					<strong>회원정보</strong>
				</div>
				<div class="info-body">
					<div class="info-group">
						<div class="info-label">회원등급</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberLevel}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">보유 크레딧</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberCredit}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">보유 포인트</div>
						<div class="info-content-wrapper">
							<div class="info-content">${memberDto.memberPoint}</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">가입일시</div>
						<div class="info-content-wrapper">
							<div class="info-content">
								<fmt:formatDate value="${memberDto.memberJoinDate}"
									pattern="y년 M월 d일 E H시 m분 s초" />
							</div>
						</div>
					</div>
					<div class="info-group">
						<div class="info-label">최근 로그인일시</div>
						<div class="info-content-wrapper">
							<div class="info-content">
								<fmt:formatDate value="${memberDto.memberLoginDate}"
									pattern="y년 M월 d일 E H시 m분 s초" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>