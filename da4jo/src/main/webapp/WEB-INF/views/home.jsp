<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- 스위퍼  cdn-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<style>
.swiper {
	width: 1140px;
	height: 360px;
}

.head-banner {
	background-color: #FFE0F0;
}

.swiper-button-prev, .swiper-button-next {
	border-radius: 20px;
	color: #FFFFFF !important;
}

.swiper-button-prev:after, .swiper-button-next:after {
	font-size: 52px !important;
	font-weight: 100 !important;
}
.link-container {
	width: 1140px;
}
.link-wrapper {
	display: flex;
	margin: 30px 10px 20px 10px;
}

.link-kh {
	flex: 5;
	border-top: 1px solid #d8d8d8;
	border-bottom: 1px solid #d8d8d8;
	padding: 10px;
}

.btn.ship, .btn.buying {
	color: white;
	white-space: nowrap;
	width: 150px;
	height: 130px;
	font-size: 20px;
}

.link-ship {
	flex: 1;
	padding: 10px;
}

.btn.ship {
	background-color: rgb(0, 151, 150);
}

.link-buying {
	flex: 1;
	padding: 10px;
}

.btn.buying {
	background-color: rgb(234, 111, 0);
}
.add {
	max-width:100%;
}

.review-wrapper {
	display: flex;
}
</style>
<script type="text/javascript">
	$(function() {
		var swiper = new Swiper('.banners', {
			direction : 'horizontal',
			loop : true,
			speed : 2000,
			autoplay : {
				delay : 5000,
				disableOnInteraction: false,
			},
			navigation : {
				nextEl : '.swiper-button-next',//다음버튼 선택자
				prevEl : '.swiper-button-prev',//이전버튼 선택자
			},
		// effect: 'slide',
		});

		var colors = [ "#FFE0F0", "#FCFFD2", "#F3ECDC", "#90DEF2", "#4F70D9",
				"#8A50E2", "#FFD800" ];

		swiper.on('slideChange', function() {
			var index = swiper.realIndex;
			$(".head-banner").css({
				"backgroundColor" : colors[index],
				"transition" : "background-color 3s",
			});
		});
		
		var swiper2 = new Swiper('.banners2', {
			direction : 'horizontal',
			loop : true,
			speed : 4000,
			slidesPerView : 2, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // 슬라이드간 간격
			slidesPerGroup : 1, // 그룹으로 묶을 수
			autoplay : {
				delay : 2000,
				disableOnInteraction: false,
			},
			navigation : {
				nextEl : '.swiper-button-next',//다음버튼 선택자
				prevEl : '.swiper-button-prev',//이전버튼 선택자
			},

		});

	});
</script>
<div class="head-banner">
	<div class="swiper banners center">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="image/01_배너_제휴이벤트.jpg">
			</div>
			<div class="swiper-slide">
				<img src="image/02_배너_3월쿠폰.jpg">
			</div>
			<div class="swiper-slide">
				<img src="image/03_배너_부피무게면제.jpg">
			</div>
			<div class="swiper-slide">
				<img src="image/04_배너_보험서비스.jpg">
			</div>
			<div class="swiper-slide">
				<img src="image/05_배너_수수료안내.jpg">
			</div>
			<div class="swiper-slide">
				<img src="image/06_배너_웰컴쿠폰.jpg">
			</div>
			<div class="swiper-slide">
				<img src="image/07_배너_카카오톡플러스친구.jpg">
			</div>
		</div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
	</div>
</div>
<div class="container link-container">
	<div class="link-wrapper">
		<div class="link-kh center">
			<a class="link" href="https://kh-academy.co.kr/main/main.kh">
				<img class="m-10" src="/image/KH정보교육원 로고.png">
			</a>
		</div>
		<div class="link-ship center">
			<a class="link" href="/member/ship/request">
				<button class="btn ship"><strong>배송대행</strong><br>신청하기</button>
			</a>
		</div>
		<div class="link-buying center">
			<a class="link" href="/member/po/request">
				<button class="btn buying"><strong>구매대행</strong><br>신청하기</button>
			</a>
		</div>
	</div>
</div>
<div class="middle-banner">
	<div class="swiper banners2 center">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a class="link" href="https://docs.sysout.co.kr/" target='_blank'>
					<img class="add" src="image/Hacademy.png">			
				</a>
			</div>
			<div class="swiper-slide">
				<a class="link" href="https://www.youtube.com/channel/UCdllyP_VgK-PY7VJRWOkOKQ" target='_blank'>
					<img class="add" src="image/열혈강사youtube.png">
				</a>
			</div>
			<div class="swiper-slide">
				<a class="link" href="https://video.sysout.co.kr/" target='_blank'>
					<img class="add" src="image/video-sysout.png">
				</a>
			</div>
		</div>
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
	</div>
</div>
<div class="container best-review">
	<div class="review-wrapper">
		<div class="cell">
		
		</div>
		<div class="cell">
		
		</div>
		<div class="cell">
		
		</div>
	</div>
</div>




<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







