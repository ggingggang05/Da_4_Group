<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.info-body {
	position: relative;
}

.content-body {
	padding-left: 100px;
	padding-top: 50px;
}

.info-head {
	margin-bottom: 10px;
	font-size: 20px;
}

#reasonArea {
	height: 300px;
	font-size: 16px;
	padding-bottom: 45px;
	padding-left: 15px;
	width: 500px;
	white-space: pre-wrap;
    word-wrap: break-word;
    resize: none;
}

#charCount {
	color: gray;
	position: absolute;
	right: 290px;
	bottom: 12px;
}

#cancelButton {
	position: absolute;
	right: 272px;
	bottom: -40px;
	border-radius: 50px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#reasonArea').on('input', function() {
			var textLength = $(this).val().length;
			$('#charCount').text(textLength + ' / 300');
			//최대 글자 수 제한
			if (textLength > 300) {
				$(this).val($(this).val().substring(0, 299));
			}
		});
		$(".submint-form").submit(function(e) {
			var confirmation = confirm("정말 주문취소 하시겠습니까?");
			if (confirmation) {
				alert("주문이 취소되었습니다."); 
			} else {
				e.preventDefault();
			}
		});
	});
</script>
<form action="orderCancel" class="submint-form" method="post" autocomplete="off">
	<div class="container container-body">
		<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
		<div class="container inner-container">
			<div class="content content-head">
				<div class="content-head-text">
					<i class="fa-solid fa-user"></i>${poNo}번 주문 반려
				</div>
			</div>
			<div class="content content-body">
				<div class="info-head w-100">
					<strong>주문 반려 사유</strong>
				</div>
				<div class="info-body">
					<input type="hidden" name="poNo" value="${poNo}">
					<textarea name="poAdminComment" id=reasonArea></textarea>
					<div id="charCount">0 / 300</div>
					<div id="cancelButton">
						<button class="btn negative">주문취소</button>
					</div>
				</div>
			</div>

		</div>
	</div>
	</div>
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>