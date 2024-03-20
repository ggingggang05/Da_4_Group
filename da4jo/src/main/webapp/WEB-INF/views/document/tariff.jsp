<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/document-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>품목별 관세율
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>의류 및 패션잡화</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>부가세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>코트/아우터</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>자켓</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>탑&amp;셔츠</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>니트</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>바지</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>스커트</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>슈트</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>트레이닝</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>언더웨어</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>비치웨어</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>슈즈</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>시계</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>주얼리/악세서리</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>양말/스타킹</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>머플러/스카프</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>안경/선글라스</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>모자</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>벨트</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>핸드백</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>지갑</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>파우치</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>장갑</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>바디 및 헤어케어 용품</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>부가세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>구강 위생 제품</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>두발용 제품</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>면도용 제품</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>목욕용품</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>샴푸류</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>반창고, 부착용파스 등</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>의약품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>응급치료 용품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>기초 화장품</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>색조 화장품</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>화장품 도구</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>미용용품</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>식품</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>부가세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>초콜릿 / 캔디</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>소스</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>잼</td>
							<td>30%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>꿀</td>
							<td>20%</td>
							<td>0%</td>
						</tr>
						<tr>
							<td>비스킷, 쿠키, 크래커</td>
							<td>5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>가루믹스(코코아, 율무차)</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>차(TEA) / 커피</td>
							<td>40%</td>
							<td>10%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>유아용품</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>부가세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>기타 관련 용품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>목욕통</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>목욕통(플라스틱)</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>보행기</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>분유</td>
							<td>40%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>이유식</td>
							<td>40%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>수유관련 용품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>안전용품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>유모차</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>유모차 부품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>카시트</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>임산부/영유아 의류</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>젖병류</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>기저귀(종이/면)</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>전자제품</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>부가세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>휴대폰</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>LCD TV</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>LED TV</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>TV</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>노트북/PDA/컴퓨터/컴퓨터 부품</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>캠코더</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>폴라로이드 카메라/필름 카메라</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>디지털 카메라</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>카메라 렌즈</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>가습기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>MP3</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>가전기기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>면도기/모발제거기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>믹서기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>오븐/쿠커/그릴러/로우스터</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>재봉기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>전기다리미/난방기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>전동칫솔</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>커피메이커</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>토스터</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>헤어드라이기/세팅기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>공기청정기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>휴대폰충전기</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>건강보조식품</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>부가세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>다이어트제품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>영양제류</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>허브</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>비타민류</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>기타</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>부가세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>펜</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>잉크</td>
							<td>6.5%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>골프채</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>행글라이더</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>수상스키</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>커피머신</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>RC</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>유리 식기 종류</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>자동차 부품</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>전등</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>음향 장비/악기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>레고/블록 장난감</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>기타 장난감</td>
							<td>10%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>텐트</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>낚시대</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>동물사료</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>방독면</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>액션피규어</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>자전거(부품)</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>페인트</td>
							<td>7%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>금괴(골드바)</td>
							<td>3%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>담배</td>
							<td>40%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>도자기</td>
							<td>8%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>도자기(골동품-100년이상)</td>
							<td>0%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>우산</td>
							<td>13%</td>
							<td>10%</td>
						</tr>
						<tr>
							<td>카페트</td>
							<td>10%</td>
							<td>10%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="content content-body">
			<div class="cell content-body-title">
				<h5>기타</h5>
			</div>
			<div class="cell content-body-text">
				<table class="table" border="1" bordercolor="#d8d8d8">
					<colgroup>
						<col width="160" />
						<col />
					</colgroup>
					<thead bgcolor="#f8f8f8">
						<tr>
							<th>항목</th>
							<th>관세율</th>
							<th>특소세</th>
							<th>교육세</th>
							<th>농특세</th>
							<th>부가세</th>
							<th>주세</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>오락용품(사행성)</td>
							<td>8%</td>
							<td>20%</td>
							<td>30%</td>
							<td>10%</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>공기 조절기 관련</td>
							<td>8%</td>
							<td>20%</td>
							<td>30%</td>
							<td>-</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>영사투방식TV등</td>
							<td>8%</td>
							<td>10%</td>
							<td>30%</td>
							<td>-</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>녹용/로얄젤리</td>
							<td>20%</td>
							<td>7%</td>
							<td>30%</td>
							<td>-</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>향수</td>
							<td>8%</td>
							<td>7%</td>
							<td>30%</td>
							<td>10%</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>보석/귀금속 관련</td>
							<td>8%</td>
							<td>20%</td>
							<td>30%</td>
							<td>-</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>고급카메라 관련</td>
							<td>8%</td>
							<td>20%</td>
							<td>30%</td>
							<td>-</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>고금모피 관련</td>
							<td>16%</td>
							<td>20%</td>
							<td>30%</td>
							<td>10%</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>고금 융단 등</td>
							<td>10%</td>
							<td>20%</td>
							<td>30%</td>
							<td>-</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>고급 가구 등</td>
							<td>8%</td>
							<td>20%</td>
							<td>30%</td>
							<td>1%</td>
							<td>10%</td>
							<td>-</td>
						</tr>
						<tr>
							<td>술(위스키)</td>
							<td>20%</td>
							<td>-</td>
							<td>30%</td>
							<td>10%</td>
							<td>10%</td>
							<td>72%</td>
						</tr>
						<tr>
							<td>술(와인)</td>
							<td>15%</td>
							<td>-</td>
							<td>10%</td>
							<td>-</td>
							<td>10%</td>
							<td>30%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>