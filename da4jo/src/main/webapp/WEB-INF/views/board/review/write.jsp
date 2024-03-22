<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- jquery cdn -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
    
    

<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/board-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 리뷰글 작성
			</div>
		</div>

		<form action="write" method="post" autocapitalize="off"
			enctype="multipart/form-data">
			
			<div>
			</div>
			<div>
				<input class="wTool w-100" type="text" name="reviewTitle"
					placeholder="제목을 입력해주세요.">
			
			
			<div class="cell py-20">
				<h3>썸네일 이미지 [리뷰목록에 출력됩니다]</h3>
					
					<input type="file" name="img" accept="image/*">
					<div class="cell">
					<div class="score-edit" data-max="5.0"></div>
						</div>
				</div>

			<h3 style="margin-top: 50px;">리뷰글에 대한 내용을 입력해주세요</h3>
			<div>
				<textarea class="imgArea" name="reviewContent"></textarea>
			</div>
			</div>
			<div class="cell right">
				<button class="btn w-100">등록</button>
			</div>

				

			

		</form>

	</div>
</div>








<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>