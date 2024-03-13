<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.widget-location {
	    margin-bottom:18px;
	    padding:10px 0 9px 0;
	    border-bottom:1px solid #e0e0e0;
	}
	.widget-location h3 {
	    margin:0;
	    padding:0 0 0 14px;
	    font-size:18px;
	    color:#444;
	    font-weight:normal;
	    position:relative;
	}
	.widget-location h3:before {
	    content:"";
	    display:block;
	    width:4px;
	    height:20px;
	    background:#969696;
	    position:absolute;
	    left:0;
	    top:1px;
	}
	
	.widget-location .breadcrumb {
	    position:absolute;
	    top:10px;
	    right:0;
	    background:none;
	}
	.widget-location .breadcrumb>li+li:before {
	    content:">\00a0";
	    color:#666;
	}
	.widget-location .breadcrumb a {
	    color:#666;
	}
</style>
</head>
<body>
<div class="widget widget-location w-800 container">
	<br><br>
    <div class="wrap">
        <h3>공지사항</h3>
    </div>
	<div class="cell">
		<div class="">제목 ${noticeDto.noticeTitle}</div>
		<div class="">작성일 ${noticeDto.noticeWdate}</div>
	</div>	
	<div class="cell">
	${noticeDto.noticeContent}
	</div>
	<div>조회수 ${noticeDto.noticeVcount}</div>
	<br>
	<div class="flex-cell">
	<a href="/board/notice/list" class="link">
	<button class="btn">목록으로</button></a>
	<a href="/board/notice/edit?boardNo=${noticeDto.noticeNo}" class="link">
	<button class="btn">수정</button></a>
	<a href="/admin/board/notice/delete?noticeNo=${noticeDto.noticeNo}" class="link">
	<button class="btn">삭제</button></a>
	
	</div>		
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>