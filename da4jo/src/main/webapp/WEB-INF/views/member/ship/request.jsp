<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- jquery cdn -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.asterisk {
	font-size: 8px;
	vertical-align: top !important;
}

#agency_buy_write fieldset {
	width: 100%;
}

#agency_buy_write .top-guide {
	border-bottom: 1px solid #e6e6e6;
	padding-top: 25px;
	padding-bottom: 20px;
	line-height: 180%;
	margin-bottom: 80px;
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
	background: #fff;
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
	background-color: #fff;
}

#agency_buy_write .step-country .box {
	overflow: hidden;
	padding: 30px 0 20px;
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

.info-head {
	font-size: 18px;
	text-align: left;
	padding: 10px 0 12px 20px;
	color: #7B8E9C;
	border-bottom: 1.5px solid #7B8E9C;
}

.line {
	border: none;
	border-bottom: 1px solid #E6EFF2;
}

.btn {
	background-color: white;
}

.btn:hover {
	filter: brightness(1);
}

.sfont {
	font-size: 14px;
}
</style>
<script>
	$(function() {
		$(".btn-address-search").click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$("[name=shipSvcZipcode]").val(data.zonecode);
					$("[name=shipSvcAddress1]").val(addr);

					// 커서를 상세주소 필드로 이동한다.
					$("[name=shipSvcAddress2]").focus();
				}
			}).open();
		});

		$(".btn-address-clear").click(function() {
			$("[name=shipSvcZipcode]").val("");
			$("[name=shipSvcAddress1]").val("");
			$("[name=shipSvcAddress2]").val("");
		});
	});

/* 	$(".check-form").submit(function() {
		//$(this).find("[name], #pw-reinput").blur();
		//$(this).find(".tool").blur();//모든 창

		//입력창 중에서 success fail fail2가 없는 창
		$(this).find(".tool").not(".success, .fail, .fail2").blur();
		return state.ok();
	}); */
</script>
<script type="text/javascript">
$(function() {
    var state = {
        // 필수항목 : true 선택항목 : false
        shipSvcAgree: true,
        shipSvcCountry: true,
        shipSvcNameKor: true,
        shipSvcNameEng: true,
        shipSvcClearanceId: true,
        shipSvcContact: true,
        shipSvcZipcode: true,
        shipSvcAddress1: true,
        shipSvcAddress2: true,
        shipSvcItemEngName: true,
        shipSvcItemCategory: true,
        shipSvcItemOption1: false,
        shipSvcFx: true,
        shipSvcQty: true,
        shipSvcLink: true,
        shipSvcDcomment: false,
        shipSvcCurrency: true,
        shipSvcUserShipper: true,
        shipSvcUserAwbNumber: true,
    };

    // 버튼 클릭 이벤트 리스너 추가
    $(".btn-click").click(function(e) {
        e.preventDefault(); // 폼 제출 방지

        // 필수 항목이 모두 입력되었는지 확인
        for (var key in state) {
            if (state.hasOwnProperty(key) && state[key] === true) {
                var value = $("input[name='" + key + "']").val();
                if (value === "") {
                    alert("모든 항목을 입력해야 합니다.");
                    return false;
                }
            }
        }

        // 모든 필수 항목이 입력되었으면 폼 제출
        $("form").submit();
    });

    // form 전송
    $(".check-form").submit(function() {
        // 필요한 경우 추가 검증을 수행할 수 있습니다.
        return true;
    });
});

