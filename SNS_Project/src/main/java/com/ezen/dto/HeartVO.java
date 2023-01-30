package com.ezen.dto;

public class HeartVO {
	int bSeq;
	String id; 
	String use_like;
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
		return "HeartVO [bseq=" + bSeq + ", id=" + id + ", use_like=" + use_like + "]";
	}
	
	
	
}
