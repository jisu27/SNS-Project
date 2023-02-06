package com.ezen.dto;

import java.util.Date;

public class CommentVO {
	private int cseq;
	private int bseq;
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
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
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
		return "SnsCommentVO [cseq=" + cseq + ", bseq=" + bseq + ", id=" + id + ", ccontent=" + ccontent + ", indate="
				+ indate + "]";
	}
	
}
