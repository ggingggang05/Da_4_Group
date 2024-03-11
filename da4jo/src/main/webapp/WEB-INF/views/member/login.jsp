<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Da4Jo: 로그인</title>

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
        
    </script>
</head>
<body>

    <div class="container w-500">
        <form autocapitalize="off" action="login" method="post" onsubmit="return validateForm()">
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
                    <h4 style= "color:red"> 로그인 정보가 일치하지 않습니다</h4>
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
                <button type="submit">
                    로그인
                </button>
            </div>
        </form>
    </div>

</body>
</html>