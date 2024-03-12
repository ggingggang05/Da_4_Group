<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Javascript 예제</title>

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
        <div class="cell center">
            <h1>'${memberDto.memberId}'님의 MY PAGE</h1>
        </div>
        <div class="cell">
            이름(한글) : ${memberDto.memberNameKor}
        </div>
        <div class="cell">
            이름(영문) : ${memberDto.memberNameEng}
        </div>
        <div class="cell">
            이메일 : ${memberDto.memberEmail}
        </div>
        <div class="cell">
            연락처1 : ${memberDto.memberContact1}
        </div>
        <div class="cell">
            연락처2 : ${memberDto.memberContact2}
        </div>
        <div class="cell">
            생년월일 : ${memberDto.memberBirth}
        </div>
        <div class="cell">
            통관번호 : ${memberDto.memberClearanceId}
        </div>
        <div class="cell">
            우편번호 : ${memberDto.memberZipcode}<br>
            기본주소 : ${memberDto.memberAddress1}<br>
            상세주소 : ${memberDto.memberAddress2}
        </div>
        <div class="cell">
            회원등급 : ${memberDto.memberLevel}
        </div>
        <div class="cell">
            충전캐쉬 : ${memberDto.memberCredit}
        </div>
        <div class="cell">
            포인트 : ${memberDto.memberPoint}
        </div>
        <div class="cell">
           	회원가입시간 : 
				<fmt:formatDate value="${memberDto.memberJoinDate}"
           											pattern="Y-MM-dd HH:mm:ss"/> 
        </div>
        <div class="cell">
           	최종로그인시간 : 
           	<fmt:formatDate value="${memberDto.memberLoginDate}"
           										pattern="Y-MM-dd HH:mm:ss"/> 
        </div>
        
    </div>
    
    <table class="table table-border">
		<thead>
			<tr>
				<th>충전금액</th>
				<th>충전시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="creditDto" items="#">
			<tr>
				<td>${creditDto.creditCharge}</td>
				<td>
					<fmt:formatDate value="${creditDto.creditTime}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>