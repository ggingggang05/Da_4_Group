<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>
.floating-cell>.start-wrapper {
	width: 25%;
	padding: 20px 15px;
}

.floating-cell>.end-wrapper {
	width: 75%;
	padding: 15px;
}
</style>


<!-- 마이페이지 -->
<div class="container w-1200">
	<div class="cell center">
		<h1>'${memberDto.memberId}'님의 MY PAGE</h1>
	</div>

	<div class="cell floating-cell">
		<!-- 화면 왼쪽 -->
		<div class="start-wrapper">
			<div class="cell">
				<!-- 이미지 -->
				<img src="profileImg" width="100%">
			</div>
			<!-- 정보 수정 및 회원 탈퇴 버튼 -->
			<div class="cell p-10 mb-20 pt-50">
				<div class="cell">
					<a class="btn w-100" href="/member/mypage/password">비밀번호 변경</a>
				</div>
				<div class="cell">
					<a class="btn w-100" href="/member/mypage/change">개인정보 변경</a>
				</div>
				<div class="cell">
					<a class="btn w-100 negative" href="/member/mypage/exit">회원 탈퇴</a>
				</div>
			</div>
		</div> <!-- 화면 왼쪽 닫는 태그 -->		

		<!-- 화면 오른쪽 -->
		<div class="end-wrapper">
			<!-- 정보 리스트 -->
			<div class="cell center floating-cell">
				<div class="w-30">
					<ul>
					<li>아이디</li>
					<li>이름(한글)</li>
					<li>이름(영문)</li>
					<li>이메일</li>
					<li>통관번호</li>
					<li>연락처1</li>
					<li>연락처2</li>
					<li>주소</li>
					<li>생년월일</li>
					<li>회원등급</li>
					<li>충전캐쉬</li>
					<li>포인트</li>
					</ul>
				</div>
				<div>
					<ul>
					<li>${memberDto.memberId}</li>
					<li>${memberDto.memberNameKor}</li>
					<li>${memberDto.memberNameEng}</li>
					<li>${memberDto.memberEmail}</li>
					<li>${memberDto.memberClearanceId}</li>
					<li>${memberDto.memberContact1}</li>
					<li>${memberDto.memberContact2}</li>
					<li>[${memberDto.memberZipcode}]<br>
						${memberDto.memberAddress1}, ${memberDto.memberAddress2}
					</li>
					<li>${memberDto.memberBirth}</li>
					<li>${memberDto.memberLevel}</li>
					<li>${memberDto.memberCredit}</li>
					<li>${memberDto.memberPoint}</li>
					</ul>
				</div>	
			</div><!-- 정보 리스트 닫는 태그 -->
			
			<!-- 캐쉬 충전 내역 테이블 -->
			<c:if test="${empty CashList}"> <!-- 캐쉬 내역이 없는 경우 -->
					<div class="cell center mt-30">
						<i class="fa-regular fa-face-sad-tear fa-3x"></i>
						<h2>구매내역이 없습니다</h2>
					</div>
					<div class="cell center">
						<h2>
						<a href="/credit/charge" class="btn"> 
							<i class="fa-solid fa-sack-dollar" style="color: #dbdd7e;"></i>
							구매하러 가기
						</a>
					</h2>
				</div>
			</c:if><!-- 캐쉬 내역이 없는 경우 닫는 태그 -->
			<c:if test="${!empty CashList}"><!-- 캐쉬 내역이 있는 경우 -->
				<div>
					<h2>
						캐쉬 구매 내역 &nbsp;&nbsp;&nbsp; 
						<a href="/point/charge" class="btn">
							<i class="fa-solid fa-sack-dollar" style="color: #dbdd7e;"></i>
							추가 구매
						</a>
					</h2>
				</div>
				<table class="table table-horizontal">
					<thead>
						<tr>
							<th>상품명</th>
							<th>구매금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>상품명</th>
							<th>구매금액</th>
						</tr>
					</tbody>
				</table>
			</c:if><!-- 캐쉬 내역이 있는 경우 닫는 태그 -->
			
		</div> <!-- 화면 오른쪽 닫는 태그 -->
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>