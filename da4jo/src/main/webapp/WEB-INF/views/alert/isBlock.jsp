<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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
</style>


<br>
<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/document-sidebar.jsp"></jsp:include>
	<!-- 내용자리 -->
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i>차단된 회원으로 해당 기능을 이용할 수 없습니다.
			</div>
		</div>
		<br>
		<br>
		
	</div>
</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>