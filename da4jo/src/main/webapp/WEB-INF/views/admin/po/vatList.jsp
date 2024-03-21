<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<script type="text/javascript">
	
</script>


<style>
.menu-type {
	margin: 0px !important;
}

.menu-list {
	margin: 0px !important;
}

.listArea {
	border: 1px solid #ced3d6;
}
</style>


<script>

</script>

<div class="container container-body container-body-long">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>분기별 부가세 신고자료조회
			</div>
		</div>

		<div class="content content-body">
			<div class="cell listArea">
				<ul class="menu menu-type">
					<li id=""><strong>분기</strong></li>
					<li id=""><strong>부가세 총합</strong></li>
				</ul>
				<c:forEach var="vatListVO" items="${list}">
					<ul class="menu menu-list">
						<li id="">${vatListVO.quater}</li>
						<li id="">${vatListVO.vatTotal}</li>
					</ul>
				</c:forEach>
			</div>
			<form action="vatList">
				<div class="cell searchArea center">
					<select name="year" class="searchSelect">
						<option value="2024" ${param.year == '2024' ? 'selected' : ''}>2024</option>
						<option value="2023" ${param.year == '2023' ? 'selected' : ''}>2023</option>
						<option value="2022" ${param.year == '2022' ? 'selected' : ''}>2022</option>
						<option value="2021" ${param.year == '2021' ? 'selected' : ''}>2021</option>
						<option value="2020" ${param.year == '2020' ? 'selected' : ''}>2020</option>
						<option value="2019" ${param.year == '2019' ? 'selected' : ''}>2019</option>
						<option value="2018" ${param.year == '2018' ? 'selected' : ''}>2018</option>
					</select>
					<button class="btn searchBtn">
						<i class="fa-solid fa-search"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>
</body>
</html>