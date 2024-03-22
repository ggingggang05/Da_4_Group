<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<stlye>
	
</stlye>

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
		        isCertValid : false,
		        memberContact1Valid : false,
		        memberContact2Valid : true,//선택
		        memberBirthValid : true, //선택
		        memberClrearanceIdValid : true,//선택
		        memberAddressValid : true,//선택
		        //객체에 함수를 변수처럼 생성할 수 있다
		        ok : function(){
		            return this.memberIdValid && this.memberPwValid 
	            		&& this.memberPwCheckValid && this.memberNameKorValid 
	            		&& this.memberEmailValid && this.isCertValid 
	            		&& this.memberContact1Valid 
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
	    
	    //한글이름 검사
	     $("[name=memberNameKor]").blur(function(){
	        var regex = /^[가-힣]{2,7}$/;
	        var value = $(this).val();
	    	state.memberNameKorValid = regex.test($(this).val);
	    	
	    	if(regex.test(value)){// 형식 검사 통과
	    		$(this).removeClass("fail").addClass("success");
	    		state.memberNameKorValid = true;
	    	}
	    	else{ //한글 이름 형식 검사 실패
	    		$(this).removeClass("success fail")
   							 .addClass(state.memberNameKorValid ? "success" : "fail");
	    	}
	    }); 
	    //영어이름 검사
	    $("[name=memberNameEng]").blur(function(){
	    	var regex = /^[A-Za-z]+$/;
	    	var value = $(this).val();
	    	state.memberNameEngValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberNameEngValid ? "success" : "fail");
	    });
	    $("[name=memberEmail]").on("input", function(){
			if(state.isCertValid){
				alert("이메일 변경으로 재인증이 필요합니다.");
				state.memberEmailValid = false;
				state.isCertValid = false;
				$(this).removeClass("success fail").addClass("fail");
				$(".cert-wrapper").empty();
			}	    	
	    });
	    
	    //이메일 검사
   		//인증을 마쳤는데 추가 입력을 하는 경우는 모든 상태를 초기화
		//- 이메일 판정 취소
		//- 인증번호 입력창 제거
		//- 이메일 피드백 제거
	    $("[name=memberEmail]").on("input", function(){
			if(state.memberEmailValid){
				state.memberEmailValid = false;
				$(this).removeClass("success fail");
				$(".cert-wrapper").empty();
			}	    	
	    });
	    
	    $("[name=memberEmail]").blur(function(){
	        var regex = /^[a-z0-9_]{5,20}@[a-z0-9.]{1,20}$/;
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
//         //뒤에 있는 보내기 버튼을 활성화 또는 비활성화
//         $(this).next(".btn-send-cert").prop("disabled", !isValid)
//         				.removeClass("positive negative")
//         				.addClass(isValid ? "positive" : "negative");
	    
	    
	        
	    //연락처1* 검사
	     $("[name=memberContact1]").blur(function(){
	        var regex = /^[0-9]+$/;
	        var value = $(this).val();
	    	state.memberContact1Valid = regex.test($(this).val);
	    	
	    	if(regex.test(value)){
	    		$(this).removeClass("fail").addClass("success");
	    		state.memberContact1Valid = true;
	    	}
	    	else{
	    		$(this).removeClass("success fail")
   							 .addClass(state.memberContact1Valid ? "success" : "fail");
	    	}
	    });    	    
	    
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
	    	var regex = /^P[0-9]{12}$/; //db 정규표현식 P대문자만 허용 됨
	    	var value = $(this).val();
	    	state.memberClearanceIdValid = value.length == 0 || regex.test(value);
	        $(this).removeClass("success fail")
	                    .addClass(state.memberClearanceIdValid ? "success" : "fail");
	    });	   
	    
	    //주소
	    $("[name=memberAddress2]").blur(function(){
	        var zipcode = $("[name=memberZipcode]").val();
	        var address1 = $("[name=memberAddress1]").val();
	        var address2 = $("[name=memberAddress2]").val();

	        var isClear = zipcode.length == 0 && address1.length == 0 && address2.length == 0;
	        var isFill = zipcode.length > 0 && address1.length > 0 && address2.length > 0;
	        var address2Null = zipcode.length > 0 && address1.length > 0 && address2.length == 0;
	        
	        state.memberAddressValid = isClear || isFill || address2Null;
	        
	        $("[name=memberZipcode], [name=memberAddress1], [name=memberAddress2]")
				            .removeClass("success fail")
				         	  	 .addClass(state.memberAddressValid ? "success" : "fail");
		});
	    
	    var timer;
	    var minutes = 5;
	    var seconds = 0;
	
	    function startTimer() {
	        timer = setInterval(updateTimer, 1000);
	    }
	
	    function updateTimer() {
	        if (seconds > 0) {
	            seconds--;
	        } else {
	            if (minutes > 0) {
	                minutes--;
	                seconds = 59;
	            } else {
	                clearInterval(timer);
	                $(".timer").hide(); // 타이머 숨기기
	                return;
	            }
	        }
	
	        var timerText = ("0" + minutes).slice(-2) + ":" + ("0" + seconds).slice(-2);
	        $(".timer").text(timerText);
	    }
	
	    startTimer();
	
	    // 인증번호 입력 시 타이머 숨기기
	    $("input[name='verificationCode']").on("input", function() {
	        if ($(this).val().length > 0) {
	            clearInterval(timer);
	            $(".timer").hide(); // 타이머 숨기기
	        }
	    });
		
		//인증메일 보내기
        var memberEmail;
        $(".btn-send-cert").click(function(){
            var btn = this;
            $(btn).find("span").text("전송중");
            $(btn).find("i").removeClass("fa-regular fa-paper-plane")  
                                    .addClass("fa-solid fa-spinner fa-spin");
            $(btn).prop("disabled", true);

            //이메일 불러오기
            var email = $("[name=memberEmail]").val();
            if(email.length == 0) return;

            $.ajax({
                url:"/rest/member/sendCert",
                method:"post",
                data:{memberEmail : email},
                success: function(response){
                    //템플릿을 불러와서 인증번호 입력창을 추가
                    var templateText = $("#cert-template").text();
                    var templateHtml = $.parseHTML(templateText);

                    $(".cert-wrapper").empty().append(templateHtml);
                    //$(".cert-wrapper").html(templateHtml);

                    //이메일 정보를 저장
                    memberEmail = email;
                },
                error:function(){
                    alert("시스템 오류. 잠시 후 이용바람");
                },
                complete:function(){
                    $(btn).find("span").text("보내기");
                    $(btn).find("i").removeClass("fa-solid fa-spinner fa-spin")  
                                            .addClass("fa-regular fa-paper-plane");
                    $(btn).prop("disabled", false);
                },
            });
        });
        
      //인증번호 확인버튼 이벤트
        $(document).on("click", ".btn-check-cert", function(){
            var number = $(".cert-input").val();//인증번호
            if(memberEmail == undefined || number.length == 0) return;
			
            $.ajax({
                url:"/rest/member/checkCert",
                method:"post",
                data:{ certEmail : memberEmail, certNumber : number },
                success: function(response){
                    //response는 true 아니면 false이므로 상태를 갱신하도록 처리
                    console.log(response);
                    $(".cert-input").removeClass("success fail")
                                    .addClass(response === true ? "success" : "fail");
                    
                    if(response) {
                        //$(".btn-check-cert").off("click");
                        //$(".btn-check-cert").remove();
                        $(".btn-check-cert").prop("disabled", true);
                        state.isCertValid = true;
                        
                        // 인증번호 입력 후 타이머를 멈추고 숨기기
                        clearInterval(timer);
                        $(".timer").text("인증완료").css("color", "green");
                        $(".timer").fadeOut(1000); // 1초 후 타이머 숨기기
                        $(".cert-wrapper").empty();

                    }
                    else{
                    	state.memberEmailValid =false;
                    }
                },
                error:function(){
                    alert("확인 과정에서 오류가 발생했습니다");
                },
                //complete:function(){}
            });
        });
	    
	    $(".check-form").submit(function(e){
	        //$(this).find("[name], #pw-reinput").blur();
	        //$(this).find(".tool").blur();//모든 창
	        
	        //입력창 중에서 success fail fail2가 없는 창
	        $(this).find(".tool").not(".success, .fail, .fail2").blur();
	        //console.table(state);
	        return state.ok();
	    });
   });
    </script>

    <script type="text/template" id="cert-template">
        <div>
			<div class="cell flex-cell">
           		<input type="text" class="tool cert-input" 
                                        placeholder="인증번호">
				<button type= "button" class="btn btn-check-cert">확인</button>
			</div>
			<div class="success-feedback">이메일 인증 완료</div>
            <div class="fail-feedback">인증번호 불일치</div>
			<div class="timer"></div>
		</div>
     </div>
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(function(){
        $(".btn-address-search").click(function(){
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $("[name=memberZipcode]").val(data.zonecode);
                    $("[name=memberAddress1]").val(addr);
                    
                    // 커서를 상세주소 필드로 이동한다.
                    $("[name=memberAddress2]").focus();
                }
            }).open();
        });
        
        $(".btn-address-clear").click(function(){
        	$("[name=memberZipcode]").val("");
        	$("[name=memberAddress1]").val("");
        	$("[name=memberAddress2]").val("");
        });
    
    });
    
