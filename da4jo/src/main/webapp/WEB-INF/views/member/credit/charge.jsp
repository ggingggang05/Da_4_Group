<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<br>
<br>
<div class="container container-body">
	<!-- 마이페이지 헤더 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>${session.loginId}님의 캐시 충전하기
			</div>
		</div>
	</div>
	<!-- 왼쪽 내용 -->
	<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>
	
	<!-- 오른쪽 내용 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 캐시 충전하기
			</div>
		</div>
		<div class="content content-body">
			<form action="charge" method="post" autocomplete="off">
				<div class="cell center">
					<label for="credit">충전금액(원) : </label>
					<input type="text" name = creditCharge id="credit">
				</div>
				<div class="cell center">
					<button>충전하기</button>
				</div>
			</form>
		</div><!-- 내용 바디 닫는 태그 -->
	</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->
   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    