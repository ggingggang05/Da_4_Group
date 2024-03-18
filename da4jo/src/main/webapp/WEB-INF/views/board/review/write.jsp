<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- jquery cdn -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
    
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>

</style>
<script>
	$(function() {
		//출력용
		$(".score").score({
			starColor : "#ff8080", //별 색상
			display : {//표시 옵션
				showNumber : false,//숫자 표시 여부
				textColor : "#ff8080", //글자 색상
				placeLimit : 0,//표시할 소수점 자리수
			},
		});
	});
</script>

	<script>
        $(function(){
            //작성용
                $(".score-edit").score({
                starColor: "#ff8080", //별 색상
                editable: true,//편집 가능 설정
                integerOnly: true,//정수만 선택 가능하도록 설정

                send:{//전송 옵션
                    sendable:true,//전송 허용
                    name:"score",//전송할 파라미터명
                },

                display:{//표시 옵션
                    showNumber: true,//숫자 표시 여부
                    textColor: "#ff8080", //글자 색상
                    placeLimit: 0,//표시할 소수점 자리수
                },

                point:{//점수 옵션
                    max:5,//최대 점수
                    rate:5,//최초 점수
                }
            });
        });
    </script>

<form action="write" method="post" autocapitalize="off"
	enctype="multipart/form-data">

	<div class="container w-800">
		<div>
			<h1>리뷰글 작성</h1>
		</div>
		
		 <div class="cell">
            <div class="score-edit" data-max="5.0"></div>
        </div>

		<h2>제목</h2>
		<div>
			<input class="tool w-100" type="text" name="reviewTitle">
		</div>

		<h2>내용</h2>
		<div>
			<textarea class="imgArea" name="reviewContent"></textarea>
		</div>

		<h2>썸네일 이미지</h2>
		<div>
			<input type="file" name="img" accept="image/*" class="">
		</div>

<div class="cell right">
		<button class="btn">등록</button>
</div>
	</div>

</form>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>