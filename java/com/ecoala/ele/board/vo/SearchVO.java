package com.ecoala.ele.board.vo;

/**
 * Class Name  : SearchVO
 * Author      : YoonGaYoung
 * Created Date: 2023. 11. 27.
 * Version: 1.0
 * Purpose:   검색 관련 VO
 * Description: PagingVO를 상속받음
 */
public class SearchVO extends PagingVO {
	
	private String searchWord;
	private String searchOption;
	
	public SearchVO() {
	}

	public SearchVO(String searchWord, String searchOption) {
		this.searchWord = searchWord;
		this.searchOption = searchOption;
	}

	@Override
	public String toString() {
		return "SearchVO [searchWord=" + searchWord + ", searchOption=" + searchOption + "]";
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	
	
	
	
	
	
	
	
	
}
