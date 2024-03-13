package com.kh.da4jo.vo;

//페이징에 필요한 클래스
public class PageVO {
	private String column, keyword; //검색항목, 검색어
	
	public PageVO() {
		super();
	}

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
}
