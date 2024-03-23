<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<style>	
input.tool::placeholder {
	color: #b2bec3;
	font-size: 14px;
}

.block{
	padding: 0.4em;
	margin-top: 50px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	border-radius: 0.5em;
	height: 150px;
	padding-top: 15px;
}

.labelText {
	padding : 20px !important;
    padding-top : 20px !important;
}			
			
input
{
	border-left: none;
    border-right: none;
    border-top: none;
    padding-left: 0;
    padding-right: 0;
    border-bottom: 1px solid rgb(224, 224, 224);
    transition: border-color 0.3s;
    height: 50px;
}

/*입력창 클릭시*/			
.flex-cell input.tool:focus + .fa-solid{
    border-bottom-color: #47A3FF; /* 입력창이 포커스를 받았을 때 보더의 아래 부분의 색상을 변경합니다. */
}
		    	
</style>


<script>
$(function(){
    $(".chargeBtn").on("click", function() {
		var choice = window.alert("캐시 신청 완료! \n이메일이 올 때까지 기다려주세요");
		if(choice == false) return;
	});
});
</script>

<br>
<br>
<div class="container container-body">
	<!-- 왼쪽 내용 -->
	<jsp:include page="/WEB-INF/views/template/mypage-leftbar.jsp"></jsp:include>
	
	<!-- 오른쪽 내용 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> ${sessionScope.loginId}님의 캐시 충전
			</div>
		</div>
		<div class="content content-body block">
			<form action="charge" method="post" autocomplete="off">
				<div class="cell center">
					<label for="credit" class="labelText">충전금액(원) : </label>
					<input type="text" name = "creditCharge" id="credit" placeholder="15000">
				</div>
				<div class="cell center">
					<button class="btn">충전하기</button>
				</div>
			</form>
		</div><!-- 내용 바디 닫는 태그 -->
	</div><!-- 오른쪽 내용 닫는 태그 -->	
</div><!-- 컨테이너 자리 닫는 태그 -->
   
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    