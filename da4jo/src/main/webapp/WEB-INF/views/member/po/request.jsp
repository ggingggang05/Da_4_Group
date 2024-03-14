<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- jquery cdn -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<style>
.asterisk {
	font-size: 8px;
	vertical-align: top !important;
}
/* ================== 구매대행 신청서 : buy_write.tpl ================== */
#agency_buy_write fieldset {
	width: 100%;
}

#agency_buy_write .top-guide {
	border-top: 2px solid #999;
	border-bottom: 3px solid #e6e6e6;
	padding-top: 25px;
	padding-bottom: 20px;
	line-height: 180%;
	margin-bottom: 50px;
}

#agency_buy_write .top-guide h3 {
	font-size: 18px;
	font-weight: normal;
	margin: 0 0 11px;
	background: url("../imgs/write_top_guide_bulit.gif") no-repeat 0 center;
	line-height: 130%;
	padding: 3px 0 7px 40px;
}

#agency_buy_write .document_box {
	overflow: auto;
	height: 170px;
	margin-bottom: 7px;
	padding: 10px;
	line-height: 150%;
	border: 1px solid #ddd;
	background: #fff;
}

#agency_buy_write .step-agreement {
	padding: 24px 24px 0;
	border: 1px solid #e0e0e0;
	background: #fbfafa;
	margin-bottom: 50px;
}

#agency_buy_write .step-agreement .checkbox {
	margin-top: 15px;
	margin-bottom: 15px;
}

#agency_buy_write ul.goods {
	overflow: hidden;
	margin: 0;
	padding: 0;
	*zoom: 1;
	border-top: 1px solid #ddd;
	padding-top: 18px;
}

#agency_buy_write ul.goods li {
	list-style: none;
	*zoom: 1;
	border-bottom: 1px solid #ddd;
	margin-bottom: 18px;
	padding-bottom: 18px;
}

#agency_buy_write ul.goods li:after {
	display: block;
	clear: both;
	content: "";
}

#agency_buy_write .document_box {
	overflow: auto;
	height: 170px;
	margin-bottom: 7px;
	padding: 10px;
	line-height: 150%;
	border: 1px solid #ddd;
}

#agency_buy_write .step-country {
	margin-bottom: 50px;
}

#agency_buy_write .step-country .box {
	overflow: hidden;
	padding: 30px 0 10px;
	border: 1px solid #ddd;
	margin-bottom: 10px;
}

#agency_buy_write .step-country .box ul {
	overflow: hidden;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	text-align: center;
	*zoom: 1;
}

#agency_buy_write .step-country .box li {
	overflow: hidden;
	display: inline-block;
	*display: inline;
	vertical-align: top;
	margin: 0;
	padding: 0 13px;
	list-style: none;
	zoom: 1;
}

#agency_buy_write .step-country .box li .thumbnail {
	border: none;
	box-shadow: none;
	padding: 0;
	margin-bottom: 0;
}

#agency_buy_write select.currency {
	float: right;
}

#agency_buy_write .button_area {
	border-top: 1px solid #ddd;
	padding-top: 20px;
}

#agency_buy_write a.type-add {
	width: 113px;
	color: #fff;
	border-color: #c00;
	background-color: #c00;
}

