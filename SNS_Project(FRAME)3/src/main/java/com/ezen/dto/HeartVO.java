package com.ezen.dto;

public class HeartVO {
	
	private int hSeq;
	private int bSeq;
	private String id; 
	private String use_like;
	
	
	
	public int gethSeq() {
		return hSeq;
	}
	public void sethSeq(int hSeq) {
		this.hSeq = hSeq;
	}
	public int getbSeq() {
		return bSeq;
	}
	public void setbSeq(int bSeq) {
		this.bSeq = bSeq;
	}
	public int getBseq() {
		return bSeq;
	}
	public void setBseq(int bseq) {
		this.bSeq = bseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUse_like() {
		return use_like;
	}
	public void setUse_like(String use_like) {
		this.use_like = use_like;
	}
	@Override
	public String toString() {
		return "HeartVO [hSeq=" + hSeq + ", bSeq=" + bSeq + ", id=" + id
				+ ", use_like=" + use_like + "]";
	}
	
	
	
}
