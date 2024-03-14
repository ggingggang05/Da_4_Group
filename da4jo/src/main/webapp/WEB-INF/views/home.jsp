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
<div class="container">
	<div class="cell center">
		<h1>페이지 내용 자리</h1>
		<img src="/image/로고템플릿.png" width="600px">
	</div>
</div>




<%-- 템플릿 페이지를 불러오는 코드 --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







