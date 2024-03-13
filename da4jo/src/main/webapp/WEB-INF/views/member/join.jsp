<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script type="text/javascript">
    $(function(){
	    var state = {
		        //필수항목 : true; , 선택항목 : false;
		        memberIdValid : false,
		        memberPwValid : false,
		        memberPwCheckValid : false,
		        memberNameKorValid : false,
		        memberNameEngValid : true,//선택
		        memberEmailValid : false,
		        memberContact1Valid : false,
		        memberContact2Valid : true,//선택
		        memberBirthValid : true, //선택
		        memberClrearanceIdValid : true,//선택
		        memberAddressValid : true,//선택
		        //객체에 함수를 변수처럼 생성할 수 있다
		        ok : function(){
		            return this.memberIdValid && this.memberPwValid 
	            		&& this.memberPwCheckValid && this.memberNameKorValid 
	            		&& this.memberEmailValid && this.memberContact1Valid 
	            		&& this.memberContact2Valid && this.memberBirthValid 
	            		&& this.memberClrearanceIdValid && this.memberAddressValid;
		        },
	   		 };
	    //아이디 검사(비동기)
	    $("[name=memberId]").blur(function(){
	        var regex = /^[a-z][a-z0-9]{7,19}$/;
	        var value = $(this).val();	    
	    
	        if(regex.test(value)) {//아이디 형식 검사를 통과
	            $.ajax({
	                url : "/rest/member/checkJoinId",
	                method : "post",
	                data: {
	                    memberId : value
	                },
	                success : function(response) {
	                    console.log(response); 
	                    if(response == "joinN") {
	                        $("[name=memberId]").removeClass("success fail fail2").addClass("fail2");
	                        state.memberIdValid = false;
	                    }
	                    else if(response == "joinY") {
	                        $("[name=memberId]").removeClass("success fail fail2").addClass("success");
	                        state.memberIdValid = true;
	                    }
	                }
	            });
	        }
	        else {//아이디가 형식검사 통과
	            $("[name=memberId]").removeClass("success fail fail2").addClass("fail");
	            state.memberIdValid = false;
	        }
	    });	
	    //비밀번호 검사(+비밀번호 확인)
	    $("[name=memberPw]").on("blur", function(){
	        var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$%^&*]{6,15}$/;
	        state.memberPwValid = regex.test($(this).val());
	        $(this).removeClass("success fail")
	                    .addClass(state.memberPwValid ? "success" : "fail");
	    });	     
	    $("#pw-reinput").blur(function(){
	        var memberPw = $("[name=memberPw]").val();
	        state.memberPwCheckValid = memberPw == $(this).val();
	        
	        if(memberPw.length == 0) {
	            $(this).removeClass("success fail fail2").addClass("fail2");
	        }
	        else {
	            $(this).removeClass("success fail fail2")
	                        .addClass(state.memberPwCheckValid ? "success" : "fail");
	        }
	    });	   
	    
	    //한글이름 입력 구현중
	    /* $("[name=memberNameKor]").blur(function(){
	        var regex = /^[가-힣]{2,7}$/;
	        var value = $(this).val();
	    	state.memberNameKorValid = regex.test($(this).val);
	    	
	    	if(regex.test(value)){
	    		
	    	}
	    	
	    	if(memberNameKor.length ==0){
	    		$(this).removeClass("success fail").addClass("fail")
	    		
	    	}
	    	else{
		    	$(this).removeClass("success fail")
	    			 .addClass(state.memberNameKorValid ? "success" : "fail");
	    	}
	    }); */
	    //영어이름 검사
	    $("[name=memberNameEng]").blur(function(){
	    	var regex = /^[A-Za-z]+$/;
	    	var value = $(this).val();
	    	state.memberNameEngValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberNameEngValid ? "success" : "fail");
	    });
	    //이메일 검사
	    $("[name=memberEmail]").blur(function(){
	        var regex = /^[a-z0-9_]{8,20}@[a-z0-9.]{1,20}$/;
	        var value = $(this).val();
	    
	        if(regex.test(value)) {//이메일 형식 검사 통과
	            $.ajax({
	                url : "/rest/member/checkEmail",
	                method : "post",
	                data: {
	                    memberEmail : value
	                },
	                success : function(response) {
	                    console.log(response);
	                    if(response == "emailN") {
	                        $("[name=memberEmail]").removeClass("success fail fail2").addClass("fail2");
	                        state.memberEmailValid = false;
	                    }
	                    else if(response == "emailY") {
	                        $("[name=memberEmail]").removeClass("success fail fail2").addClass("success");
	                        state.memberEmailValid = true;
	                    }
	                }
	            });
	        }
	        else {//이메일 형식 검사 실패
	            $("[name=memberEmail]").removeClass("success fail fail2").addClass("fail");
	            state.memberEmailValid = false;
	        }
	    });
	        
	    //연락처1* 검사
	    
	    
	    //연락처2 검사
	    $("[name=memberContact2]").blur(function(){
	    	var regex = /^[0-9]+$/;
	    	var value = $(this).val();
	    	state.memberContact2Valid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberContact2Valid ? "success" : "fail");
	    });	    
	    
	    //생년월일 검사
	    $("[name=memberBirth]").blur(function(){
	    	var regex = /^(19[0-9]{2}|20[0-9]{2})-(02-(0[1-9]|1[0-9]|2[0-8])|(0[469]|11)-(0[1-9]|1[0-9]|2[0-9]|30)|(0[13578]|1[02])-(0[1-9]|1[0-9]|2[0-9]|3[01]))$/;
	    	var value = $(this).val();
	    	state.memberBirthValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberBirthValid ? "success" : "fail");
	    });	    
	    
	    //통관번호 
	    $("[name=memberClearanceId]").blur(function(){
	    	var regex = /^P[0-9]{12}$/; 
	    	var value = $(this).val();
	    	state.memberClearanceIdValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberClearanceIdValid ? "success" : "fail");
	    });	   
	    
	    //주소
	    
	    
   });
    </script>
