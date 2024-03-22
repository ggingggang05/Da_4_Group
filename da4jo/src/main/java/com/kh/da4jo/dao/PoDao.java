package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.mapper.DailyDetailVOMapper;
import com.kh.da4jo.mapper.PaymentVOMapper;
import com.kh.da4jo.mapper.PoListMapper;
import com.kh.da4jo.mapper.PoMapper;
import com.kh.da4jo.mapper.SettlementVOMapper;
import com.kh.da4jo.vo.DailyDetailVO;
import com.kh.da4jo.mapper.VatListVOMapper;
import com.kh.da4jo.vo.PageVO;
import com.kh.da4jo.vo.PaymentVO;
import com.kh.da4jo.vo.SettlementVO;
import com.kh.da4jo.vo.VatListVO;

@Repository
public class PoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private PoMapper poMapper;
	@Autowired
	private PoListMapper poListMapper;
	@Autowired
	private PaymentVOMapper paymentVOMapper;
	@Autowired
	private SettlementVOMapper settlementVOMapper;
	@Autowired
	private DailyDetailVOMapper dailyDetailVOMapper;
	@Autowired
	private VatListVOMapper vatListVOMapper;

	// poNo 미리 뽑기
	public int getSequence() {
		String sql = "select po_seq.nextval from dual";
		// jdbcTemplate.queryForObject(구문, 결과자료형);
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	// 주문서 등록
	public void insert(PoDto poDto) {
		String sql = "INSERT INTO PO(PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG,"
				+ "	  PO_CLEARANCE_ID, PO_ITEM_ENG_NAME, PO_LINK, PO_QTY, PO_ITEM_OPTION1,"
				+ "	  PO_ITEM_OPTION2, PO_ITEM_OPTION3, PO_CONTACT, PO_ZIPCODE,"
				+ "	  PO_ADDRESS1, PO_ADDRESS2, PO_DCOMMENT, PO_COUNTRY, PO_CURRENCY, PO_FX, PO_AGREE ) "
				+ "	  VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] data = { poDto.getPoNo(), poDto.getPoCustomerId(), poDto.getPoNameKor(), poDto.getPoNameEng(),
				poDto.getPoClearanceId(), poDto.getPoItemEngName(), poDto.getPoLink(), poDto.getPoQty(),
				poDto.getPoItemOption1(), poDto.getPoItemOption2(), poDto.getPoItemOption3(), poDto.getPoContact(),
				poDto.getPoZipcode(), poDto.getPoAddress1(), poDto.getPoAddress2(), poDto.getPoDcomment(),
				poDto.getPoCountry(), poDto.getPoCurrency(), poDto.getPoFx(), poDto.getPoAgree() };
		jdbcTemplate.update(sql, data);
	}

	// R(read) 공지목록
	public List<PoDto> selectList() {// 공지의 단순 목록만 나오게
		String sql = "select * from po order by PO_NO desc";
		return jdbcTemplate.query(sql, poMapper);
	}

	// 공지의 검색 목록이 나옴
	public List<PoDto> selectList(String column, String keyword) {
		String sql = "select PO_NO, PO_CUSTOMER_ID, PO_ITEM_ENG_NAME from po where instr(" + column + ", ?) > 0 "
				+ " order by PO_NO desc";
		Object[] data = { keyword };
		return jdbcTemplate.query(sql, poMapper, data);
	}
	// 아이디로 조회
	public List<PoDto> selectList(String loginId) {
		String sql = "select * from po where po_customer_id = ?";
		Object[] data = { loginId };
		return jdbcTemplate.query(sql, poMapper, data);
	}
	

	// 통합+페이징
	public List<PoDto> selectListByPagingAll(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE, " + "from po "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 " + ")TMP" + ") where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		} else {// 목록
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE "
					+ "from po order by po_no desc" + ")TMP" + ") where rn between ? and ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		}
	}

	// 통합+페이징 인데 오더리스트에만 씀 status 때문에
	public List<PoDto> selectListByOrderListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE " + "from po "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 AND PO_STATUS='주문정보 확인 중'" + ")TMP"
					+ ") where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE "
					+ "FROM PO WHERE PO_STATUS = '주문정보 확인 중' ORDER BY PO_NO DESC" + ")TMP"
					+ ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		}
	}

	// 얘는 상태가 결제완료 일때만 보이는 페이징
	public List<PoDto> selectListByprocessListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE " + "from po "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 " + ")TMP" + ") where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE "
					+ "FROM PO WHERE PO_STATUS = '결제완료' ORDER BY PO_NO DESC" + ")TMP" + ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		}
	}

	// 얘는 상태가 배송완료 일때만 보이는 페이징
	public List<PoDto> selectListBycompleteListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE "
					+ "from po where instr(" + pageVO.getColumn() + ", ?) > 0 " + ")TMP" + ") where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE "
					+ "FROM PO WHERE PO_STATUS = '배송완료' ORDER BY PO_NO DESC" + ")TMP" + ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		}
	}

	// 얘는 상태가 주문취소 일때만 보이는 페이징
	public List<PoDto> selectListByCancelListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE " + "from po "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 " + ")TMP" + ") where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "PO_NO, PO_CUSTOMER_ID, PO_NAME_KOR, PO_NAME_ENG, PO_CLEARANCE_ID,"
					+ "PO_LINK,PO_ITEM_ENG_NAME,PO_ITEM_CATEGORY,PO_ITEM_WEIGHT,PO_QTY,"
					+ "PO_ITEM_OPTION1,PO_ITEM_OPTION2,PO_ITEM_OPTION3,PO_CONTACT,PO_ZIPCODE,"
					+ "PO_ADDRESS1,PO_ADDRESS2,PO_DCOMMENT,PO_ADMIN_COMMENT,PO_STATUS,PO_AWB_NUMBER,"
					+ "PO_SHIPPER,PO_SDATE,PO_EDATE,PO_PAY_DATE,PO_SHIP_DATE,PO_COUNTRY,PO_CURRENCY,PO_FX_RATE,"
					+ "PO_FX,PO_ITEM_PRICE_KRW,PO_ITEM_VAT,PO_SERVICE_FEE,PO_TOTAL_PRICE_KRW,PO_AGREE "
					+ "FROM PO WHERE PO_STATUS = '주문취소' ORDER BY PO_NO DESC" + ")TMP" + ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poMapper, data);
		}
	}

	// 카운트 - 목록일 경우와 검색일 경우를 각각 구현
	public int count(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from po " + "where instr(" + pageVO.getColumn() + ", ?) > 0";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from po";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 로그인한 사용자의 구매서 정보 조회를 위해 목록일 경우와 검색일 경우 각각 구현
	public int loginIdcount(PageVO pageVO, String memberId) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from po " + "where instr(" + pageVO.getColumn()
					+ ", ?) > 0 and po_customer_id=?";
			Object[] data = { pageVO.getKeyword(), memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from po where po_customer_id=?";
			Object[] data = { memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
	}

	// 카운트 - 주문정보 확인중의 목록일 경우와 검색일 경우를 각각 구현
	public int orderCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from po where instr(" + pageVO.getColumn()
					+ ", ?) > 0 AND PO_STATUS='주문정보 확인 중'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from po where PO_STATUS='주문정보 확인 중'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 주문정보 배송대기의 목록일 경우와 검색일 경우를 각각 구현
	public int processCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from po where instr(" + pageVO.getColumn() + ", ?) > 0 AND PO_STATUS='결제완료'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from po where PO_STATUS='결제완료'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 주문정보의 배송 상태가 '배송 중'이고 로그인한 사용자인 경우에 대해 목록과 검색일 경우를 각각 구현
	public int shippingCount(PageVO pageVO, String memberId) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from po where instr(" + pageVO.getColumn()
					+ ", ?) > 0 AND PO_STATUS='배송 중' AND PO_CUSTOMER_ID=? ";
			Object[] data = { pageVO.getKeyword(), memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from po where po_status='배송 중' and po_customer_id=?";
			Object[] data = { memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
	}

	// 카운트 - 주문정보 배송완료의 목록일 경우와 검색일 경우를 각각 구현
	public int completeCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from po where instr(" + pageVO.getColumn() + ", ?) > 0 AND PO_STATUS='배송완료'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from po where PO_STATUS='배송완료'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}
		
		// 카운트 - 주문정보 확인 중, 결제 대기 중인 구매서 목록/검색 각각 구현
		public int pendingPaymentCount(PageVO pageVO, String loginId) {
			if (pageVO.isSearch()) {// 검색
				String sql = "select count(*) from po where instr(" + pageVO.getColumn() +", ?) > 0 "
						+ "AND ( PO_STATUS='주문정보 확인 중' OR PO_STATUS='결제 대기 중') "
						+ "AND PO_CUSTOMER_ID=?";
				Object[] data = { pageVO.getKeyword(), loginId };
				return jdbcTemplate.queryForObject(sql, int.class, data);
			} else {// 목록
				String sql = "select count(*) from po where PO_STATUS='주문정보 확인 중' OR PO_STATUS='결제 대기 중'";
				return jdbcTemplate.queryForObject(sql, int.class);
			}
		}

	// 카운트 - 주문정보 취소 목록일 경우와 검색일 경우를 각각 구현
	public int cancelCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from po where instr(" + pageVO.getColumn() + ", ?) > 0 AND PO_STATUS='주문취소'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from po where PO_STATUS='주문취소'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 단일조회 - 번호로 조회
	public PoDto selectOne(int poNo) {
		String sql = "select * from po where po_no = ?";
		Object[] data = { poNo };
		List<PoDto> list = jdbcTemplate.query(sql, poMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// U(update) 상품가격만 알려주는 업데이트
	public boolean update(PoDto poDto) {
		String sql = "update po "
				+ "set PO_ITEM_VAT=?, PO_SERVICE_FEE=?, PO_TOTAL_PRICE_KRW=?, PO_ITEM_PRICE_KRW=?,PO_STATUS=? "
				+ "where po_no = ?";
		Object[] data = { poDto.getPoItemVat(), poDto.getPoServiceFee(), poDto.getPoTotalPriceKrw(),
				poDto.getPoItemPriceKrw(), poDto.getPoStatus(), poDto.getPoNo() };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 송장번호 업데이트 하는구문
	public boolean updateAWB(PoDto poDto) {
		String sql = "update po "
				+ "set PO_SHIPPER=?, PO_AWB_NUMBER=?, PO_ADMIN_COMMENT=?, PO_STATUS= '배송 중' ,PO_SHIP_DATE=sysdate "
				+ "where po_no = ?";
		Object[] data = { poDto.getPoShipper(), poDto.getPoAwbNumber(), poDto.getPoAdminComment(), poDto.getPoNo() };
		System.out.println(poDto.getPoStatus());
		return jdbcTemplate.update(sql, data) > 0;
	}

	// PO+크레딧/포인트 연결 구매서
	public PaymentVO getPaymentInfo(int poNo) {
		String sql = "SELECT " + " PO.PO_NO, PO.PO_NAME_KOR, PO.PO_NAME_ENG, PO.PO_STATUS, "
				+ " PO.PO_FX_RATE, PO.PO_FX, PO.PO_ITEM_PRICE_KRW, "
				+ " PO.PO_ITEM_VAT, PO.PO_SERVICE_FEE, PO.PO_TOTAL_PRICE_KRW, "
				+ " MEMBER.MEMBER_CREDIT, MEMBER.MEMBER_POINT " + "FROM PO "
				+ "JOIN MEMBER ON PO.PO_CUSTOMER_ID = MEMBER.MEMBER_ID " + "WHERE PO.PO_NO = ?";
		Object[] data = { poNo };
		List<PaymentVO> list = jdbcTemplate.query(sql, paymentVOMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// 상태 변수 변경 , 결제시간 변경
	public void updateStatus(PoDto poDto) {
		String sql = "update po set po_status=?,po_pay_date = sysdate where po_no=?";
		Object[] data = { poDto.getPoStatus(), poDto.getPoNo() };
		jdbcTemplate.update(sql, data);
	}
	
	public void updateCancelStatus(int poNo) {
		String sql = "update po set po_status='주문취소', po_pay_date = sysdate where po_no=?";
		Object[] data = { poNo };
		jdbcTemplate.update(sql, data);
	}

	// D(delete)
	public boolean delete(int poNo) {
		String sql = "delete po where po_no = ?";
		Object[] data = { poNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 목록일 경우 카운트
	public int count() {
		String sql = "select count(*) from po";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	// 회원 각자의 구매서 총 개수 구하기
	public int countEachMember(String memberId) {
		String sql = "select count(*) from po where po_customer_id=?";
		Object[] data = { memberId };

		return jdbcTemplate.queryForObject(sql, int.class, data);
	}

	// 목록 페이징
	public List<PoDto> selectListByPaging(PageVO pageVO, String loginId) {
		
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ( "
						+ "select "
						+ "po_no, po_item_eng_name, po_item_category, "
						+ "po_sdate, po_status, po_awb_number, po_fx, "
						+ "po_service_fee, po_total_price_krw, po_item_price_krw "
						+ "from po "
						+ "where instr(" + pageVO.getColumn() + ", ?) > 0 AND po_customer_id=?"
						+ "order by po_sdate desc"
						+ ")TMP" 
					+ ") where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), loginId, pageVO.getBeginRow(), pageVO.getEndRow() };

			return jdbcTemplate.query(sql, poListMapper, data);
		} 
		/* 날짜 검색 시
		 * else if (pageVO.isSearch() && SearchMark == 1) { String sql = "SELECT * " +
		 * "FROM ( " + "SELECT rownum rn, TMP.* FROM ( " + "SELECT " +
		 * "po_no, po_item_eng_name, po_item_category, " +
		 * "po_sdate, po_status, po_awb_number, po_fx, " +
		 * "po_service_fee, po_total_price_krw, po_item_price_krw " + "FROM po " +
		 * "WHERE TRUNC(po_sdate) = TO_DATE(?, 'YYYY-MM-DD') AND po_customer_id = ? " +
		 * "ORDER BY po_sdate DESC " + ") TMP " + ") WHERE rn BETWEEN ? AND ?"; Object[]
		 * data = { pageVO.getKeyword(), loginId, pageVO.getBeginRow(),
		 * pageVO.getEndRow() };
		 * 
		 * return jdbcTemplate.query(sql, poListMapper, data); }
		 */
		else {// 목록
			String sql = "select * from (" + "select rownum rn, TMP.* from ( " + "select "
					+ "po_no, po_item_eng_name, po_item_category, " + "po_sdate, po_status, po_awb_number, po_fx, "
					+ "po_service_fee, po_total_price_krw, po_item_price_krw " + "from po " + "where po_customer_id=?"
					+ "order by po_sdate desc" + ")TMP" + ") where rn between ? and ?";
			Object[] data = { loginId, pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, poListMapper, data);
		}
	}

	// 배송 중인 구매서에 대한 페이징
	public List<PoDto> selectShippingListByPaging(PageVO pageVO, String loginId) {
		String sql = "select * from (" + "select rownum rn, TMP.* from ( " + "select * " + "from po "
				+ "where po_status='배송 중' and po_customer_id=? " + "order by po_sdate desc" + ")TMP"
				+ ") where rn between ? and ?";
		Object[] data = { loginId, pageVO.getBeginRow(), pageVO.getEndRow() };

		return jdbcTemplate.query(sql, poListMapper, data);
	}

		
		// 주문정보 확인 중, 결제 대기 중인 구매서에 대해 페이징
		public List<PoDto> selectpendingPaymentListByPaging(PageVO pageVO, String loginId) {
			String sql = "select * from (" 
					+ "select rownum rn, TMP.* from ( " 
					+ "select * "
					+ "from po "
					+ "where (PO_STATUS='주문정보 확인 중' OR PO_STATUS='결제 대기 중') and po_customer_id=? "
					+ "order by po_sdate desc" 
					+ ")TMP" 
					+ ") where rn between ? and ?";
			Object[] data = { loginId, pageVO.getBeginRow(), pageVO.getEndRow() };

			return jdbcTemplate.query(sql, poListMapper, data);
		}
	
	
	// 결제 완료 목록 조회

	// 결제시간 업데이트
	public boolean poPayDate(int poNo) {
		String sql = "update po set po_pay_date = sysdate where po_no";
		Object[] data = { poNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 일자별 정산 내역 조회
    public List<SettlementVO> getDailyPayments() {
        String sql = "SELECT TO_CHAR(PO_PAY_DATE, 'YYYY-MM-DD') AS PO_PAY_DATE, "
				        		+ "COUNT(*) AS COUNT, "
				        		+ "SUM(PO_TOTAL_PRICE_KRW) AS PO_TOTAL_PRICE_KRW "
				        		+ "FROM PO "
				        		+ "WHERE PO_PAY_DATE IS NOT NULL "
				        		+ "GROUP BY TO_CHAR(PO_PAY_DATE, 'YYYY-MM-DD') "
				        		+ "ORDER BY PO_PAY_DATE DESC";
        return jdbcTemplate.query(sql, settlementVOMapper);
    }
  //날짜 기간 선택 조회
    public List<SettlementVO> periodPayments(String startDate, String endDate){
    	String sql = "SELECT TO_CHAR(PO_PAY_DATE, 'YYYY-MM-DD') AS PO_PAY_DATE, "
				    			+ "COUNT(*) AS COUNT, "
				    			+ "SUM(PO_TOTAL_PRICE_KRW) AS PO_TOTAL_PRICE_KRW "
				    			+ "FROM PO "
				    			+ "WHERE PO_PAY_DATE  "
				    			+ "BETWEEN TO_DATE(?, 'YYYY-MM-DD') "
				    			+ "AND TO_DATE(?, 'YYYY-MM-DD') + 1 "
				    			+ "GROUP BY TO_CHAR(PO_PAY_DATE, 'YYYY-MM-DD') "
				    			+ "ORDER BY PO_PAY_DATE DESC";
    	Object[] data = { startDate, endDate };
    	return jdbcTemplate.query(sql, settlementVOMapper, data);
    }
    //일자별 상세
    public List<DailyDetailVO> dailyDetail(String poPayDate){
    	String sql = "SELECT "
    			+ "PO_PAY_DATE, PO_NO, PO_CUSTOMER_ID, "
    			+ "PO_NAME_KOR, PO_ITEM_ENG_NAME, PO_TOTAL_PRICE_KRW, "
    			+ "PO_QTY, PO_ITEM_VAT, PO_AWB_NUMBER, PO_SDATE "
    			+ "FROM "
    			+ "PO "
    			+ "WHERE "
    			+ "TRUNC(PO_PAY_DATE) = TO_DATE(?, 'YYYY-MM-DD') "
    			+ "ORDER BY "
    			+ "PO_PAY_DATE DESC	";
    	Object[] data = {poPayDate};
    	
    	return jdbcTemplate.query(sql, dailyDetailVOMapper, data);
    }
    public List<VatListVO> getVatListByYear(String year) {
    	String sql = "WITH PO_VAT_TOTALS AS ("
    			+ "SELECT "
    			+ "TO_CHAR(PO_SDATE, 'YYYY') AS YEAR, "
    			+ "CEIL(TO_CHAR(PO_SDATE, 'MM') / 3) AS QUARTER, "
    			+ "SUM(PO_ITEM_VAT) AS PO_VAT_TOTAL "
    			+ "FROM PO "
    			+ "GROUP BY "
    			+ "TO_CHAR(PO_SDATE, 'YYYY'), "
    			+ "CEIL(TO_CHAR(PO_SDATE, 'MM') / 3)"
    			+ "), "
    			+ "SHIPSVC_VAT_TOTALS AS ("
    			+ "SELECT TO_CHAR(SHIPSVC_SDATE, 'YYYY') AS YEAR, "
    			+ "CEIL(TO_CHAR(SHIPSVC_SDATE, 'MM') / 3) AS QUARTER, "
    			+ " SUM(SHIPSVC_ITEM_VAT) AS SHIPSVC_VAT_TOTAL "
    			+ "FROM SHIPSVC "
    			+ "GROUP BY "
    			+ "TO_CHAR(SHIPSVC_SDATE, 'YYYY'), "
    			+ "CEIL(TO_CHAR(SHIPSVC_SDATE, 'MM') / 3)"
    			+ ") "
    			+ "SELECT "
    			+ "NVL(PO.YEAR, SHIPSVC.YEAR) AS YEAR, "
    			+ "NVL(PO.QUARTER, SHIPSVC.QUARTER) AS QUARTER, "
    			+ "NVL(PO.PO_VAT_TOTAL, 0) AS PO_VAT_TOTAL, "
    			+ "NVL(SHIPSVC.SHIPSVC_VAT_TOTAL, 0) AS SHIPSVC_VAT_TOTAL, "
    			+ "NVL(PO.PO_VAT_TOTAL, 0) + NVL(SHIPSVC.SHIPSVC_VAT_TOTAL, 0) AS VAT_TOTAL "
    			+ "FROM "
    			+ "PO_VAT_TOTALS PO "
    			+ "FULL OUTER JOIN "
    			+ "SHIPSVC_VAT_TOTALS SHIPSVC "
    			+ "ON "
    			+ "PO.YEAR = SHIPSVC.YEAR AND PO.QUARTER = SHIPSVC.QUARTER "
    			+ "WHERE "
    			+ "NVL(PO.YEAR, SHIPSVC.YEAR) = ? "
    			+ "ORDER BY "
    			+ "NVL(PO.YEAR, SHIPSVC.YEAR), "
    			+ "NVL(PO.QUARTER, SHIPSVC.QUARTER)";
    	return jdbcTemplate.query(sql, vatListVOMapper, year);
    }
    //배송중으로 바뀐 시점부터 7일뒤 배송완료로
	public void compareDate(List<PoDto> dateList) {
		String sql = "UPDATE po SET PO_STATUS = '배송완료' WHERE PO_SHIP_DATE + 7 < sysdate";
		jdbcTemplate.update(sql);
	}
}