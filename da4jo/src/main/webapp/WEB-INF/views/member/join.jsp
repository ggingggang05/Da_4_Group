<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Da4Jo: 회원가입</title>

    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- 내가 구현한 스타일 -->
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <link rel="stylesheet" type="text/css" href="../css/test.css">

    <!-- font awesome 아이콘 CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        
    </style>

    <!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <!-- 내가 만든 스크립트 추가(jQuery를 사용했으니 jQuery CDN 아래 작성) -->
    <script src="commons.js"></script>
    <!-- javascript를 의도적으로 head 자리에 배치해서 가장 먼저 실행되도록 구현-->
    <script type="text/javascript">
        $(function(){
    	    $("[name=memberPw]").on("blur", function(){
    	        var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{6,15}$/;
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
        });
    </script>
</head>
<body>
    <form action="join" method="post" autocapitalize="off" >
        <div class="container w-500">
            <div class="cell center">
                <h1>회원가입 화면</h1>
            </div>
            <div class="cell">
                아이디*<input type="text" name="memberId">
                <div class="success-feedback">멋진 아이디네요!</div>
	            <div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
	            <div class="fail2-feedback">이미 사용중인 아이디입니다</div>
            </div>  
            <div class="cell"> <!-- type="password"변경 전 -->
                비밀번호*<input type="text" name="memberPw">
                <div class="success-feedback">비밀번호가 올바른 형식입니다</div>
            	<div class="fail-feedback">비밀번호에는 반드시 영문 대,소문자와 숫자, 특수문자가 포함되어야 합니다</div>
            </div>
            <div class= "cell">
				비밀번호 확인 *<input type= "text" id="pw-reinput">
				<div class="success-feedback">비밀번호가 일치합니다</div>
			    <div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
			    <div class="fail2-feedback">비밀번호를 먼저 입력하세요</div>
            </div>
            <div class="cell">
                한국이름*<input type="text" name="memberNameKor">
            </div>
            <div class="cell">
                영어이름<input type="text" name="memberNameEng">
            </div>
            <div class="cell">
                이메일*<input type="text"name="memberEmail">
            </div>
            <div class="cell">
                연락처1*<input type="text" name="memberContact1">
            </div>
            <div class="cell">
                연락처2<input type="text" name="memberContact2">
            </div>
            <div class="cell">
                생년월일<input type="text" name="memberBirth">
            </div>
            <div class="cell">
                통관번호<input type="text" name="memberClearanceId">
            </div>
            <div class="cell">
                우편번호<input type="text" name="memberZipcode">
            </div>
            <div class="cell">
                기본주소<input type="text" name="memberAddress1">
            </div>
            <div class="cell">
                상세주소<input type="text" name="memberAddress2">
            </div>
            <div class="cell">
                <button>
                    가입하기
                </button>
            </div>

        </div>
    </form>
</body>
</html>