</script>

	<style>
	/*
	input.tool {
		border-radius: 10px;
		
	}
	*/

	.box{
    display: block;

    font-size: 15px;
    padding: 0.7em;
    /* margin: 10px 0px; */
	}
	/* .box도 있고 .input도 있는 경우 선택*/
	.box.input{
	    border: 2px solid #ccc;
	    /* 입력창의 기본 강조효과 제거 */
 	    outline: none; 
	}
	/* 조건부 선택자*/
	.box.input:focus{
	    border-color: #2db400;
	}
	.box.input {
/*  	    border-bottom: 1px;  */
	    border-radius: 4px;
/* 	    border-top-right-radius: 4px; */
	    /* padding: 0.4em; */
	}
	/*
	.box.input[name=memberPw]{
	    border-top-width: 1px;
	    border-top-left-radius: 4px;
	    border-top-right-radius: 4px;
	     padding: 0.4em; 
	*/
	
	}
	*{
	    box-sizing: border-box;
	    font-family: sans-serif;    
	}  
	/*아이디,비밀번호 placeholder*/		
	input.tool::placeholder {
	    color: #b2bec3;
	    font-size: 14px;
	}
	
	
	.timer{
		color: red;
	}
	.join{
		color: white;
		background-color: #74b9ff;
		border-radius: 5px;
	}
	.block{
		padding: 0.4em;
		margin-top: 1em;
		box-shadow: 0 0 25px rgba(0, 0, 0, 0.2);
		border-radius: 0.5em;
	}
	/* 웹킷(WebKit) 기반 브라우저용 스타일 */
	input[type="file"]::-webkit-file-upload-button {
	  background: #74b9ff;;
	  color: #fff;
	  border: none;
	  padding: 10px 20px;
	  border-radius: 5px;
	  cursor: pointer;
	}
	
	/* 파이어폭스(Firefox)용 스타일 */
	.input::file-selector-button {
	  background: #74b9ff;;
	  color: #fff;
	  border: none;
	  padding: 10px 20px;
	  border-radius: 5px;
	  cursor: pointer;
}
</style>
 
    
</head>
<body>
	<div class="container w-600" style="margin-bottom: 3em; margin-top: 3em;">
	<form action="join" method="post" autocomplete="off" enctype="multipart/form-data" 
									class="check-form">
		<div class="container w-550">
			<div class="cell center">
				<h1 style= "color: #74b9ff;">회원가입</h1>
			</div>
			
				<!-- 첫번째 블럭 -->
				
				<div class="container w-450 block">
						<div class="container w-400">
							<p class="right" style="font-size: 12px; color: red;">* 표시는 필수 항목입니다.</p>
							<!-- 아이디 입력창 -->
							<div class="cell">
								<input type="text" name="memberId" class= "tool w-100 box input" placeholder="아이디*">
								<div class="success-feedback">
									<label></label>
								</div>
								<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
								<div class="fail2-feedback">이미 사용중인 아이디입니다</div>
							</div>
							<!-- 비밀번호 입력창 -->
							<div class="cell">
								<input type="password" name="memberPw" class= "tool w-100 box input" placeholder="비밀번호*">
								<div class="success-feedback">
									<label></label>
								</div>
								<div class="fail-feedback">비밀번호에는 반드시 영문 대,소문자와 숫자, 특수문자가
												포함되어야 합니다
								</div>
							</div>
						
						<!-- 비밀번호 확인 입력창 -->
						<div class="cell">
							<input type="password" id="pw-reinput"  class="tool w-100 box input" placeholder="비밀번호 확인 *">
							<div class="success-feedback">
								<label></label>
							</div>
							<div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
							<div class="fail2-feedback">비밀번호를 먼저 입력하세요</div>
						</div>
						<!-- 한국이름 입력창 -->
						<div class="cell">
							<input type="text" name="memberNameKor" class= "tool w-100 box input" placeholder="한국이름*">
							<div class="success-feedback">
								<label></label>
							</div>
							<div class="fail-feedback">한글 이름을 입력해주세요</div>
						</div>
						<!-- 영어이름 입력창 -->
						<div class="cell">
							<input type="text" name="memberNameEng" class="tool w-100 box input" placeholder="영어이름">
								<div class="success-feedback">
									<label></label>
								</div>
								<div class="fail-feedback">잘못된 영어 이름입니다.</div>
						</div>
						<!-- 이메일 입력창 -->
						<div class="cell">
				            <div class="flex-cell" style="flex-wrap:wrap;">
					            <input type="email" name="memberEmail" 
					                                class="tool width-fill box input" placeholder="이메일">
					            <button type= "button" class="btn btn-send-cert" 
					            			style="background-color: #74b9ff; color: white;">
				
					            	<span>인증번호 요청</span>
					            </button>
					            <div class="fail-feedback w-100">잘못된 이메일 형식입니다</div>
					            <div class="fail2-feedback w-100">사용중인 이메일입니다</div>
				            </div>
			            </div>
			        <div class="cell cert-wrapper"></div>	
			    </div>		
		        </div>
				<div class="container w-450 block">
					<div class="container w-400">
						<!-- 연락처1 입력창 -->
						<div class="cell">
							<input type="text" name="memberContact1" class= "tool w-100 box input" placeholder="연락처1* (숫자만 입력해주세요)">
							<div class="success-feedback">
								<label></label>
							</div>
							<div class="fail-feedback">연락처 형식 오류</div>
						</div>
						<!-- 연락처2 입력창 -->
						<div class="cell">
							<input type="text" name="memberContact2" class= "tool w-100 box input" placeholder="연락처2  (숫자만 입력해주세요)">
								<div class="success-feedback">
									<label></label>
								</div>
								<div class="fail-feedback">잘못된 연락처입니다.</div>
						</div>
					
						<!-- 생년월일 입력창 -->
						<div class="cell">
							<input type="text" name="memberBirth" class= "tool w-100 box input" placeholder="생년월일 YYYY-MM-DD">
								<div class="success-feedback">
									<label></label>
								</div>
								<div class="fail-feedback">잘못된 형식입니다.</div>
						</div>
						<!-- 통관번호 입력창 -->
						<div class="cell">
							<input type="text" name="memberClearanceId" class= "tool w-100 box input" placeholder="통관번호 ex)P1111222233334444">
								<div class="success-feedback">
									<label></label>
								</div>
								<div class="fail-feedback">잘못된 형식입니다.</div>
						</div>
						<!-- 주소 입력창 -->
						<!-- 우편번호 입력창 -->
						<div class="cell flex-cell">
							<input type="text" name="memberZipcode" class= "tool w-100 box input" placeholder="우편번호" readonly>
				            <button type="button" class="btn btn-address-search" style= "border-right: 1px; background-color:  #74b9ff; color: white;">
		                		<i class="fa-solid fa-magnifying-glass"></i>
		            		</button>      
		     		            <button type="button" class="btn btn-address-clear" style= "background-color:  #74b9ff; color: white;">
					            	<i class="fa-solid fa-xmark"></i>
					            </button>
						</div>
						<!-- 기본주소 입력창 -->
						<div class="cell">
							<input type="text" name="memberAddress1" class= "tool w-100 box input" placeholder= "기본주소" readonly>
						</div>
						<div class="cell">
							<input type="text" name="memberAddress2" class= "tool w-100 box input" placeholder="상세주소">
								<div class="success-feedback">
									<label></label>
								</div>
							<div class="fail-feedback">주소를 검색하여 우편번호를 입력해주세요.</div>
						</div>
						<!-- 프로필 이미지 입력창 -->
						<div class="cell">
<!-- 							<label for="img"><img src="/image/user.png" style="width: 200px"></label> -->
							<label style="color: #b2bec3; font-size: 15px;;">프로필 이미지</label>
							<input type="file" id="img" name="img" class="tool w-100 box input" >
						</div>
					</div>
				</div>
				
				<div class="container w-450" style="margin-bottom: 3em;">
					<div class="cell">
					<button type="submit" class="btn w-100 join">
						<i class="fa-solid fa-user"></i>
						회원가입
					</button>
					</div>
				</div>	
				

			


		</div>
	</form>
	</div>

	<%-- 템플릿 페이지를 불러오는 코드 --%>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>