<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>
.title.title-head{
	border-bottom: 1px solid #CAE4FF;
	border-top: 1px solid #CAE4FF;
	background-color: #F2F9FF;
}
</style>
<script type="text/javascript">
$(function () {
	// 현재 URL 가져오기
	var currentUrl = window.location.href;

	// "/"를 기준으로 URL을 분할
	var urlParts = currentUrl.split("/");

	// 포트 번호 이후의 경로 추출
	var path = "/" + urlParts.slice(3).join("/");

	// 모든 <a> 태그 선택
	var links = document.getElementsByTagName("a");

	// 링크를 반복하며 현재 URL과 비교하여 스타일을 적용
	for (var i = 0; i < links.length; i++) {
	    // href 속성을 가져옴
	    var linkUrl = links[i].getAttribute("href");
	    
	    // 현재 URL과 비교
	    if (linkUrl === path) {
	        // 텍스트 색상을 변경
	        links[i].style.color = "#0984e3";
	    }
	}
});
</script>
<div class="container flex-container">
	<div class="container inner-container">
		<div class="title title-head">
			<div class="title-head-text">
				이용안내
			</div>
		</div>
		<div class="title title-body">
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="/document/buying-info" class="link">구매대행 안내</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a href="/document/buying-info" class="link">구매대행 이용안내</a>
					</div>
					<div class="title-body-text">
						<a href="" class="link">구매대행 신청방법</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a href="" class="link">배송대행 안내</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a class="link">배송대행 이용안내</a>
					</div>
					<div class="title-body-text">
						<a class="link">배송대행 신청방법</a>
					</div>
				</div>
			</div>
			<div class="title-body-main">
				<div class="title-body-text">
					<a class="link">통관 안내</a>
				</div>
				<div class="title-body-sub">
					<div class="title-body-text">
						<a class="link">목록/일반통관</a>
					</div>
					<div class="title-body-text">
						<a class="link">관/부가세 안내</a>
					</div>
					<div class="title-body-text">
						<a class="link">품목별 과세율</a>
					</div>
					<div class="title-body-text">
						<a class="link">수입금지품목</a>
					</div>
				</div>
			</div>
		</div>
	</div>