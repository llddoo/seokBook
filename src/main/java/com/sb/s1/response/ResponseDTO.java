package com.sb.s1.response;

import java.sql.Date;

public class ResponseDTO {
	private long resnum;
	private String id;
	private Date regdate;
	private String content;
	private long subnum;
	private long ref;
	private long step;
	private long depth;
	
	public long getResnum() {
		return resnum;
	}
	public void setResnum(long resnum) {
		this.resnum = resnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getSubnum() {
		return subnum;
	}
	public void setSubnum(long subnum) {
		this.subnum = subnum;
	}
	public long getRef() {
		return ref;
	}
	public void setRef(long ref) {
		this.ref = ref;
	}
	public long getStep() {
		return step;
	}
	public void setStep(long step) {
		this.step = step;
	}
	public long getDepth() {
		return depth;
	}
	public void setDepth(long depth) {
		this.depth = depth;
	}
}
