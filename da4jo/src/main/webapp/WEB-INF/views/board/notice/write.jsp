<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	$(function() {
		var options = {
			//에디터 툴바(메뉴) 설정
			toolbar : [ [ 'style', [ 'bold', 'italic', 'underline' ] ],
					[ 'fontsize', [ 'fontname', 'fontsize' ] ],
					[ 'color', [ 'forecolor', 'backcolor' ] ],
					[ 'para', [ 'style', 'ul', 'ol', 'paragraph' ] ],
					[ 'insert', [  'link', 'hr' ] ], ],
			//기본높이 설정(단위 : px)
			height : 400,
			minHeight : 400,
			maxHeight : 600,
		};
		$(".textArea").summernote(options);

	});
</script>
<form action="write" method="post" autocapitalize="off">
    <div class="container w-800">
        <div>
            <h1>공지사항 작성</h1>
        </div>

        <h2>제목</h2>
        <div>
            <input class="tool w-100" type="text" name="noticeTitle">
        </div>
        
        <h2>내용</h2>
        <div>
            <textarea class="textArea" name="noticeContent"></textarea>
        </div>
		<br>
		<div class="right">
        <button type="submit" class="btn">등록</button>
        </div>
    </div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>