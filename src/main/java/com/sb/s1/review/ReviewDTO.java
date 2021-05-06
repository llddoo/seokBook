package com.sb.s1.review;

import java.sql.Date;

public class ReviewDTO {

	private long reviewNum;
	private String id;
	private String isbn;
	private String revContent;
	private Date regDate;
	private long revScore;

	
	public long getRevScore() {
		return revScore;
	}
	public void setRevScore(long revScore) {
		this.revScore = revScore;
	}
	public long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(long reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
}
