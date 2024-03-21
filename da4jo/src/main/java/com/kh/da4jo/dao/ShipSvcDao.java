package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.ShipSvcDto;
import com.kh.da4jo.mapper.DailyDetailVOMapper;
import com.kh.da4jo.mapper.PaymentVOMapper;
import com.kh.da4jo.mapper.SettlementVOMapper;
import com.kh.da4jo.mapper.ShipSvcListMapper;
import com.kh.da4jo.mapper.ShipSvcMapper;
import com.kh.da4jo.mapper.VatListVOMapper;
import com.kh.da4jo.vo.DailyDetailVO;
import com.kh.da4jo.vo.PageVO;
import com.kh.da4jo.vo.PaymentVO;
import com.kh.da4jo.vo.SettlementVO;
import com.kh.da4jo.vo.VatListVO;

@Repository
public class ShipSvcDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private PaymentVOMapper paymentVOMapper;
	@Autowired
	private SettlementVOMapper settlementVOMapper;
	@Autowired
	private ShipSvcMapper shipSvcMapper;
	@Autowired
	private ShipSvcListMapper shipSvcListMapper;
	@Autowired
	private DailyDetailVOMapper dailyDetailVOMapper;
	@Autowired
	private VatListVOMapper vatListVOMapper;

	// SHIPSVCNo 미리 뽑기
	public int getSequence() {
		String sql = "select SHIPSVC_SEQ.nextval from dual";
		// jdbcTemplate.queryForObject(구문, 결과자료형);
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	public void insert(ShipSvcDto shipSvcDto) {
		String sql = "INSERT INTO SHIPSVC(SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG,"
				+ "	  SHIPSVC_CLEARANCE_ID, SHIPSVC_ITEM_ENG_NAME, SHIPSVC_LINK, SHIPSVC_QTY, SHIPSVC_ITEM_OPTION1,"
				+ "	  SHIPSVC_CONTACT, SHIPSVC_ZIPCODE, SHIPSVC_ADDRESS1, SHIPSVC_ADDRESS2, SHIPSVC_DCOMMENT, "
				+ "	  SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX, SHIPSVC_AGREE,SHIPSVC_USER_SHIPPER,SHIPSVC_USER_AWB_NUMBER,"
				+ "	  SHIPSVC_ITEM_PRICE_KRW ) "
				+ "	  VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] data = { shipSvcDto.getShipSvcNo(), shipSvcDto.getShipSvcCustomerId(), shipSvcDto.getShipSvcNameKor(),
				shipSvcDto.getShipSvcNameEng(), shipSvcDto.getShipSvcClearanceId(), shipSvcDto.getShipSvcItemEngName(),
				shipSvcDto.getShipSvcLink(), shipSvcDto.getShipSvcQty(), shipSvcDto.getShipSvcItemOption1(),
				shipSvcDto.getShipSvcContact(), shipSvcDto.getShipSvcZipcode(), shipSvcDto.getShipSvcAddress1(),
				shipSvcDto.getShipSvcAddress2(), shipSvcDto.getShipSvcDComment(), shipSvcDto.getShipSvcCountry(),
				shipSvcDto.getShipSvcCurrency(), shipSvcDto.getShipSvcFx(), shipSvcDto.getShipSvcAgree(),
				shipSvcDto.getShipSvcUserShipper(), shipSvcDto.getShipSvcUserAwbNumber(),shipSvcDto.getShipSvcItemPriceKrw() };
		jdbcTemplate.update(sql, data);
	}

	// R(read) 공지목록
	public List<ShipSvcDto> selectList() {// 공지의 단순 목록만 나오게
		String sql = "select * from shipsvc order by shipsvc_no desc";
		return jdbcTemplate.query(sql, shipSvcMapper);
	}

	// 공지의 검색 목록이 나옴
	public List<ShipSvcDto> selectList(String column, String keyword) {
		String sql = "select shipsvc_no, shipsvc_CUSTOMER_ID, shipsvc_ITEM_ENG_NAME from shipsvc where instr(" + column
				+ ", ?) > 0 " + " order by shipsvc_no desc";
		Object[] data = { keyword };
		return jdbcTemplate.query(sql, shipSvcMapper, data);
	}

	// 아이디로 조회
	public List<ShipSvcDto> selectList(String loginId) {
		String sql = "select * from ship where shipsvc_customer_id = ?";
		Object[] data = { loginId };
		return jdbcTemplate.query(sql, shipSvcMapper, data);
	}

	// 통합+페이징
	public List<ShipSvcDto> selectListByPagingAll(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE from SHIPSVC "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 " + ")TMP" + ") where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		} else {// 목록
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE from SHIPSVC "
					+ "order by shipsvc_no desc" + ")TMP" + ") where rn between ? and ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		}
	}

	// 통합+페이징 인데 오더리스트에만 씀 status 때문에
	public List<ShipSvcDto> selectListByOrderListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE " + "from SHIPSVC "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 AND SHIPSVC_STATUS='주문정보 확인 중'"
					+ ")TMP) where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE "
					+ "FROM SHIPSVC WHERE SHIPSVC_STATUS = '주문정보 확인 중' ORDER BY SHIPSVC_NO DESC" + ")TMP"
					+ ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		}
	}

	// 얘는 상태가 결제완료 일때만 보이는 페이징
	public List<ShipSvcDto> selectListByprocessListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE " + "from SHIPSVC "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 AND SHIPSVC_STATUS='결제완료'"
					+ ")TMP) where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE "
					+ "FROM SHIPSVC WHERE SHIPSVC_STATUS = '결제완료' ORDER BY SHIPSVC_NO DESC" + ")TMP"
					+ ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		}
	}

	// 얘는 상태가 배송완료 일때만 보이는 페이징
	public List<ShipSvcDto> selectListBycompleteListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE " + "from SHIPSVC "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 AND SHIPSVC_STATUS='배송완료'"
					+ ")TMP) where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE "
					+ "FROM SHIPSVC WHERE SHIPSVC_STATUS = '배송완료' ORDER BY SHIPSVC_NO DESC" + ")TMP"
					+ ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		}
	}

	// 얘는 상태가 주문취소 일때만 보이는 페이징
	public List<ShipSvcDto> selectListByCancelListPaging(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select * from (" + "select rownum rn, TMP.* from (" + "select "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE " + "from SHIPSVC "
					+ "where instr(" + pageVO.getColumn() + ", ?) > 0 AND SHIPSVC_STATUS='주문취소'"
					+ ")TMP) where rn between ? and ?";
			Object[] data = { pageVO.getKeyword(), pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		} else {// 목록
			String sql = "SELECT * FROM (" + "SELECT ROWNUM RN, TMP.* FROM (" + "SELECT "
					+ "SHIPSVC_NO, SHIPSVC_CUSTOMER_ID, SHIPSVC_NAME_KOR, SHIPSVC_NAME_ENG, SHIPSVC_CLEARANCE_ID,"
					+ "SHIPSVC_LINK,SHIPSVC_ITEM_ENG_NAME,SHIPSVC_ITEM_CATEGORY,SHIPSVC_ITEM_WEIGHT,SHIPSVC_QTY,"
					+ "SHIPSVC_ITEM_OPTION1,SHIPSVC_CONTACT,SHIPSVC_ZIPCODE,SHIPSVC_ADDRESS1,SHIPSVC_ADDRESS2,"
					+ "SHIPSVC_DCOMMENT,SHIPSVC_CLAIM,SHIPSVC_ADMIN_COMMENT,SHIPSVC_STATUS,SHIPSVC_AWB_NUMBER,SHIPSVC_SHIPPER,"
					+ "SHIPSVC_USER_AWB_NUMBER,SHIPSVC_USER_SHIPPER,SHIPSVC_SDATE,SHIPSVC_EDATE,SHIPSVC_PAY_DATE,SHIPSVC_SHIP_DATE, "
					+ "SHIPSVC_USER_SHIP_DATE,SHIPSVC_COUNTRY, SHIPSVC_CURRENCY, SHIPSVC_FX_RATE,SHIPSVC_FX, SHIPSVC_ITEM_PRICE_KRW, "
					+ "SHIPSVC_ITEM_VAT,SHIPSVC_SERVICE_FEE,SHIPSVC_TOTAL_PRICE_KRW,SHIPSVC_AGREE "
					+ "FROM SHIPSVC WHERE SHIPSVC_STATUS = '주문취소' ORDER BY SHIPSVC_NO DESC" + ")TMP"
					+ ") WHERE RN BETWEEN ? AND ?";
			Object[] data = { pageVO.getBeginRow(), pageVO.getEndRow() };
			return jdbcTemplate.query(sql, shipSvcMapper, data);
		}
	}


	// 카운트 - 목록일 경우와 검색일 경우를 각각 구현
	public int count(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC " + "where instr(" + pageVO.getColumn() + ", ?) > 0";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 로그인한 사용자의 구매서 정보 조회를 위해 목록일 경우와 검색일 경우 각각 구현
	public int loginIdcount(PageVO pageVO, String memberId) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC " + "where instr(" + pageVO.getColumn()
					+ ", ?) > 0 and SHIPSVC_customer_id=?";
			Object[] data = { pageVO.getKeyword(), memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC where SHIPSVC_customer_id=?";
			Object[] data = { memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
	}

	// 카운트 - 주문정보 확인중의 목록일 경우와 검색일 경우를 각각 구현
	public int orderCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC where instr(" + pageVO.getColumn()
					+ ", ?) > 0 AND SHIPSVC_STATUS='주문정보 확인 중'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC where SHIPSVC_STATUS='주문정보 확인 중'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 주문정보 배송대기의 목록일 경우와 검색일 경우를 각각 구현
	public int processCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC where instr(" + pageVO.getColumn() + ", ?) > 0 AND SHIPSVC_STATUS='결제완료'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC where SHIPSVC_STATUS='결제완료'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 주문정보의 배송 상태가 '배송 중'이고 로그인한 사용자인 경우에 대해 목록과 검색일 경우를 각각 구현
	public int shippingCount(PageVO pageVO, String memberId) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC where instr(" + pageVO.getColumn()
					+ ", ?) > 0 AND SHIPSVC_STATUS='배송 중' AND SHIPSVC_CUSTOMER_ID=? ";
			Object[] data = { pageVO.getKeyword(), memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC where SHIPSVC_status='배송 중' and SHIPSVC_customer_id=?";
			Object[] data = { memberId };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		}
	}

	// 카운트 - 주문정보 배송완료의 목록일 경우와 검색일 경우를 각각 구현
	public int completeCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC where instr(" + pageVO.getColumn() + ", ?) > 0 AND SHIPSVC_STATUS='배송완료'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC where SHIPSVC_STATUS='배송완료'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 주문정보 확인 중, 결제 대기 중인 구매서 목록/검색 각각 구현
	public int pendingPaymentCount(PageVO pageVO, String loginId) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC where instr(" + pageVO.getColumn()
					+ ", ?) > 0 AND ( SHIPSVC_STATUS='주문정보 확인 중' OR SHIPSVC_STATUS='결제 대기 중')";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC where SHIPSVC_STATUS='주문정보 확인 중' OR SHIPSVC_STATUS='결제 대기 중'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 카운트 - 주문정보 취소 목록일 경우와 검색일 경우를 각각 구현
	public int cancelCount(PageVO pageVO) {
		if (pageVO.isSearch()) {// 검색
			String sql = "select count(*) from SHIPSVC where instr(" + pageVO.getColumn() + ", ?) > 0 AND SHIPSVC_STATUS='주문취소'";
			Object[] data = { pageVO.getKeyword() };
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {// 목록
			String sql = "select count(*) from SHIPSVC where SHIPSVC_STATUS='주문취소'";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}

	// 단일조회 - 번호로 조회
	public ShipSvcDto selectOne(int shipSvcNo) {
		String sql = "select * from SHIPSVC where shipsvc_no = ?";
		Object[] data = { shipSvcNo };
		List<ShipSvcDto> list = jdbcTemplate.query(sql, shipSvcMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// 주문정보 확인중일때 해외 센터에 물건 도착해서 관리자가 무게 측정해서 금액 얼만지 알려주는 구문
	public boolean update(ShipSvcDto shipSvcDto) {
		String sql = "update SHIPSVC "
				+ "set SHIPSVC_ITEM_VAT=?, SHIPSVC_SERVICE_FEE=?, SHIPSVC_TOTAL_PRICE_KRW=?, SHIPSVC_STATUS=? ,"
				+ "SHIPSVC_ITEM_WEIGHT = ? where shipsvc_no = ?";
		Object[] data = { 
				shipSvcDto.getShipSvcItemVat(), shipSvcDto.getShipSvcServiceFee(),shipSvcDto.getShipSvcTotalPriceKrw(),
				shipSvcDto.getShipSvcStatus(), shipSvcDto.getShipSvcItemWeight(),shipSvcDto.getShipSvcNo()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 한국으로 관리자가 보내는 송장번호 업데이트 구문
	public boolean updateAWB(ShipSvcDto shipSvcDto) {
		String sql = "update SHIPSVC "
				+ "set SHIPSVC_SHIPPER=?, SHIPSVC_AWB_NUMBER=?, SHIPSVC_ADMIN_COMMENT=?, "
				+ "SHIPSVC_STATUS= '배송 중' ,SHIPSVC_SHIP_DATE=sysdate "
				+ "where shipsvc_no = ?";
		Object[] data = { 
				shipSvcDto.getShipSvcShipper(), shipSvcDto.getShipSvcAwbNumber(),
				shipSvcDto.getShipSvcAdminComment(),shipSvcDto.getShipSvcNo()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}

	// SHIPSVC+크레딧/포인트 연결 구매서
	public PaymentVO getPaymentInfo(int shipSvcNo) {
		String sql = "SELECT " + " SHIPSVC.SHIPSVC_no, SHIPSVC.SHIPSVC_NAME_KOR, SHIPSVC.SHIPSVC_NAME_ENG, SHIPSVC.SHIPSVC_STATUS, "
				+ " SHIPSVC.SHIPSVC_FX_RATE, SHIPSVC.SHIPSVC_FX, SHIPSVC.SHIPSVC_ITEM_PRICE_KRW, "
				+ " SHIPSVC.SHIPSVC_ITEM_VAT, SHIPSVC.SHIPSVC_SERVICE_FEE, SHIPSVC.SHIPSVC_TOTAL_PRICE_KRW, "
				+ " MEMBER.MEMBER_CREDIT, MEMBER.MEMBER_POINT " + "FROM SHIPSVC "
				+ "JOIN MEMBER ON SHIPSVC.SHIPSVC_CUSTOMER_ID = MEMBER.MEMBER_ID " + "WHERE SHIPSVC.SHIPSVC_no = ?";
		Object[] data = { shipSvcNo };
		List<PaymentVO> list = jdbcTemplate.query(sql, paymentVOMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	// 상태 변수 변경 , 결제시간 변경
	public void updateStatus(ShipSvcDto shipSvcDto) {
		String sql = "update SHIPSVC set SHIPSVC_status=?,SHIPSVC_pay_date = sysdate where shipsvc_no=?";
		Object[] data = { shipSvcDto.getShipSvcStatus(), shipSvcDto.getShipSvcStatus() };
		jdbcTemplate.update(sql, data);
	}

	public void updateCancelStatus(int shipSvcNo) {
		String sql = "update SHIPSVC set SHIPSVC_status='주문취소', SHIPSVC_pay_date = sysdate where shipsvc_no=?";
		Object[] data = { shipSvcNo };
		jdbcTemplate.update(sql, data);
	}

	// D(delete)
	public boolean delete(int shipSvcNo) {
		String sql = "delete SHIPSVC where shipsvc_no = ?";
		Object[] data = { shipSvcNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 목록일 경우 카운트
	public int count() {
		String sql = "select count(*) from SHIPSVC";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	// 회원 각자의 구매서 총 개수 구하기
	public int countEachMember(String memberId) {
		String sql = "select count(*) from SHIPSVC where SHIPSVC_customer_id=?";
		Object[] data = { memberId };

		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	// 목록 페이징
	public List<ShipSvcDto> selectListByPaging(PageVO pageVO, String loginId) {
		String sql = "select * from (" + "select rownum rn, TMP.* from ( " + "select "
				+ "SHIPSVC_NO, SHIPSVC_ITEM_ENG_NAME, SHIPSVC_ITEM_CATEGORY, " + "SHIPSVC_SDATE, SHIPSVC_STATUS, SHIPSVC_AWB_NUMBER, SHIPSVC_FX, "
				+ "SHIPSVC_SERVICE_FEE, SHIPSVC_TOTAL_PRICE_KRW, SHIPSVC_ITEM_PRICE_KRW " + "from SHIPSVC " + "where SHIPSVC_customer_id=?"
				+ "order by SHIPSVC_sdate desc" + ")TMP" + ") where rn between ? and ?";
		Object[] data = { loginId, pageVO.getBeginRow(), pageVO.getEndRow() };

		return jdbcTemplate.query(sql, shipSvcListMapper, data);
	}

	// 배송 중인 구매서에 대한 페이징
	public List<ShipSvcDto> selectShippingListByPaging(PageVO pageVO, String loginId) {
		String sql = "select * from (select rownum rn, TMP.* from ( "
				+ "select * from SHIPSVC "
				+ "where SHIPSVC_status='배송 중' and SHIPSVC_customer_id=? " 
				+ "order by SHIPSVC_sdate desc" 
				+ ")TMP) where rn between ? and ?";
		Object[] data = { loginId, pageVO.getBeginRow(), pageVO.getEndRow() };

		return jdbcTemplate.query(sql, shipSvcListMapper, data);
	}

	// 주문정보 확인 중, 결제 대기 중인 구매서에 대해 페이징
	public List<ShipSvcDto> selectpendingPaymentListByPaging(PageVO pageVO, String loginId) {
		String sql = "select * from (select rownum rn, TMP.* from ( " 
				+ "select * from SHIPSVC "
				+ "where (SHIPSVC_STATUS='주문정보 확인 중' OR SHIPSVC_STATUS='결제 대기 중') and SHIPSVC_customer_id=? "
				+ "order by SHIPSVC_sdate desc"
				+ ")TMP) where rn between ? and ?";
		Object[] data = { loginId, pageVO.getBeginRow(), pageVO.getEndRow() };

		return jdbcTemplate.query(sql, shipSvcListMapper, data);
	}

	// 결제 완료 목록 조회

	// 결제시간 업데이트
	public boolean shipSvcPayDate(int shipSvcNo) {
		String sql = "update SHIPSVC set SHIPSVC_pay_date = sysdate where shipsvc_no";
		Object[] data = { shipSvcNo };
		return jdbcTemplate.update(sql, data) > 0;
	}

	// 일자별 정산 내역 조회
	public List<SettlementVO> getDailyPayments() {
		String sql = "SELECT TO_CHAR(SHIPSVC_PAY_DATE, 'YYYY-MM-DD') AS SHIPSVC_PAY_DATE, " 
				+ "COUNT(*) AS COUNT, SUM(SHIPSVC_TOTAL_PRICE_KRW) AS SHIPSVC_TOTAL_PRICE_KRW " 
				+ "FROM SHIPSVC WHERE SHIPSVC_PAY_DATE IS NOT NULL "
				+ "GROUP BY TO_CHAR(SHIPSVC_PAY_DATE, 'YYYY-MM-DD') "
				+ "ORDER BY SHIPSVC_PAY_DATE DESC";
		return jdbcTemplate.query(sql, settlementVOMapper);
	}

	// 날짜 기간 선택 조회
	public List<SettlementVO> periodPayments(String startDate, String endDate) {
		String sql = "SELECT TO_CHAR(SHIPSVC_PAY_DATE, 'YYYY-MM-DD') AS SHIPSVC_PAY_DATE, " 
				+ "COUNT(*) AS COUNT, SUM(SHIPSVC_TOTAL_PRICE_KRW) AS SHIPSVC_TOTAL_PRICE_KRW "
				+ "FROM SHIPSVC WHERE SHIPSVC_PAY_DATE BETWEEN TO_DATE(?, 'YYYY-MM-DD') " 
				+ "AND TO_DATE(?, 'YYYY-MM-DD') + 1 GROUP BY TO_CHAR(SHIPSVC_PAY_DATE, 'YYYY-MM-DD') "
				+ "ORDER BY SHIPSVC_PAY_DATE DESC";
		Object[] data = { startDate, endDate };
		return jdbcTemplate.query(sql, settlementVOMapper, data);
	}

	// 일자별 상세
	public List<DailyDetailVO> dailyDetail(String shipSvcPayDate) {
		String sql = "SELECT SHIPSVC_PAY_DATE, SHIPSVC_no, SHIPSVC_CUSTOMER_ID, "
				+ "SHIPSVC_NAME_KOR, SHIPSVC_ITEM_ENG_NAME, SHIPSVC_TOTAL_PRICE_KRW, "
				+ "SHIPSVC_QTY, SHIPSVC_ITEM_VAT, SHIPSVC_AWB_NUMBER, SHIPSVC_SDATE " 
				+ "FROM SHIPSVC WHERE "
				+ "TRUNC(SHIPSVC_PAY_DATE) = TO_DATE(?, 'YYYY-MM-DD') ORDER BY "
				+ "SHIPSVC_PAY_DATE DESC";
		Object[] data = { shipSvcPayDate };
		return jdbcTemplate.query(sql, dailyDetailVOMapper, data);
	}

	public List<VatListVO> getVatListByYear(String year) {
		String sql = "SELECT TO_CHAR(SHIPSVC_SDATE, 'YYYY-Q') AS QUARTER, " + "SUM(SHIPSVC_ITEM_VAT) AS VAT_TOTAL " 
				+ "FROM SHIPSVC WHERE EXTRACT(YEAR FROM SHIPSVC_SDATE) = ? "
				+ "GROUP BY TO_CHAR(SHIPSVC_SDATE, 'YYYY-Q')";
		return jdbcTemplate.query(sql, vatListVOMapper, Integer.parseInt(year));
	}

	// 배송중으로 바뀐 시점부터 7일뒤 배송완료로
	public void compareDate(List<ShipSvcDto> dateList) {
		String sql = "UPDATE SHIPSVC SET SHIPSVC_STATUS = '배송완료' WHERE SHIPSVC_SHIP_DATE + 7 < sysdate";
		jdbcTemplate.update(sql);
	}

}
