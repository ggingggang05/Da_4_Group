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
				<i class="fa-solid fa-pause"></i>탈퇴회원으로 기능을 이용할 수 없습니다.
			</div>
		</div>
		<br>
		<br>
		<div class="content content-body">
			<div class="cell">
				<div class="center">
					<a class="link" href="/member/join">
						<button class="btn">
							<strong>회원가입</strong>
						</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>