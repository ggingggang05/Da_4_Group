<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

	<!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

    <!-- summernote cdn -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
     <script type="text/javascript">
     //임시 코드 나중에 헤더에 등록해서 사용하기
     $(function(){
    	 $("[name=reviewContent]").summernote({
             //에디터 툴바(메뉴) 설정
             toolbar: [
                 // [groupName, [list of button]]
                 ['style', ['bold', 'italic', 'underline']],
                 ['fontsize', ['fontname', 'fontsize']],
                 ['color', ['forecolor', 'backcolor']],
                 ['para', ['style', 'ul', 'ol', 'paragraph']],
                 ['insert', ['picture', 'link', 'hr']],
             ],
             //기본높이 설정
             height: 400,
             minHeight: 200,
             maxHeight: 500,
             //안내문구 설정
             placeholder: "입력하세요",
         });
     });
     </script>
      

<form action="write" method="post" autocapitalize="off">
<div class="container w-800">
	<div>
		<h1>리뷰글 작성</h1>
	</div>

	<h2>제목</h2> 
	<div>
		<input class="tool w-100" type="text" name="reviewTitle"> 
	</div>
	
	<h2>내용</h2>
	<div>
		<textarea name="reviewContent"></textarea>
	</div>	

	<button class="btn">등록</button>
</div>
</form>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>