</head>
<body>
	<form action="join" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="container w-500">
			<div class="cell center">
				<h1>회원가입 화면</h1>
			</div>
			<div class="cell">
				아이디*
				<input type="text" name="memberId" class= "tool w-100" placeholder="아이디">
				<div class="success-feedback">
					<label><i class="fa-solid fa-circle-check"></i></label>
				</div>
				<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
				<div class="fail2-feedback">이미 사용중인 아이디입니다</div>
			</div>
			<div class="cell">
				<!-- type="password"변경 전 -->
				비밀번호*<input type="text" name="memberPw" class= "tool w-100" placeholder="비밀번호">
				<div class="success-feedback">
					<label><i class="fa-solid fa-circle-check"></i></label>
				</div>
				<div class="fail-feedback">비밀번호에는 반드시 영문 대,소문자와 숫자, 특수문자가
					포함되어야 합니다</div>
			</div>
			<div class="cell">
				비밀번호 확인 *<input type="text" id="pw-reinput"  class="tool w-100">
				<div class="success-feedback">
					<label><i class="fa-solid fa-circle-check"></i></label>
				</div>
				<div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
				<div class="fail2-feedback">비밀번호를 먼저 입력하세요</div>
			</div>
			<div class="cell">
				한국이름*<input type="text" name="memberNameKor" class= "tool w-100">
				<div class="success-feedback">
					<label><i class="fa-solid fa-circle-check"></i></label>
				</div>
				<div class="fail-feedback">한글 이름을 입력해주세요</div>
			</div>
			<div class="cell">
				영어이름<input type="text" name="memberNameEng" class="tool w-100">
					<div class="success-feedback">
						<label><i class="fa-solid fa-circle-check"></i></label>
					</div>
					<div class="fail-feedback">잘못된 영어 이름입니다.</div>
			</div>
			
			<div class="cell">
				이메일*<input type="text" name="memberEmail" class= "tool w-100">
				<div class="success-feedback">
					<label><i class="fa-solid fa-circle-check"></i></label>
				</div>
				<div class="fail-feedback">이메일 형식 오류</div>
				<div class="fail2-feedback">사용중인 이메일입니다</div>
			</div>
			
			
			<div class="cell">
				연락처1*<input type="text" name="memberContact1" class= "tool w-100">
				<div class="success-feedback">
					<label><i class="fa-solid fa-circle-check"></i></label>
				</div>
				<div class="fail-feedback">연락처 형식 오류</div>
			</div>
			
			<div class="cell">
				연락처2<input type="text" name="memberContact2" class= "tool w-100">
					<div class="success-feedback">
						<label><i class="fa-solid fa-circle-check"></i></label>
					</div>
					<div class="fail-feedback">잘못된 연락처입니다.</div>
			</div>
			<div class="cell">
				생년월일<input type="text" name="memberBirth" class= "tool w-100">
					<div class="success-feedback">
						<label><i class="fa-solid fa-circle-check"></i></label>
					</div>
					<div class="fail-feedback">잘못된 형식입니다.</div>
			</div>
			
			<div class="cell">
				통관번호<input type="text" name="memberClearanceId" class= "tool w-100">
					<div class="success-feedback">
						<label><i class="fa-solid fa-circle-check"></i></label>
					</div>
					<div class="fail-feedback">잘못된 형식입니다.</div>
			</div>
			
			<div class="cell">
				<input type="text" name="memberZipcode" class= "tool w-20" placeholder="우편번호">
			</div>
			<div class="cell">
				<input type="text" name="memberAddress1" class= "tool w-50" placeholder= "기본주소">
			</div>
			<div class="cell">
				<input type="text" name="memberAddress2" class= "tool" placeholder="상세주소">
			</div>
			<div class="cell">
				<button>가입하기</button>
			</div>

		</div>
	</form>

	<%-- 템플릿 페이지를 불러오는 코드 --%>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>