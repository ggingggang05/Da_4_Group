package com.kh.da4jo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.da4jo.dto.PoDto;
import com.kh.da4jo.mapper.PoListMapper;
import com.kh.da4jo.mapper.PoMapper;
import com.kh.da4jo.vo.PageVO;

@Repository
public class PoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private PoMapper poMapper;
	@Autowired
	private PoListMapper poListMapper;

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

	//단일조회
	public PoDto selectOne(int poNo) {
		String sql = "select * from po where po_no = ?";
		Object[] data = {poNo};
		List<PoDto> list = jdbcTemplate.query(sql, poMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	// U(update) 상품가격만 알려주는 업데이트
	public boolean update(PoDto poDto) {
		String sql = "update po "
						+ "set PO_ITEM_VAT=?, PO_SERVICE_FEE=?, PO_TOTAL_PRICE_KRW=? "
						+ "where po_no = ?";
		Object[] data = {
			poDto.getPoItemVat(), poDto.getPoServiceFee(),
			poDto.getPoTotalPriceKrw()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	
	

	// D(delete)
	public boolean delete(int poNo) {
		String sql = "delete po where po_no = ?";
		Object[] data = {poNo};
		return jdbcTemplate.update(sql, data) > 0;
	}

	//목록일 경우 카운트
	public int count() {
		String sql = "select count(*) from po";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	//목록 페이징
	public List<PoDto> selectListByPaging(PageVO pageVO, String loginId) {
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ( "
						+ "select "
							+ "po_no, po_item_eng_name, po_item_category, "
							+ "po_sdate, po_status, po_awb_number, po_fx, "
							+ "po_service_fee, po_total_price_krw "
						+ "from po "
						+ "where po_customer_id=?"
						+ "order by po_sdate desc"
						+ ")TMP"
					+ ") where rn between ? and ?";
		Object[] data = {loginId, pageVO.getBeginRow(), pageVO.getEndRow()};
		
		return jdbcTemplate.query(sql, poListMapper, data);
	}

}
