<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.asterisk{
	font-size: 8px;
	vertical-align: top !important;
}
</style>


<form action="join" method="post" autocomplete="off">
	<div class="container w-800">
		<div class="cell center">
			<h1>구매대행 신청</h1>
		</div>
		<div class="cell">
			아이디<label><i class="fa-solid fa-asterisk red asterisk"></i></label> <input type="text" name="memberId" class="tool w-100"
				placeholder="아이디">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">아이디는 소문자 시작, 숫자 포함 8~20자로 작성하세요</div>
			<div class="fail2-feedback">이미 사용중인 아이디입니다</div>
		</div>
		<div class="cell">
			<!-- type="password"변경 전 -->
			비밀번호*<input type="text" name="memberPw" class="tool w-100"
				placeholder="비밀번호">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">비밀번호에는 반드시 영문 대,소문자와 숫자, 특수문자가 포함되어야
				합니다</div>
		</div>
		<div class="cell">
			비밀번호 확인 *<input type="text" id="pw-reinput" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">비밀번호가 일치하지 않습니다</div>
			<div class="fail2-feedback">비밀번호를 먼저 입력하세요</div>
		</div>
		<div class="cell">
			한국이름*<input type="text" name="memberNameKor" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">한글 이름을 입력해주세요</div>
		</div>
		<div class="cell">
			영어이름<input type="text" name="memberNameEng" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 영어 이름입니다.</div>
		</div>

		<div class="cell">
			이메일*<input type="text" name="memberEmail" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">이메일 형식 오류</div>
			<div class="fail2-feedback">사용중인 이메일입니다</div>
		</div>


		<div class="cell">
			연락처1*<input type="text" name="memberContact1" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">연락처 형식 오류</div>
		</div>

		<div class="cell">
			연락처2<input type="text" name="memberContact2" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 연락처입니다.</div>
		</div>
		<div class="cell">
			생년월일<input type="text" name="memberBirth" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 형식입니다.</div>
		</div>

		<div class="cell">
			통관번호<input type="text" name="memberClearanceId" class="tool w-100">
			<div class="success-feedback">
				<label><i class="fa-solid fa-circle-check"></i></label>
			</div>
			<div class="fail-feedback">잘못된 형식입니다.</div>
		</div>

		<div class="cell">
			<input type="text" name="memberZipcode" class="tool w-20"
				placeholder="우편번호">
		</div>
		<div class="cell">
			<input type="text" name="memberAddress1" class="tool w-50"
				placeholder="기본주소">
		</div>
		<div class="cell">
			<input type="text" name="memberAddress2" class="tool"
				placeholder="상세주소">
		</div>
		<div class="cell">
			<button>가입하기</button>
		</div>

	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>