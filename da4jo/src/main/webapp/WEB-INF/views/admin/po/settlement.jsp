<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- lightpick CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/css/lightpick.min.css">
<script src="https://cdn.jsdelivr.net/npm/moment@2.30.1/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/lightpick@1.6.2/lightpick.min.js"></script>
<!-- SheetJS CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!-- FileSaver saveAs CDN -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	//공통
	// 참고 출처 : https://redstapler.co/sheetjs-tutorial-create-xlsx/
	function s2ab(s) {
		var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
		var view = new Uint8Array(buf); //create uint8array as viewer
		for (var i = 0; i < s.length; i++)
			view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
		return buf;
	}
	function exportExcel() {
		// step 1. workbook 생성
		var wb = XLSX.utils.book_new();
		// step 2. 시트 만들기 
		var newWorksheet = excelHandler.getWorksheet();
		// step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
		XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler
				.getSheetName());
		// step 4. 엑셀 파일 만들기 
		var wbout = XLSX.write(wb, {
			bookType : 'xlsx',
			type : 'binary'
		});
		// step 5. 엑셀 파일 내보내기 
		saveAs(new Blob([ s2ab(wbout) ], {
			type : "application/octet-stream"
		}), excelHandler.getExcelFileName());
	}
	$(document).ready(function() {
		$("#excelFileExport").click(function() {
			exportExcel();
		});
	});
</script>
<script>
	var excelHandler = {
		getExcelFileName : function() {
			return 'table-test.xlsx';
		},
		getSheetName : function() {
			return 'Table Test Sheet';
		},
		getExcelData : function() {
			return document.getElementById('tableData');
		},
		getWorksheet : function() {
			return XLSX.utils.table_to_sheet(this.getExcelData());
		}
	}
</script>
<script type="text/javascript">
	// lightpick
	$(function() {
		var picker = new Lightpick({
			field : $("[name=startDate]")[0], // 시작일
			secondField : $("[name=endDate]")[0], // 종료일
			format : "YYYY-MM-DD",
			singleDate : false,
			numberOfMonths : 2,
			numberOfColumns : 2,
			selectForword : true,
		});
	});
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
section{
	display: block;
 }

#memberId {
	width: 23%;
}

#memerName {
	width: 13%;
}

#memberEmail {
	width: 50%;
}

#memberCode {
	width: 32%;
}

#isBlock, #memberDetail {
	width: 9%;
}

.table.table-hover>tbody>tr:hover {
    background-color: #CAE4FF;
}
th{
	height: 50px;
	border-bottom: 1px solid #2D3436;
	border-top: 1px solid #2D3436;
	background-color: #F1F3F5;
}
td{
	border-bottom: 1px solid #F1F3F5;
}
</style>

<script>
	// 총합 계산을 위한
	document.addEventListener("DOMContentLoaded", function() {
		var totalPriceElements = document.querySelectorAll("#poTotalPrice");
		var totalCountElements = document.querySelectorAll("#count");
		var totalPrice = 0;
		var totalCount = 0;

		// 각 항목의 금액 계산
		totalPriceElements.forEach(function(element) {
			totalPrice += parseInt(element.textContent.replace(/,/g, ""));
		});
		//각 항목의 건수 계산
		totalCountElements.forEach(function(element) {
			totalCount += parseInt(element.textContent.replace(/,/g, ""));
		});

		// 총합을 출력하는 영역에 결과를 삽입
		var totalPriceDisplay = document.getElementById("totalPrice");
		totalPriceDisplay.textContent = totalPrice.toLocaleString();

		// 총 건수를 출력하는 영역에 결과를 삽입
		var totalCountDisplay = document.getElementById("totalCount");
		totalCountDisplay.textContent = totalCount.toLocaleString();
	});
</script>

<script>
	function s_function() {
		$('#settlement').submit();
	}
</script>

<div class="container container-body">
	<jsp:include page="/WEB-INF/views/template/admin-sidebar.jsp"></jsp:include>
	<div class="container inner-container">
		<div class="content content-head">
			<div class="content-head-text">
				<i class="fa-solid fa-pause"></i> 일자별 정산 내역
			</div>
		</div>

		<form action="settlement">
			<!-- 날짜 범위 선택을 위한 입력 상자 -->
			<div class="cell plex-cell right" >
				기간별 검색 <input type="text" name="startDate" placeholder="시작일"
					value="$(settlementVO.poPayDate)"> &ensp;~&ensp; <input
					type="text" name="endDate" placeholder="종료일"
					value="$(settlementVO.poPayDate)">
				<button>
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
		</form>
		<div class="content content-body">
			<div class="cell listArea">
				<table id="tableData" class="table table-hover " style="min-height: 300px;">
					<thead style="font-size: 16px;" class="mt-10">
						<tr>
							<th>날짜</th>
							<th>건수</th>
							<th>총 금액(원)</th>
							<th>상세</th>
						</tr>
					</thead>
					<tbody style="font-size: 14px;" >
						<c:forEach var="settlementVO" items="${list}">
							<tr>
								<td id="poPayDate" style="margin-top: 30px;">${settlementVO.poPayDate}</td>
								<td id="count" style="margin-top: 30px;"><fmt:formatNumber value="${settlementVO.count}"
										pattern="#,##0" /></td>
								<td id="poTotalPrice" style="margin-top: 30px;"><fmt:formatNumber value="${settlementVO.poTotalPrice}"
										pattern="#,##0" /></td>
								<td id="dailyDetail" style="margin-top: 30px;"><a
									href="dailyDetail?poPayDate=${settlementVO.poPayDate}"><i
										class="fa-solid fa-list link"></i></a></td>
							</tr>
						</c:forEach>
						<tr>
							<td><strong>합계</strong></td>
							<td><strong id="totalCount"></strong></td>
							<td><strong id="totalPrice"></strong></td>
							<td><strong id="poDetail"></strong></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 엑셀다운로드 버튼 -->
		<div class="right">
		<input type="button" id="excelFileExport" value="엑셀 파일 다운로드(TABLE)" class="btn"/>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/admin-footer.jsp"></jsp:include>
</body>
</html>