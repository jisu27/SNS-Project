package com.ezen.dto;

import java.util.Date;

public class CommentVO {
	private int cseq;
	private int bSeq;
	private String id;
	private String ccontent;
	private Date indate;
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public int getBseq() {
		return bSeq;
	}
	public void setBseq(int bSeq) {
		this.bSeq = bSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "SnsCommentVO [cseq=" + cseq + ", bseq=" + bSeq + ", id=" + id + ", ccontent=" + ccontent + ", indate="
				+ indate + "]";
	}
	
}