</script>
<br>
<br>
<div id="agency_buy_write" class="section container center w-900">
	<div class="wrap">
		<div class="content content-head">
			<div class="content-head-text">배송대행 신청</div>
		</div>
		<div class="area top-guide">
			<h3>
				신청서는 <span class="color-red">상품을 구매한 후 바로 작성</span>해 주십시오!
			</h3>
			<strong>배송대행 신청서를 미작성하거나, 상품도착후에 작성시 다음과 같은 문제가 발생하게 됩니다.</strong><br />
			- 주문 후에 신청서 작성이 안되면, 배송처리가 지연되는 상황이 발생합니다.<br /> - 신청서가 작성되지 않은 주문건은
			상품의 확인이 불가능합니다.<br /> - 상품도착후에 신청서를 작성하신 경우에는 반드시 트랙킹번호를 입력하시고,
			게시판으로 입고 확인요청을하시기 바랍니다.
		</div>
	</div>
	<div class="cell w-100">
		<a class="link" href="/document/delivery-step"><button type="button" class="btn">배송대행 신청방법 보러가기</button></a>
	</div>
	<br><br>
	<div class="box_form">
		<form name="form_agency_buy_write" id="form_agency_buy_write" class="check-form"
			method="post" action="/member/ship/request">
			<div class="content content-head" style="border-bottom: none;">
				<div class="content-head-text">신청서 작성시 유의사항</div>
			</div>

			<div class="area step step-agreement w-100">
				<div class="document_box left">
					<ol>
						<li>신청에 기재된 사항은 수정없이 그대로 세관 수입신고 자료로 전송되니 꼼꼼히 검토 후 저장해주세요.
							신청서가 허위로 기재되어 발생되는 모든 문제는 신청서를 작성한 회원님이 책임을 지셔야 합니다.</li>
					</ol>
					<ol start="2">
						<li>한 쇼핑몰에서 한번에 결제한 주문이라도 배송신청서에는 모든 트래킹번호가 입력되어야 하며, 실물검수,
							합배송등 부가서비스의 요금 청구도 트래킹번호 단위로 부과됩니다.</li>
					</ol>
					<ol start="3">
						<li>배송신청서 내의 필요한 정보 부재로 의해 발생하는 불이익은 "다사조"에서 책임지지 않습니다</li>
					</ol>
					<ol start="4">
						<li>신청서 등록 시 트래킹번호를 꼭 기재 하셔야 합니다. 구매처에서 발송된 트래킹번호가 확인되지 않는 경우
							고객지원센터와 상담 부탁드립니다. 제품 이미지(사진) URL 이 등록되지 않아 정확한 제품 확인이 안 될 경우 출고가
							지연되거나 수량만 확인하여 출고될 수 있습니다.</li>
					</ol>
					<ol start="5">
						<li>다사조의 모든 상품은 도착하는 상품에 작성된 사서함 번호와, 신청서 안에 입력된 현지 운송장 번호
							(트래킹번호) 로 고객님의 상품을 확인하여 입고 작업을 진행합니다.<br />신청서를 작성하지 않은 상태로
							물류센터에 상품이 먼저 도착하거나, 트래킹번호가 누락된경우, 트래킹번호가 없는 배송방법인 경우에는 상품이
							'노데이터'로 등록 됩니다.우편 / 기타 트래킹 번호를 제공하지 않는 배송방법인 경우 트래킹 번호 없이 도착할 수
							밖에 없기 때문에 노데이터 수수료가 발생하게 되오니 이 점 참고 부탁드리겠습니다.<br />(운송장을 알려주지 않는
							것이 다사조의 노데이터 별도 업무 발생과 무관하며, 상품을 구매하고 발송정보를 알려주지 않는 것은 판매처의 책임이
							있는 부분이기 때문입니다.)<br />노데이터로 물품이 등록될 경우, 노데이터 관리 비용이 발생하고, 입고처리와
							발송 모든 단계에서 지연이 발생할 수 있습니다.</a>
						</li>
					</ol>
					<ol start="6">
						<li>배송신청서 내의 기재된 정보 및 추가 요청사항은 상품이 일부라도 입고잡힌 후부터는 수정이 되지
							않습니다.</li>
					</ol>
					<ol start="7">
						<li>포장보류 된 입고 작업이 모두 완료된 신청서는 포장보류 해지 시 포장대기건으로 전환되며 추가로 다른
							신청서와 묶음배송을 신청하거나, 묶음 배송 건을 일반배송으로 나눠서 원복하는 것이 불가능합니다.</li>
					</ol>
					<ol start="8">
						<li>신청서에 트래킹번호 단위로 신청된 상품은 별도의 요청이 없는 경우 센터기준에 따라 무료 합배송 단위까지
							무료로 합배송 처리됩니다. 센터별 무료 합배송 기준을 넘는 수량의 트래킹번호를 신청하시는 경우 별도의 합배송 요금이
							부과됩니다.</li>
					</ol>
					<ol start="9">
						<li>여러 쇼핑몰에서 결제하고 주문한 여러 개의 상품들이라도 배송신청서 하나에 모두 등록하시면, 상품들이
							나뉘어 발송되어도 한 박스로 재포장 후 배송비를 책정합니다. 합배송을 원하시는 경우 모든 오더건을 한 신청서에
							작성해주세요.</li>
					</ol>
					<p>10. 신청서가 미리 작성되어 있더라도 트래킹번호가 빈칸으로 작성된채 입고되면, 노데이터로 처리되어
						'노데이터 수수료'가 청구될 수 있습니다.</p>
					<p>11. 전자제품의 경우, 미개봉 검수로 진행됩니다. 상품 오리지널박스에 표시된 상품 정보와 신청서 정보
						매칭후 배송이 진행됩니다.</p>
					<p>따라서, 상품의 불량 / 파손 / 오작동 등의 보상은 불가합니다.</p>
					<p></p>
					<p>
						<strong> [배송비책정관련 안내사항]</strong>
					</p>
					<ol>
						<li>배송비는 "다사조" 제휴된 해외물류센터에 상품이 도착한 후에 책정되며, 배송비 결제가 이루어져야 제품이
							발송됩니다</li>
					</ol>
					<ol start="2">
						<li>국제 운송료는 "다사조" 해외현지 센터에서 창고 입고 검수 시 측정한 중량과 부피를 근거로 청구되며,
							실 무게와 부피 무게 산정 값 중 더 큰 무게를 기준으로 청구됩니다.</li>
					</ol>
					<ol start="3">
						<li>무게 기준은 창고지에 따라 파운드 또는 kg이 각각 사용될 수 있으며, 무게가 소수점일 경우 올림
							합니다. (예: 1.1 lb = 2 lb)</li>
					</ol>
					<ol start="4">
						<li>과세가격(구입금액기준)이 $150을 초과하는 배송 건은 통관 시 관부가세와 수입통관수수료가 발생하며
							납부 하셔야 배송이 완료됩니다.</li>
					</ol>
					<p>(미국의 경우 목록통관이 가능한 제품 은 200불까지 면세입니다.)</p>
					<ol start="5">
						<li>상품이 "다사조" 물류센터로 도착 시 신청서 확인이 되어야 입고처리되며, 센터별로 무료보관일수가 지난
							배송신청건의 경우 초과일부터 하루마다 창고 보관료가 청구됩니다.<br />장기간 미처리된 건은에는 센터별 기준에
							따라 일정기간 지난 후 폐기처리 될 수 있습니다.
						</li>
					</ol>
					<ol start="6">
						<li>배송비 결제 시 창고 보관료 발생분까지 함께 결제 하셔야 합니다.</li>
					</ol>
					<ol start="7">
						<li>상품의 종류와 금액에 따라 통관 시 별도의 통관수수료가 발생할 수 있고, 검역수수료, 카톤분할수수료,
							폐기 수수료, 반송비용 등의 추가 비용이 발생할 수 있습니다. 부가 서비스 비용은 "다사조" 국제 운송료에 포함되어
							있지 않습니다.</li>
					</ol>
					<p></p>
					<p>
						<strong> [기타주의사항]</strong>
					</p>
					<ol>
						<li>각 항공/선박 사에서 선적 불가한 상품 (화기위험상품, 폭발위험상품 등) 은 선적이 불가하여 폐기,
							혹은 판매처로 반품이 필요합니다.<br />또한, 세관에서 수입이 금지되어 있는 상품은 한국으로 선적(출고)
							되더라도 국내 통관이 불가능합니다. 이로 인한 불이익은 "다사조"에서는 책임지지 않습니다.
						</li>
						<li>항공편 도착 지연으로 인해 발생되는 문제는 "다사조"에서 책임지지 않습니다.</li>
						<li>깨지기 쉬운 유리/도자기/타일/예술품/가구/플라스틱등의 제품은 배송중 파손시 보상받을 수 없습니다.
							또한, 액체상품과 의류(천으로 된 상품)는 합배송이 불가합니다. 해당 상품의 배송중 발생하는 불이익은 "다사조"에서
							책임지지 않습니다.</li>
						<li>국내 통관중 및 국내 배송중 상품이 파손 된 경우, 각 세관 및 국내 운송사의 보상기준에 따라 보상처리
							됩니다.</li>
						<li>이베이 또는 기타 중고물품 취급 사이트의 상품일 경우 파손된 상품이라도 배송이 진행되며 이에 따른 문제
							발생시"다사조"에서는 책임을 지지 않습니다.</li>
						<li>고객님께서 신청하신 물품이 "다사조" 또는 해외 다른 곳에서 같은 날 항공편으로 도착되거나, 세관에서
							합산과세로 판단할 경우, 모든 상품의 금액이 모두 합산되어 세금이 발생합니다. 이로 인해 발생되는 합산과세 비용은
							고객님의 부담입니다.</li>
						<li>센터 입고 후 무게가 측정되어 배송비 결제 대기 중인건의 경우 반품신청, 추가 합배송, 무게측정취소
							요청, 배송주소 연락처변경, 수취인변경 등의 요청사항은 처리가 불가능합니다. 배송비 결제대기중인 상품은 항공기 적재
							전 단계로 물류관리가 되기 때문에 상품을 확보하여 요청사항을 처리할 수가 없습니다.</li>
						<li>미국에서 2,500불 이상의 상품이 (송장 1건당입니다) 출고되는 경우 AES 수출신고가 의무
							사항입니다. 이 경우 미국 내 사업자로 EIN넘버가 꼭 있어야 수출신고가 가능합니다. 미국 내 사업자등록이 없으신
							경우는 2,500이상의 상품은 출고 할 수 없으신 점 참고 부탁드립니다.</li>
						<li>출고일은 고객님께서 순차적으로 배송비를 결제하시거나, 출고보류(해제)를 통해 직접 조절해 주셔야
							합니다.<br />동시출고 및 신청서 금액 미확인으로 인한 관부가세 발생건에 대해서는 다사조에서 책임지지 않으니
							유의하시기 바랍니다.
						</li>
					</ol>
					<p>*반품 가능성이 있는 신청서의 경우는 센터 도착 전 출고보류를 하셔서 무게가 측정되지 않도록 하셔야 합니다.</p>
					<p></p>
					<p>11. 전자제품은 상품별 1인당 1개까지 통관이 가능하기 때문에, 1개씩 구매요청 해 주시거나 여러 개를
						주문해 주셨을 경우에는 신청서를 나누어 순차적으로 출고하여 통관이 겹치지 않게 주의하여 주세요.</p>
					<p>동시 통관 시 1개를 제외한 나머지는 폐기 될 수 있으며, 그에 따른 수수료 및 폐기되는 제품 비용은
						보상되지 않는 점 참고 부탁 드립니다.</p>
					<p>12. 크기가 작은 상품에 대해 부피와 무게를 줄여 저렴한 배송비로 이용하시고 싶으신 고객분들을 위하여,
						폴리백 포장을 시행하고 있습니다.</p>
					<p>하지만 폴리백이 찢어지기 쉬운 재질이다 보니 상품이 누락되어 분실되는 경우가 있을수 있으며, 상품이
						파손되거나 오염될 수 있습니다.</p>
					<p>폴리백 포장 옵션 선택시 이 점 유념하시어 이용 부탁드리겠습니다.</p>
					<p>13. 아이템 작성시 주의사항</p>
					<p>
						1) 신청서 작성시 현지 주문이 1건으로 진행되었거나 1건의 배송으로 발송되었어도 아이템이나 옵션 (컬러, 사이즈,
						버전 등) 별로 각각 상품정보를 작성하셔야 합니다.<br /> (예) 의류 M사이즈와 L사이즈 각각 두장씩 주문 →
						신청서 작성시 아이템을 M사이즈 2개 / L사이즈 2개로 각각 작성
					</p>
					<p>
						2) 다사조에서는 트래킹번호 기준으로 입고작업을 진행합니다. 따라서 동일상품이라도 여러 트래킹으로 도착한다면 트래킹별로
						각각 아이템 정보를 작성하셔야 합니다.<br /> (예) 문구 동일상품 3트래킹으로 도착 → 신청서 작성시 트래킹
						별로 3아이템 작성
					</p>
					<p>3) 신청서 작성시 향수/주류/화장품/식품 등 용량이 있는 상품의 제목 부분에 용량을 기재해 주셔야 합니다.
						(용량 누락되는 경우 통관지연되거나 불가할 수 있습니다.)</p>
					<p></p>
					<p>* 아이템 작성이 제대로 되지 않아 발생한 모든 사고에 대해 다사조에서는 책임을 지지 않습니다.</p>
				</div>
			</div>
			<div class="checkbox text-right">
				<label><input name="shipSvcAgree" type="checkbox"
					class="type_checkbox" value="Y" /> 위의 주의사항을 모두 확인하였으며, 위 사항에
					동의합니다.</label>
			</div>
	</div>
	<div class="content content-head">
		<div class="content-head-text">배송대행지 선택</div>
	</div>
	<br>
	<div class="area step step-country">
		<div class="box">
			<ul>
				<li>
					<div class="info">
						<input name="shipSvcCountry" type="radio"
							value="오리건" data-currency="USD" /> 오리건 
					</div>
				</li>
				<li>
					<div class="info ">
						<input name="shipSvcCountry" type="radio"
							 value="뉴저지" data-currency="USD" /> 뉴저지 
					</div>
				</li>
				<li>
					<div class="info">
						<input name="shipSvcCountry" type="radio"
							value="영국" data-currency="GBP" /> 영국 
					</div>
				</li>
				<li>
					<div class="info">
						<input name="shipSvcCountry" type="radio"
							class="type_radio" value="독일" data-currency="EUR" /> 독일 
					</div>
				</li>
				<li>
					<div class="info ">
						<input name="shipSvcCountry" type="radio"
							class="type_radio" value="일본(항공)-오사카" data-currency="JPY" />
							일본(항공)-오사카 
					</div>
				</li>
				<li>
					<div class="info ">
						<input name="shipSvcCountry" type="radio"
							class="type_radio" value="중국(항공)" data-currency="CNY" /> 중국(항공)

						
					</div>
				</li>
				<br>
				<li>
					<div class="info ">
						<input name="shipSvcCountry" type="radio"
							 value="스페인" data-currency="EUR" /> 스페인 
					</div>
				</li>
				<li>
					<div class="info ">
						<input name="shipSvcCountry" type="radio"
							 value="호주" data-currency="AUD" /> 호주 
					</div>
				</li>
				<li>
					<div class="info ">
						<input name="shipSvcCountry" type="radio"
							 value="일본(선박)-후쿠오카" data-currency="JPY" />
							일본(선박)-후쿠오카 
					</div>
				</li>
				<li>
					<div class="info ">
						<input name="shipSvcCountry" type="radio"
							 value="중국(선박)" data-currency="CNY" /> 중국(선박)

						
					</div>
				</li>
			</ul>
			<script>
				$(function() {
					$('input[name=shipSvcCountry]')
							.on('click',function() {
								var currency = $(this).data('currency');
								// 선택된 국가의 통화를 가져와서 변수에 저장
								console.log('선택된 통화: ' + currency);
								$('Form').find('input[name=shipSvcCurrency]').remove();
								$('Form').append('<input type="hidden" name="shipSvcCurrency" value="' + currency + '">');
						});
				});
			</script>
		</div>

		<div class="display-china color-red" style="display: none;">※ 중국
			구매대행 상품과 중국 배송대행 상품의 합배송은 불가능 합니다.</div>
		<div class="display-japan color-red" style="display: none;">※ 일본
			구매대행 불가 쇼핑몰 : 메루카리, 라쿠마(프릴), 오타마트 등 어플기반 사이트, 토호 애니매이션, 아미아미, cos,
			Levi's 등</div>
	</div>
	<div class="container left" style="border-color: #e0e0e0;">
		<div class="info-head w-100">배송대행 상품정보 입력</div>
	</div>
	<div class="flex-cell">
		<div class="cell sfont left"  style="margin-bottom: 0px;">
			<label for="shipSvcItemEngName">상품이름(영문)</label> <input type="text"
				name="shipSvcItemEngName" class="tool w-100 line" id="shipSvcItemEngName"
				placeholder="영어로 입력해주세요">
		</div>
		<div class="cell sfont left" style="margin-bottom: 0px;">
			<label for="shipSvcItemCategory">카테고리</label> <input type="text"
				name="shipSvcItemCategory" class="tool w-100 line" id="shipSvcItemCategory"
				placeholder="ex)가방">
		</div>
		<div class="cell sfont left" style="margin-bottom: 0px;">
			<label for="shipSvcFx">금액(외화)</label> <input type="text" name="shipSvcFx"
				class="tool w-100 line" id="shipSvcFx" placeholder="배송비 포함금액">
		</div>
		<div class="cell sfont left" style="margin-bottom: 0px;">
			<!-- 최소수량 1개에서 최대 100개로 설정해둠 -->
			<label for="shipSvcQty">구매수량</label> <input type="number" name="shipSvcQty"
				class="tool w-100 line" value="1" id="shipSvcQty" min="1" max="100">
		</div>
	</div>
	<div class="flex-cell" >
	<div class="cell left w-50 sfont ">
		<label for="shipSvcUserShipper">운송사(본인이 업체로부터 받은)</label><input type="text" name="shipSvcUserShipper" class="tool w-100 line"
			id="shipSvcUserShipper" placeholder="(필수) 운송사를 입력하세요">
	</div>
	<div class="cell left w-50 sfont">
		<label for="shipSvcUserAwbNumber">트레킹넘버</label><input type="text" name="shipSvcUserAwbNumber" class="tool w-100 line"
			id="shipSvcUserAwbNumber" placeholder="(필수) 트레킹넘버를 입력하세요">
	</div>
	</div>
	<div class="cell">
		<input type="text" name="shipSvcLink" class="tool w-100 line"
			placeholder="(필수) 상품 URL을 입력하세요">
	</div>
		<div class="cell sfont">
			<input type="text" name="shipSvcItemOption1" class="tool w-100 line" 
			id="shipSvcItemOption1"	placeholder="기타사항을 입력하세요">
		</div>
	<div class="cell">
		<input type="text" name="shipSvcDComment" class="tool w-100 line"
			placeholder="배송요청사항을 입력하세요 (ex:경비실에 맡겨주세요)">
	</div>
