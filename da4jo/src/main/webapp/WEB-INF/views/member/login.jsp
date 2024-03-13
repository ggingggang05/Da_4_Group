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
 </head>   
    <div class="container w-500">
        <form autocomplete="off" action="login" method="post" onsubmit="return validateForm()">
            <div class="cell center">
                <h1>로그인 화면</h1>
            </div>
            
            <div class="cell">
                <input type="text" name="memberId" placeholder="아이디" class="tool w-100">
            </div>
            <div class="cell"> <!-- type="password"변경 전 -->
                <input type="text" name="memberPw" placeholder="비밀번호" class="tool w-100">
            </div>
            
            <div>
                <c:if test="${param.error != null}">
                    <h5 style= "color:red"> 
                   		 아이디 또는 비밀번호를 잘못 입력했습니다.<br>
						입력하신 내용을 다시 확인해주세요.
					</h5>
                </c:if>
            </div>
            
            <div class="cell floating-cell" style="padding-top: 0.3em;">
                    <div class="w-50 center">
                     	<a href="findId" style= "font-size: 13px; color: black;">아이디 찾기</a>
                    </div>
                    <div class="w-50 center" style= "border-left: 1px solid rgb(224, 224, 224)">
                        <a href="findPw" style= "font-size: 13px; color: black;">비밀번호 찾기</a>
                    </div>
               </div>

            <div class="cell">
                <button type="submit" class= "login tool w-100">
                    로그인
                </button>
            </div>
        </form>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>