#agency_buy_write .goodsname-trans {
	text-decoration: none;
	background-color: #c00;
	color: #fff;
	padding: 2px 4px;
	margin-left: 5px;
}
</style>
<div id="agency_buy_write" class="section container center w-900">
	<div class="wrap">
		<h2>구매대행 신청</h2>
		<div class="area top-guide">
			<h3>해외 온라인 사이트의 가입, 해외결제등의 절차가 어렵고 번거로우시다면, 구매대행 서비스를 이용해 주세요.</h3>
			구매대행시 주의사항을 확인 및 동의하신 후 하단의 신청폼에 상품정보를 입력하고 신청해 주세요!
		</div>

		<div class="box_form">
			<form name="form_agency_buy_write" id="form_agency_buy_write"
				method="post" action="/member/po/request">
				<h3>신청서 작성시 유의사항</h3>

				<div class="area step step-agreement w-100">
					<div class="document_box left">
						<p>구매대행이란?</p>
						<p>언어나 결제 카드 등의 문제로 직접 구매가 어려운 해외 쇼핑몰에서의 구매부터 배송까지 대행해 드리는
							서비스를 말합니다.</p>
						<p></p>
						<p>
							<strong>※ 구매대행 신청서 작성방법</strong>
						</p>
						<p>- 구매대행 가능 국가는 공지사항 및 이용안내를 참조해주세요.</p>
						<p>- 구매대행 신청서 작성 전에 꼭 수입금지 품목을 확인하세요.</p>
						<p>- 구매대행 신청서 작성시 구매요청 사이트가 정식 사이트인지 꼭 확인 부탁 드립니다.</p>
						<p>정식 사이트나 공식 홈페이지가 아닌 경우 물건 미발송, 가품 등이 배송되는 등 피해가 발생 할 수
							있습니다.</p>
						<p>다사조는 고객님의 신청서 작성대로 구매를 대행해 드리기 때문에 사이트에 대한 확인까지 불가하며 이로 인해
							피해가 발생 할 경우 보상의 책임이 없음을 말씀드립니다.</p>
						<p>- 구매대행 결제는 2차례에 걸쳐 진행되며 결제내용과 결제시점은 아래와 같습니다.</p>
						<p>1차결제 : 현지상품가 + 현지배송비 + 구매대행 수수료 10% (고객님의 구매요청을 통해 담당자가
							구매승인처리, 결제시점 : 다사조 담당자의 구매승인시)</p>
						<p>2차결제 : 국제배송비 결제 + 구매금액 변동으로 인한 추가비용 등 (결제시점 : 해당국가 현지 물류센터에
							상품이 도착한 후)</p>
						<p>- 구매대행 신청 후 상품가가 책정되면 현지 상품가, 쇼핑몰 수수료, 현지 배송비의 선결제가 필요합니다.</p>
						<p>
							<strong>※ 견적 드렸던 금액과 별개로 사이트 구매 이 후 현지 배송비 또는 현지 세금 등이
								발생할 수 있습니다.</strong>
						</p>
						<p>
							<strong> 이 경우 쇼핑몰측에서 미리 안내 받는 것이 아니기 때문에 미리 안내 드릴 수 없으며
								추가 금액이 발생할 수도 있습니다.</strong>
						</p>
						<p>
							<strong> 추가 금액 결제 원치 않으시는 경우 취소 가능 유무를 확인하여 안내 드릴 수는 있으나
								이에 따른 현지 반송비 및 취소 수수료 등의 금액이 추가적으로 발생할 수 있습니다.</strong>
						</p>
						<p>- 적용할 수 있는 할인코드는 반드시 명시해 주시고 미기재로 인한 손해는 다사조에서 책임지지 않습니다.</p>
						<p>- 고객님의 지정 아이디로 구매진행은 불가하며, 모든 구매는 다사조가 해당사이트에 가입하여 다사조의
							아이디로만 진행 가능합니다.</p>
						<p>- 고객님께서 신청하신 물품이 "다사조" 또는 해외 다른 곳에서 같은 날 항공편으로 도착되거나, 세관에서
							합산과세로 판단할 경우, 모든 상품의 금액이 모두 합산되어 세금이 발생합니다.</p>
						<p>이로 인해 발생되는 합산과세 비용은 고객님의 부담입니다.</p>
						<p>- 합산과세가 걱정되시는 경우에는 [출고보류] 기능을 활용하시어 합산되지 않도록 순차 출고를 하시도록 권해
							드립니다.</p>
						<p>다사조는 배송대행지로 과세에 대해서는 일절 개입이 불가하며 과세되는 경우 책임을 져 드릴 수 없으므로 꼭
							주의를 부탁 드립니다.</p>
						<p>- 전자제품은 상품별 1인당 1개까지 통관이 가능하기 때문에, 1개씩 구매요청 해 주시거나 여러 개를
							주문해 주셨을 경우에는 신청서를 나누어 순차적으로 출고하여 통관이 겹치지 않게 주의하여 주세요.</p>
						<p>동시 통관 시 1개를 제외한 나머지는 폐기 될 수 있으며, 그에 따른 수수료 및 폐기되는 제품 비용은
							환불되지 않는 점 참고 부탁 드립니다.</p>
						<p>- 구매가 진행된 이후 신청서 취소 및 상품 정보 수정은 불가하오니 신청서 작성시 주의 부탁 드립니다.</p>
						<p>단, 출고 전까지 배송정보 수정은 가능합니다.</p>
						<p>- 동일한 쇼핑몰의 상품만 한번에 신청 가능합니다.</p>
						<p>- 동일한 쇼핑몰의 상품 최대 10개까지 한번에 신청 가능합니다.</p>
						<p>- 신청 시 사이즈, 색상 등 옵션사항을 정확히 기재하지 않을 경우 재확인 등으로 인해 시간이 지체될 수
							있으므로 정확한 신청이 필요합니다.</p>
						<p>- 신청서 등록 시점과 구매 시점의 재고는 달라질 수 있고, 이로 인해 구매신청이 취소처리 될 수
							있습니다.</p>
						<p></p>
						<p>
							<strong>※ 유의사항</strong>
						</p>
						<p>- 구매대행 신청서 작성시 정확한 상품주소(URL)을 정확히 입력해주시기 바랍니다.</p>
						<p>온라인 구매대행 특성상 고객님이 입력해주신 상품주소로 제품을 구매하며 제품검수는 인보이스상 색상, 사이즈
							등 기본검수만 진행해드립니다.</p>
						<p>정밀 검수 신청 시 일반 검수 외에 고객님이 요청사항 등을 반드시 메모에 기재해 주시기 바랍니다.</p>
						<p>메모에 남겨져 있지 않은 특이 사항에 대해선 책임지지 않으니 유의 부탁 드립니다.</p>
						<p>(상품별검수규칙)</p>
						<p>
							* 의류, 신발, 가방 등의 재봉불량, 구멍, 부속재 누락, 오염유무는 정밀검수 선택 시에만 확인가 능합니다.<br />*
							이불, 침낭, 텐트, 커튼 등 부피가 큰 제품은 정밀검수 진행이 불가능합니다.<br />* 전자제품은 내부 구성품
							확인 및 작동유무에 대한 확인이 불가능합니다.<br />* 제품을 착용해보거나 작동해보는 검수요청 서비스는 지원되지
							않습니다.<br />* 완포장 박스로 도착하는 유모차, 카시트, 작동완구 등은 오픈하지 않으므로 내부 구성품 확인
							및 제품하자나 파손여부에 대한 검수가 불가능합니다.<br />* 가구, 조명 류 등 일부 생활용품의 스크래치,
							작동여부, 내부 구성품은 확인이 불가능합니다.
						</p>
						<p>
							<br /> <strong>※ 구매대행 환불/취소/반품</strong>
						</p>
						<p>- 구매대행 신청 건은 구매 시점에 해당 쇼핑몰의 재고가 소진되었을 때 결제하신 금액 전체를 환불해
							드립니다.</p>
						<p>- 현재 쇼핑몰에서 주문완료가 된 이후에는 취소처리가 불가능 하나</p>
						<p>부득이한 사정으로 취소처리를 원하시는 경우 판매처에 반품/환불 가능 여부 확인 후 연락 드리도록
							하겠습니다.</p>
						<p>배송이 시작되어 반품을 해야 하는 경우 국가별로 책정된 다사조 반품 수수료와 현지 내 반품 택배비(무료
							리턴이 아닌 경우)가 청구됩니다.</p>
						<p>이때 구매대행 수수료는 환급되지 않습니다.</p>
						<p>만약 판매처에서 반품/환불이 불가한 경우 주문취소는 불가하오니 이점 유의해 주시기 바랍니다.</p>
						<p>- 현지 쇼핑몰에서 주문이 취소처리가 될 경우 결제하신 금액의 전체를 환불해 드립니다.</p>
						<p>
							<br /> <strong>※ 필수사항</strong>
						</p>
						<p>- 구매대행을 요청하시는 물품의 통관 가능 여부는 고객님께서 미리 관세청(125) 및 세관에 문의하신 후
							구입 요청을 해 주시길 부탁 드립니다.</p>
						<p>- 통관이 안 되는 이유로 반송 및 폐기처분 시 다사조는 책임을 지지 않습니다.</p>
						<p>- 수입통관 반입 금지 성분 관련 반입 여부 관련 상담은 농림축산 검역본부 인천공항 지역본부
							화물검역과(032-740-2625)로 문의해 주시기 바랍니다.</p>
						<p>- 구매대행 가능한 사이트인지 여부는 구매신청을 해주시면 각 국가의 담당자가 확인후 개별 안내 드리고
							있습니다.</p>
						<p>- 일본의 경우 메루카리 / 라쿠마 (프릴) 등은 사이트의 특성상 구매대행 진행이 불가하며, 라쿠텐 상품은
							일본(선박) 센터에서만 구매진행이 가능하오니 일본(선박)센터를 이용 부탁드립니다.</p>
					</div>
					<div class="checkbox text-right">
						<label><input name="poAgree" type="checkbox"
							class="type_checkbox" value="Y" /> 위의 주의사항을 모두 확인하였으며, 위 사항에
							동의합니다.</label>
					</div>
				</div>


				<h3>구매대행지 선택</h3>
				<div class="area step step-country">
					<div class="box">
						<ul>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="오리건" data-currency="USD" checked />
										오리건 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="뉴저지" data-currency="USD" /> 뉴저지 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="영국" data-currency="GBP" /> 영국 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="독일" data-currency="EUR" /> 독일 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="일본(항공)-오사카" data-currency="JPY" />
										일본(항공)-오사카 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="중국(항공)" data-currency="CNY" />
										중국(항공) 
								</div>
							</li>
							<br>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="스페인" data-currency="EUR" /> 스페인 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="호주" data-currency="AUD" /> 호주 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="일본(선박)-후쿠오카" data-currency="JPY" />
										일본(선박)-후쿠오카 
								</div>
							</li>
							<li>
								<div class="info radio">
									<label><input name="poCountry" type="radio"
										class="type_radio" value="중국(선박)" data-currency="CNY" />
										중국(선박) 
								</div>
							</li>
						</ul>
						<script>
							$(function() {
								$('input[name=poCountry]').on('click',function() {
									var currency = $(this).data('currency');
									// 선택된 국가의 통화를 가져와서 변수에 저장
									console.log('선택된 통화: ' + currency);
									// 선택된 통화를 콘솔에 출력 (이 부분은 필요에 따라 백엔드로 전달하거나 다른 작업을 수행할 수 있음)
									$('#Form').append('<input type="text" name="currency" value="' + currency + '">');		
								});
							});
						</script>
					</div>

					<div class="display-china color-red" style="display: none;">※
						중국 구매대행 상품과 중국 배송대행 상품의 합배송은 불가능 합니다.</div>
					<div class="display-japan color-red" style="display: none;">※
						일본 구매대행 불가 쇼핑몰 : 메루카리, 라쿠마(프릴), 오타마트 등 어플기반 사이트, 토호 애니매이션, 아미아미,
						cos, Levi's 등</div>
				</div>

				<h3>
					구매대행 상품정보 입력
					<p class="right red " style="font-size: 13px; margin: 5px 0 0;">
						단가는 상품 1개의 개별 가격을 의미합니다.</p>
				</h3>
				<div class="container w-800 left" style="border: solid 1px;">
					<div class="cell">
						구매자(한글)<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poNameKor" class="tool w-100"
							placeholder="한글이름">
					</div>
					<div class="cell">
						구매자(영문)<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poNameEng" class="tool w-100"
							placeholder="영어이름">
					</div>
					<div class="cell">
						통관고유번호<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poClearanceId" class="tool w-100"
							placeholder="P로시작">
					</div>
					<div class="cell">
						상품이름(영문)<label><i
							class="fa-solid fa-asterisk red asterisk"></i></label> <input type="text"
							name="poItemEngName" class="tool w-100" placeholder="영어로 입력해주세요">
					</div>
					<div class="cell">
						구매링크<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poLink" class="tool w-100"
							placeholder="URL을 입력하세요">
					</div>
					<div class="cell">
						<!-- 최소수량 1개에서 최대 100개로 설정해둠 -->
						구매수량<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="number" name="poQty" class="tool w-100" value="1"
							min="1" max="100">
					</div>
					<div class="cell">
						옵션/색상 <input type="text" name="poItemOption1" class="tool w-100"
							placeholder="ex)red">
					</div>
					<div class="cell">
						옵션/사이즈 <input type="text" name="poItemOption2" class="tool w-100"
							placeholder="ex)라지">
					</div>
					<div class="cell">
						기타요청사항 <input type="text" name="poItemOption3" class="tool w-100"
							placeholder="ex)고양이 프린팅된걸로 부탁드려요">
					</div>
					<div class="cell">
						금액(외화) <input type="text" name="poFx" class="tool w-100"
							placeholder="">
					</div>
					<div class="cell">
						연락처<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poContact" class="tool w-100"
							placeholder="전화번호">
					</div>
					<div class="cell">
						우편번호<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poZipcode" class="tool w-100"
							placeholder="우편번호">
					</div>
					<div class="cell">
						기본주소<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poAddress1" class="tool w-100"
							placeholder="기본주소">
					</div>
					<div class="cell">
						상세주소<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poAddress2" class="tool w-100"
							placeholder="상세주소">
					</div>
					<div class="cell">
						배송요청사항<label><i class="fa-solid fa-asterisk red asterisk"></i></label>
						<input type="text" name="poDcomment" class="tool w-100"
							placeholder="배송요청사항을 입력하세요(ex:경비실에 맡겨주세요)">
					</div>
					<div class="button_area text-center">
						<button type="submit" class="btn">신청서 작성하기</button>
					</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>