<br>
<div class="container left">
	<div class="info-head w-100">구매자 정보입력</div>
</div>
<div class="flex-cell">
	<div class="cell sfont">
		구매자(한글) <input type="text" name="shipSvcNameKor" class="tool w-100 line" value="${loginDto.memberNameKor}"
			placeholder="한글이름">
	</div>
	<div class="cell sfont">
		구매자(영문) <input type="text" name="shipSvcNameEng" class="tool w-100 line" value="${loginDto.memberNameEng}"
			placeholder="영어이름">
	</div>
	<div class="cell sfont">
		통관고유번호 <input type="text" name="shipSvcClearanceId" class="tool w-100 line" value="${loginDto.memberClearanceId}"
			placeholder="P로시작">
	</div>
	<div class="cell sfont">
		연락처 <input type="text" name="shipSvcContact" class="tool w-100 line" value="${loginDto.memberContact1}"
			placeholder="전화번호">
	</div>
</div>
<div class="cell left">
	<div class="cell">
		<input type="text" name="shipSvcZipcode" class="tool w-20 line" value="${loginDto.memberZipcode}"
			placeholder="우편번호">
		<button type="button" class="btn btn-address-search">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
	</div>
	<div class="cell">
		<input type="text" name="shipSvcAddress1" class="tool w-50 line" value="${loginDto.memberAddress1}"
			placeholder="기본주소">
	</div>
	<div class="cell">
		<input type="text" name="shipSvcAddress2" class="tool w-50 line" value="${loginDto.memberAddress2}"
			placeholder="상세주소">
	</div>
	<br>
</div>
<div class="button_area text-center">
	<button type="submit" class="btn mt-10 btn-click">신청서 작성하기</button>
</div>
</form>
</div>

<br>
<br>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>