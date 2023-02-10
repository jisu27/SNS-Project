package com.ezen.dto;

public class BookMarkVO {
	private int bmSeq;
	private int bSeq;
	private int sSeq;
	private String bmTitle;
	private String bmUrl;
	private String id;

	public int getBmSeq() {
		return bmSeq;
	}

	public void setBmSeq(int bmSeq) {
		this.bmSeq = bmSeq;
	}

	public int getbSeq() {
		return bSeq;
	}

	public void setbSeq(int bSeq) {
		this.bSeq = bSeq;
	}

	public int getsSeq() {
		return sSeq;
	}

	public void setsSeq(int sSeq) {
		this.sSeq = sSeq;
	}

	public String getBmTitle() {
		return bmTitle;
	}

	public void setBmTitle(String bmTitle) {
		this.bmTitle = bmTitle;
	}

	public String getBmUrl() {
		return bmUrl;
	}

	public void setBmUrl(String bmUrl) {
		this.bmUrl = bmUrl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "BookMarkVO [bmSeq=" + bmSeq + ", bSeq=" + bSeq + ", sSeq=" + sSeq + ", bmTitle=" + bmTitle + ", bmUrl="
				+ bmUrl + ", id=" + id + "]";
	}

}
