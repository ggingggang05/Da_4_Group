<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- 최종 수정 시 확인 알림창 -->
<script type="text/javascript">
    function validateForm() {
		var choice = window.confirm("수정하시겠습니까?");
		if(choice == false) return;
    }
</script>

<!-- 제약조건 검사 -->
<script type="text/javascript"> 
$(function(){
    var state = {
	        //필수항목 : true; , 선택항목 : false;
	        memberIdValid : false,
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
        var post = $("[name=memberZipcode]").val();
        var address1 = $("[name=memberAddress1]").val();
        var address2 = $("[name=memberAddress2]").val();

        var isClear = post.length == 0 && address1.length == 0 && address2.length == 0;
        var isFill = post.length > 0 && address1.length > 0 && address2.length > 0;

        state.memberAddressValid = isClear || isFill;
        
        $("[name=memberZipcode], [name=memberAddress1], [name=memberAddress2]")
        .removeClass("success fail")
        .addClass(state.memberAddressValid ? "success" : "fail");
	});
});
</script>

<!-- 개인정보 수정 페이지 -->
<!-- <form action="/member/mypage/change" method="post" autocomplete="off"> -->
<form action="change" method="post" autocomplete="off" onsubmit="return validateForm()">
	<div class="container w-500">
		<div class="cell center">
			<h1>개인정보 변경</h1>	
		</div>
		<!-- 수정할 정보 -->		
		<div class="cell">
			<label>아이디<b style="color:red">*</b></label>
			<input type="text" name="memberId" class= "tool w-100" placeholder="아이디" value="${memberDto.memberId}">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
			<div class="fail2-feedback">이미 사용중인 아이디입니다</div>
		</div>
		<div class="cell">
			<label>이름(한글)<b style="color:red">*</b></label>
			<input type="text" name="memberNameKor" class="tool w-100" value="${memberDto.memberNameKor}">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">한글 이름을 입력해주세요</div>
		</div>
		<div class="cell">
			<label>이름(영문)</label>
			<input type="text" name="memberNameEng" class="tool w-100" value="${memberDto.memberNameEng}">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 영어 이름입니다.</div>
		</div>
		<div class="cell">
			<label>이메일<b style="color:red">*</b></label>
			<input type="text" name="memberEmail" class= "tool w-100" value="${memberDto.memberEmail}" readonly/>
		</div>
		<div class="cell">
			<label>통관번호</label>
			<input type="text" name="memberClearanceId" class= "tool w-100" value="${memberDto.memberClearanceId}">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 형식입니다.</div>
		</div>
		<div class="cell">
			<label>연락처1<b style="color:red">*</b></label>
			<input type="text" name="memberContact1" class= "tool w-100" value="${memberDto.memberContact1}">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">연락처 형식 오류</div>
		</div>
		<div class="cell">
			<label>연락처2</label>
			<input type="text" name="memberContact2" class= "tool w-100" value="${memberDto.memberContact2}">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 연락처입니다.</div>
		</div>
		<div class="cell">
			<label>주소</label>
		</div>
		<div class="cell">
			<input type="text" name="memberZipcode" placeholder="우편번호" class="tool" size="8" value="${memberDto.memberZipcode}">
			<button class="btn">검색</button>
		</div>
		<div class="cell">
			<input type="text" name="memberAddress1" placeholder="기본주소" class="tool w-100" value="${memberDto.memberAddress1}">
		</div>
		<div class="cell">
			<input type="text" name="memberAddress2" placeholder="상세주소" class="tool w-100" value="${memberDto.memberAddress2}">
			<div class="fail-feedback">주소를 모두 작성하세요</div>
		</div>
		<div class="cell">
			<label>생년월일</label>
			<input type="text" name="memberBirth" class= "tool w-100" value="${memberDto.memberBirth}">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 형식입니다.</div>
		</div>
		
		
		<hr>

		<!-- 개인정보 수정을 위한 비밀번호 확인 -->
		<div class="cell mt-20">
			<label>비밀번호 확인<b style="color:red">*</b></label>
			<input type="password" name="memberPw" class="tool w-100">
		</div>
		<div>
          	<c:if test="${param.error != null}">
               <div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
            </c:if>
        </div>
		
		<div class="cell">
			<button class="btn positive w-100">변경하기</button>
		</div>
		
	</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>