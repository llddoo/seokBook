package com.sb.s1.board;

import java.sql.Date;

public class BoardDTO {
	private long subnum;
	private String id;
	private Date regdate;
	private String content;
	private String subname;
	private String boardsp;
	private long visitcount;
	
	public long getSubnum() {
		return subnum;
	}
	public void setSubnum(long subnum) {
		this.subnum = subnum;
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
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getBoardsp() {
		return boardsp;
	}
	public void setBoardsp(String boardsp) {
		this.boardsp = boardsp;
	}
	public long getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(long visitcount) {
		this.visitcount = visitcount;
	}
}
