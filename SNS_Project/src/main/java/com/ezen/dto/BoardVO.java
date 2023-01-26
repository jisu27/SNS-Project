package com.ezen.dto;

import java.util.Date;

public class BoardVO {
	private int bSeq;
	private String title;
	private String id;
	private int pay;
	private String content;
	private String upload;
	private Date inDate;
	
	public int getbSeq() {
		return bSeq;
	}
	public void setbSeq(int bSeq) {
		this.bSeq = bSeq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	@Override
	public String toString() {
		return "BoardVO [bSeq=" + bSeq + ", title=" + title + ", id=" + id + ", pay=" + pay + ", content=" + content
				+ ", upload=" + upload + ", inDate=" + inDate + "]";
	}
	
	
	
}
