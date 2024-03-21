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
    <style>
   	
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

 </head>   
    <div class="container w-500" style="box-shadow: 0 0 25px rgba(0, 0, 0, 0.2); padding: 0.4em; margin-top: 6em; margin-bottom: 6em; border-radius: 20px; ">
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
	                <button type="submit" class= "login tool w-100">
	                    Log in
	                </button>
	            </div>
	            <div style= "font-size: 14px; color: black; padding: 0.4em;  margin-bottom: 3em; margin-top: 2em;"class="center">
	            	 <a href="/member/join">계정이 없으신가요?</a>
	            </div>
            </div>
        </form>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>