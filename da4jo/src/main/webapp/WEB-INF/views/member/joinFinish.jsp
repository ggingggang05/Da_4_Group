<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<head>
	<title>Da4Jo: 로그인</title>

    <script type="text/javascript">
        function validateForm() {

            var userId = document.getElementsByName("memberId")[0].value;
            var userPw = document.getElementsByName("memberPw")[0].value;

            if (event.submitter && event.submitter.classList.contains("login")) {
                if (userId.trim() == "" || userPw.trim() == "") {
                    alert("아이디와 비밀번호를 모두 입력하세요.");
                    return false;
                }
            }
        }
    </script>
	 <script>
		function saveLogin() {
		    var memberId = document.querySelector('input[name="memberId"]').value;
		    var memberPw = document.querySelector('input[name="memberPw"]').value;
		    var autoLogin = document.getElementById('autoLogin').checked;
		    var rememberId = document.getElementById('rememberId').checked;
		    
		    if (autoLogin) {
		        document.cookie = "savedId=" + memberId + "; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/";
		        document.cookie = "savedPw=" + memberPw + "; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/";
		    } else {
		        // 자동 로그인을 해제하면 쿠키를 제거합니다.
		        document.cookie = "savedId=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
		        document.cookie = "savedPw=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
		    }
		    
		    if (rememberId) {
		        document.cookie = "savedId=" + memberId + "; expires=Fri, 31 Dec 9999 23:59:59 GMT; path=/";
		    } else {
		        // 아이디를 기억하지 않으면 쿠키를 제거합니다.
		        document.cookie = "savedId=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
		    }
		}
	</script>
<style>
.btn.login, .btn.pw { 
	color: white;
	white-space: nowrap;
	width: 150px;
	height: 130px;
	font-size: 20px;
}

.link-login {
	flex: 1;
	padding: 10px;
}

.btn.login	 {
	background-color: #74b9ff;
}

.link-pw {
	flex: 1;
	padding: 10px;
}

.btn.pw {
	background-color: rgb(234, 111, 0);
}
/*a태그 회원가입,아이디 찾기, 비밀번호 찾기*/
		a {
			  text-decoration: none;
			  color:  #b2bec3;
			  transition: color 0.1s;
		}
		/*a태그 마우스 올리면*/
 		a:hover {
    		color: #636e72;
    	}
		/*아이디,비밀번호 placeholder*/		
		input.tool::placeholder {
		    color: #b2bec3;
		    font-size: 14px;
		}
 			

		.login {
			  background-color: #74b9ff;
			  border: 1px solid #eee;
 			  border-radius: 5px; 
/* 			  padding: 25px; */
			  box-shadow: 0 0 25px rgba(0, 0, 0, 0.2);
			  color: white;
			  font-size: 17px;
				border: none;
				cursor: pointer;	
		}
			/*
			.login button {
 			  background-color: #2991b1; 
			  color: #fff;
			  width: 300px;
			  height: 50px;
			  border-radius: 5px;
			  border: none;
			  cursor: pointer;
			  font-size: 20px;
			  transition: 0.3s;
			}*/
			
			
/* 			.login button:hover { 
			  background-color: #2c778e; 
			} */
			
			/*입력창 (아이디,패스워드)*/
			.flex-cell input.tool
			{
				border-left: none;
			    border-right: none;
			    border-top: none;
			    padding-left: 0;
			    padding-right: 0;
		        border-bottom: 1px solid rgb(224, 224, 224);
		        transition: border-color 0.3s;
			}
			.fa-solid
			 {
	            width: 12%;
	            font-size: 24.5px;
	            padding: 0.5em;
	            border-bottom: 1px solid rgb(224, 224, 224);
	            color: #b2bec3;
	            transition: border-color 0.3s, color 0.3s;
			}
			/*입력창 클릭시*/			
			.flex-cell input.tool:focus + .fa-solid{
			    border-bottom-color: #47A3FF; /* 입력창이 포커스를 받았을 때 보더의 아래 부분의 색상을 변경합니다. */
			}

</style>


<br>
<div class="container container-body">
	
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text center">
				<i class="fa-solid fa-plane-departure" style="border-bottom: none;"></i>다사조 가입을 환영합니다.
			</div>
		</div>
		<br>
		<br>
		<div class="container w-500" style="box-shadow: 0 0 25px rgba(0, 0, 0, 0.2); padding: 0.4em; margin-top: 3em; margin-bottom: 6em; border-radius: 20px; ">
        <form autocomplete="off" action="login" method="post" onsubmit="return validateForm()">
            <div class="container w-400">
	            <div class="cell center">
	                <h1 style= "color: #74b9ff;">Log in</h1>
	            </div>
	            
	            <div class="cell flex-cell">
	            	<i class="fa-solid fa-user"></i>
	                <input type="text" name="memberId" placeholder="아이디" class="tool w-100">
	            </div>
	            <div class="cell flex-cell"> 
	            	<i class="fa-solid fa-lock" style="margin-top: 0.5em;"></i>
	                <input type="password" name="memberPw" placeholder="비밀번호" class="tool w-100" style="margin-top:0.5em;">
	            </div>
	            
	            <div>
	                <c:if test="${param.error != null}">
	                    <h5 style= "color:red"> 
	                   		 아이디 또는 비밀번호를 잘못 입력했습니다.<br>
							입력하신 내용을 다시 확인해주세요.
						</h5>
	                </c:if>
	            </div>
	            
       	     	<div class="cell floating-cell" style="padding-top: 1em;">
                    <div class="w-50 center">
                     	<a href="findId" style= "font-size: 13px;">아이디 찾기</a>
                    </div>
                    <div class="w-50 center" style= "border-left: 1px solid rgb(224, 224, 224)">
                        <a href="findPw" style= "font-size: 13px;">비밀번호 찾기</a>
                    </div>
               </div>
	            

 
	
	            <div class="cell" style="margin-top: 2em;">
	                <button type="submit" class= "login tool w-100" onclick="saveLogin()">
	                    Log in
	                </button>
	            </div>
	            

	            
	            <div style= "font-size: 14px; color: black; padding: 0.4em;  margin-bottom: 3em; margin-top: 2em;"class="center">
	            	 <a href="${pageContext.request.contextPath}/member/join">계정이 없으신가요?</a>
	            </div>
            </div>
        </form>
    </div>
	</div>
</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>