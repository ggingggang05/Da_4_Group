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

<!-- 프로필 변경 -->
<script>
$(function(){
	$(".profileEdit").on("input", function(){
		//파일이 없으면 리턴(전송 X)
		if(this.files.length == 0) return;
		//console.log(this.files);
		
		var formData = new FormData();
		formData.append("img", this.files[0]);
		
		//비동기 통신
		$.ajax({
			url : "/rest/member/editProfile", //이미지 업로드를 처리하는 서버
			method : "post",
			data : formData, //이미지 파일 데이터 (전송해주기)
			processData : false,
			contentType : false,
			success : function(response) {
				//서버에서 응답 받은 후 실행되는 함수
				if (response == null) return;
				
				//기존에 있는 img 태그에 넣기!!!
				$(".newProfile").attr("src", "img");
			}
		});
			
	});		
  	
});
</script>



<!-- 마이페이지 -->
<br>
<br>
<div class="container container-body">
	<!-- 마이페이지 헤더 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>마이페이지
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
						<a class="link">내가 쓴 리뷰</a>
					</div>
				</div>
			</div>
		</div><!-- 왼쪽 사이드 바 닫는 태그 -->
		<!-- 오른쪽 내용 -->
		<div class="container inner-container">
			<div class="content content-body">
				<!-- 주요메뉴 -->
				<div class="cell center flex-cell">
					<div class="cell boxInfo"> <!-- 메뉴1 -->
						<div> <!-- 제목 -->
							<a class="link" href="/member/mypage/purchase/list">구매대행 신청서 작성</a>
							<!-- <a class="btn w-100" href="/member/mypage/purchase/list">구매 신청서</a> -->
						</div>
						<div> <!-- 내용 -->
						</div>
					</div>
					<div class="cell boxInfo"> <!-- 메뉴2 -->
						<div> <!-- 제목 -->
							 <a class="link">menu2</a>
						</div>
						<div> <!-- 내용 -->
						</div>
					</div>
					<div class="cell boxInfo"> <!-- 메뉴3 -->
						<div> <!-- 제목 -->
							 <a class="link">menu3</a>
						</div>
						<div> <!-- 내용 -->
						</div>
					</div>
					<div class="cell boxInfo"> <!-- 메뉴4 -->
						<div> <!-- 제목 -->
							 <a class="link">menu4</a>
						</div>
						<div> <!-- 내용 -->
						</div>
					</div>
					<div class="cell boxInfo"> <!-- 메뉴5 -->
						<div> <!-- 제목 -->
							 <a class="link">menu5</a>
						</div>
						<div> <!-- 내용 -->
						</div>
					</div>
				</div><!-- 주요 메뉴 닫는 태그 -->
				
				<!-- 캐쉬 충전 내역 테이블 -->
				<div>
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
				
				
				<!-- 회원 탈퇴 페이지 이동 -->
				<div class="cell center" style="font-size:10px;">
					<a class="link" href="/member/mypage/exit">회원 탈퇴</a>
				</div>
				</div>
			</div>
		</div><!-- 오른쪽 내용 닫는 태그 -->
	</div><!-- 컨텐트 자리 닫는 태그 -->
</div>



<!-- 사용 중인 코드 입니다!!!!!!! -->
<%-- <div class="container w-1200">

	<div class="cell floating-cell">
		<!-- 화면 왼쪽 -->
		<div class="start-wrapper">
		</div> <!-- 화면 왼쪽 닫는 태그 -->		


		<!-- 화면 오른쪽 -->
		<div class="end-wrapper">
			<!-- 정보 리스트 -->
			<div class="cell center flex-cell">
				<div class="cell center">
						<h3>아이디</h3>
						<h3>이름(한글)</h3>
						<h3>이름(영문)</h3>
						<h3>이메일</h3>
						<h3>통관번호</h3>
						<h3>연락처1</h3>
						<h3>연락처2</h3>
						<h3>주소</h3>
						<h3>생년월일</h3>
						<h3>회원등급</h3>
						<h3>충전캐쉬</h3>
						<h3>포인트</h3>
					</div>
				</div>	
				<div class="cell center">
					<div class="w-70">
					<h5>${memberDto.memberId}</h5>
					<h5>${memberDto.memberNameKor}</h5>
					<h5>${memberDto.memberNameEng}</h5>
					<h5>${memberDto.memberEmail}</h5>
					<h5>${memberDto.memberClearanceId}</h5>
					<h5>${memberDto.memberContact1}</h5>
					<h5>${memberDto.memberContact2}</h5>
					<h5>[${memberDto.memberZipcode}]<br>
						${memberDto.memberAddress1}, ${memberDto.memberAddress2}
					</h5>
					<h5>${memberDto.memberBirth}</h5>
					<h5>${memberDto.memberLevel}</h5>
					<h5>${memberDto.memberCredit}</h5>
					<h5>${memberDto.memberPoint}</h5>
					</div>
				</div>
			</div><!-- 정보 리스트 닫는 태그 -->
		</div> <!-- 화면 오른쪽 닫는 태그 -->
	</div>
</div> --%>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>