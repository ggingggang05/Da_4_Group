<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.text-box {
	border: 1px solid #d8d8d8;
	background-color: #f8f8f8;
	padding: 10px;
}
</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/document-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>배송 대행지 주소목록
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>미국(OR)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					123 Elm Street, Springfield, OR 12345 USA
				</div>
			</div>
			<div class="cell content-body-title">
				<h5>미국(NJ)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					456 Oak Avenue, Riverside, NJ 67890 USA
				</div>
			</div>
			<div class="cell content-body-title">
				<h5>일본(JP)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					日本千葉県成田市さくら通り789番地
				</div>
			</div>
			<div class="cell content-body-title">
				<h5>영국(UK)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					10 Downing Street, London SW1A 2AA United Kingdom
				</div>
			</div>
			<div class="cell content-body-title">
				<h5>독일(DE)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					123 Hauptstraße, Berlin 10115 Germany
				</div>
			</div>
			<div class="cell content-body-title">
				<h5>스페인(ES)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					456 Calle de la Rosa, Madrid 28001 Spain
				</div>
			</div>
			<div class="cell content-body-title">
				<h5>중국(CN)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					中國上海市人民路789號邮编: 200001
				</div>
			</div>
			<div class="cell content-body-title">
				<h5>호주(AU)</h5>
			</div>
			<div class="cell content-body-text">
				<div class="text-box">
					123 Smith Street, Sydney NSW 2000 Australia
				</div>
			</div>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>