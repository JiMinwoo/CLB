package com.itbank.clb.DTO;

public class SearchDTO {
	private String sc; // 검색어
	private int pagenum; // 페이지번호
	
	public String getSc() {
		return sc;
	}
	public void setSc(String sc) {
		this.sc = sc;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
}
