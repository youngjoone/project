package com.hk.project.page.vo;

public class Criteria { //검색기준
	 
	//페이지 정보 ,페이지 크기
	private int page; //현재 페이지 번호
	private int pageSize; //한 페이지에 출력할 개수
    
	public Criteria() {
		this.page = 1;
		this.pageSize = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <=0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize <=0 || pageSize > 100) {
			this.pageSize = 10;			
			return;
		}
		this.pageSize = pageSize;
	}

	//페이징처리 시작하는 값생성
	//멤버변수가 아니지만 gettet와 setter를 생성하면 Mapper에서 접근가능하다.
	//Mapper에서 사용하는 법 #{pageStart}
	public int getPageStart() {
		return (this.page - 1)*this.pageSize;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + "]";
	}
	
}
