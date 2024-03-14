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
	    //이메일 검사
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

	        var isAddress1Null = address1.length == 0;
	        var isAddress2Null = address2.length == 0;
		
	    	 // "zipcode", "address1", "address2" 모두 null이거나
	        // "zipcode", "address1"이 모두 null이 아니면서 "address2"가 null인 경우 valid
	        state.memberAddressValid = (zipcode.length == 0 && isAddress1Null && isAddress2Null) || (!isAddress1Null && isAddress2Null);
	        
	        $("[name=memberZipcode], [name=memberAddress1], [name=memberAddress2]")
				            .removeClass("success fail")
				         	  	 .addClass(state.memberAddressValid ? "success" : "fail");
		});
   });
    </script>
    <script type="text/javascript">
	    //인증메일
    	$(function(){
    		
    		
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
                        
                        if(response === true) {
                            //$(".btn-check-cert").off("click");
                            //$(".btn-check-cert").remove();
                            $(".btn-check-cert").prop("disabled", true);
                            state.memberEmailValid = true;
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
    	});
    </script>
    <script type="text/template" id="cert-template">
        <div>
			<div class="cell plex-cell">
           		<input type="text" class="tool cert-input" 
                                        placeholder="인증번호">
            	<button type= "button" class="btn btn-check-cert">확인</button>
			</div>
            <div class="success-feedback">이메일 인증 완료</div>
            <div class="fail-feedback">인증번호 불일치</div>
        </div>
	</script>
	<script type="text/javascript">
	$(function(){
		//이전, 다음 버튼을 누르면 표시된 페이지의 순서에 맞게 진행바 변경
		calculatePercent(1);
		
		$(".page").find(".btn-prev").click(function(){
			//표시되는 페이지가 몇 번째인가?
			//-> $(대상).index(전체대상)
			//-> 대상은 :visible 이라고 붙이면 표시된 항목을 찾아준다(jQuery 전용)
			var index = $(".page:visible").index(".page") + 1;
			calculatePercent(index);
		});
		$(".page").find(".btn-next").click(function(){
			var index = $(".page:visible").index(".page") + 1;
			calculatePercent(index);
		});
		
		function calculatePercent(page) {
			var total = $(".page").length;
			var percent = page * 100 / total;
			$(".progressbar > .guage").css("width", percent+"%");
			
	        // 프로그레스 바 안에 현재 단계 텍스트 추가
	        $(".progressbar > .guage").text(page + "단계");
		}
	});
	</script>

	<style>
	/* 프로그레스 바 스타일 */
	.progressbar {
	  width: 100%;
	  height: 30px;
	  background-color: #f2f2f2;
	  margin-bottom: 20px;
      border-color: black 2px;

	}
	
	.guage {
	  height: 100%;
	  background-color: rgb(64, 175, 239);;
	  text-align: center;
	  line-height: 30px;
	  color: black;
	  font-weight: bold;
      border-color: black 2px;
	}
</style>
    
</head>
<body>
	<form action="join" method="post" autocomplete="off" enctype="multipart/form-data">
		<div class="container w-500">
			<div class="cell center">
				<h1>회원가입 화면</h1>
			</div>
			
			<!-- 진행바 -->
			<div class="cell">
				<div class="progressbar"><div class="guage"></div></div>
			</div>
			
			
			<div class="cell page">
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
									포함되어야 합니다
					</div>
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
					<label>프로필 이미지</label>
					<input type="file" name="img" class="tool w-100">
				</div>
			
			
			<div class="flex-cell">
				<div class="w-100 left">
					<button type="button" class="btn btn-prev">
						<i class="fa-solid fa-chevron-left"></i>
							이전
					</button>
					</div>
					<div class="w-100 right">
						<button type="button" class="btn btn-next">
							다음
							<i class="fa-solid fa-chevron-right"></i>
						</button>
					</div>
				</div>
			</div>
			
			<div class="cell page">
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
					<label>이메일*</label>
				</div>
				
					<div class="flex-cell" style="flex-wrap:wrap;">
						<input type="email" name="memberEmail" class= "tool w-100">
							<div class="success-feedback">
						<button type= "button" class="btn negative btn-send-cert">
							<i class="fa-solid fa-paper-plane"></i>
			            	<span>인증번호 받기</span>
			            </button>
							<label><i class="fa-solid fa-circle-check"></i></label>
						</div>
						<div class="fail-feedback">이메일 형식 오류</div>
						<div class="fail2-feedback">사용중인 이메일입니다</div>
					</div>
				
				<div class="cell cert-wrapper"></div>			
				
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
			
			
			<div class="flex-cell">
				<div class="w-100 left">
					<button type="button" class="btn btn-prev">
						<i class="fa-solid fa-chevron-left"></i>
							이전
					</button>
					</div>
					<div class="w-100 right">
						<button type="button" class="btn btn-next">
							다음
							<i class="fa-solid fa-chevron-right"></i>
						</button>
					</div>
				</div>
			</div>
			
			<div class="cell page">
				<div class="cell">
					생년월일<input type="text" name="memberBirth" class= "tool w-100">
						<div class="success-feedback">
							<label><i class="fa-solid fa-circle-check"></i></label>
						</div>
						<div class="fail-feedback">잘못된 형식입니다.</div>
				</div>
				
				<div class="cell">
					통관번호<input type="text" name="memberClearanceId" class= "tool w-100" placeholder="ex)P1111222233334444">
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
						<div class="success-feedback">
							<label><i class="fa-solid fa-circle-check"></i></label>
						</div>
					<div class="fail-feedback">주소를 모두 작성하세요</div>
				</div>
				

				
			<div class="flex-cell">
				<div class="w-100 left">
					<button type="button" class="btn btn-prev">
						<i class="fa-solid fa-chevron-left"></i>
							이전
					</button>
					</div>
					<div class="w-100 right">
						<button type="button" class="btn btn-next">
							다음
							<i class="fa-solid fa-chevron-right"></i>
						</button>
					</div>
				<div class="w-100 right">
					<button type="submit" class="btn">
						<i class="fa-solid fa-user"></i>
						회원가입
					</button>
				</div>
				</div>
			</div>

			


		</div>
	</form>

	<%-- 템플릿 페이지를 불러오는 코드 --%>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>