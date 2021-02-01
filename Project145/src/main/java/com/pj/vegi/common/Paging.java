package com.pj.vegi.common;

public class Paging {
	int pageUnit=10 ; 		//한페이지 출력할 레코드 건수
	int pageSize=10 ; 		//페이지번호 수 (5) 1~ 5까지
	int lastPage;     		//마지막 페이지번호
	int totalRecord = 21;	//전체 레코드건수
	Integer page = 1;			//현재 페이지
	int startPage;
	int endPage;
	int first;				//페이지 번호에 해당하는 시작글번호
	int last;				//페이지 번호에 해당하는 마지막글번호

	
	
	
	public int getFirst() {
		first = (getPage() - 1) * getPageUnit() + 1;
		return first;
	}
	public int getLast() {
		last = getPage() * getPageUnit();
		return last;
	}


	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getLastPage() {
		lastPage = totalRecord / pageUnit + 
				   ( totalRecord % pageUnit>0 ? 1 : 0 );
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getStartPage() {
		startPage = (page-1)/pageSize * pageSize + 1;
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		endPage = (page-1)/pageSize  * pageSize  + pageSize ;
		if ( endPage > getLastPage() )
			endPage = getLastPage() ;
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "Paging [pageUnit=" + pageUnit + ", pageSize=" + pageSize + ", lastPage=" + lastPage + ", totalRecord="
				+ totalRecord + ", page=" + page + ", startPage=" + startPage + ", endPage=" + endPage + ", first="
				+ first + ", last=" + last + "]";
	}

}