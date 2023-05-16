package com.ducks.demys.command;

import org.springframework.web.bind.annotation.RequestParam;

public class SearchCriteria {
	private int page;          // 해당, 현재페이지
	private int perPageNum;    // 페이지안에 있는 컬럼갯수(게시글갯수)
	private String keyword;    // 검색어
	private String searchType; // 검색어종류
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setPage(String page) {
		this.page = Integer.parseInt(page);
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = Integer.parseInt(perPageNum);
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	//DAO에서 사용, 각페이지 시작 행번호
	public int getStartRowNum() {
		return (this.page-1)*this.perPageNum;
	}
	
}
