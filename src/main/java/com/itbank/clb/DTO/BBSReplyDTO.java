package com.itbank.clb.DTO;

public class BBSReplyDTO {
	
	private int brnum;
	private String brcontent;
	private String brdate;
	private String id;
	private int fnum;
	
	public int getBrnum() {
		return brnum;
	}
	public void setBrnum(int brnum) {
		this.brnum = brnum;
	}
	public String getBrcontent() {
		return brcontent;
	}
	public void setBrcontent(String brcontent) {
		this.brcontent = brcontent;
	}
	public String getBrdate() {
		return brdate;
	}
	public void setBrdate(String brdate) {
		this.brdate = brdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
}