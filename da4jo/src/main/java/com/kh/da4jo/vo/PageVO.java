package com.kh.da4jo.vo;

//페이징에 필요한 클래스
public class PageVO {
	private String column;
	private String keyword; //검색항목, 검색어
	private int count; //전체 글 수
	private int page=1; //현재 페이지
	private int size=10;//한 페이지에 보여줄 게시글 개수
	private int blockSize=10;//블럭 표시 개수
	
	
	public PageVO() {
		super();
	}

	//Getter&Setter
	public String getColumn() {
		if(column == null) return "";
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getKeyword() {
		if(keyword == null) return "";
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	
	//계산을 위한 Getter메소드
	public boolean isSearch() {
		return column != null && keyword != null;

	}
	public int getBeginRow() { //페이징 시작 번호
		//return getEndRow() - (page-1);
		return page * size - (size-1); 
	}
	public int getEndRow() { //페이징 끝 번호
		return page * size;
	}
	
	public int getTotalPage() { //총 보여질 페이지
		return (count-1) / size + 1;
	}
	public int getBeginBlock() { 
		return (page-1) / blockSize * blockSize + 1;
	}
	public int getEndBlock() { 
		int number = (page-1) / blockSize * blockSize + blockSize;
		return Math.min(getTotalPage(), number);		
	}
	

	public boolean isFirstBlock() { //이동을 막을 시작 페이지
		return getBeginBlock() == 1;
	}
	public boolean isLastBlock() { //이동을 막을 끝 페이지
		return getEndBlock() == getTotalPage(); //마지막 블럭번호 == 전체 페이지 수  
	}
	
	//물음표 뒤에 붙는 데이터 중 공통된 부분(size, column, keyword)에 대한 문자열 반환
	public String getQueryString() {
		if(isSearch())
		{
		return "size=" + size + "&column=" + getColumn() + "&keyword=" + getKeyword();
		}
		else {
			return "size=" + size;
		}
	}
	
	public boolean isCurrentPage(int i) { //현재 페이지
		return page == i;
	} 
	
	public int getPrevBlock() {
		return getBeginBlock()-1;
	}
	public int getNextBlock() {
		return getEndBlock() + 1;
	}
	
}
