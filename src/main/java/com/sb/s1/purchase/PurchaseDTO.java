package com.sb.s1.purchase;

import java.sql.Date;

public class PurchaseDTO {

	private long purnum;
	private Date purdate;
	private String isbn;
	private Date remdate;
	private String id;
	private long price;
	private long purcount;
	private long ordernum;
	
	public long getPurcount() {
		return purcount;
	}
	public void setPurcount(long purcount) {
		this.purcount = purcount;
	}
	public long getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(long ordernum) {
		this.ordernum = ordernum;
	}
	public long getPurnum() {
		return purnum;
	}
	public void setPurnum(long purnum) {
		this.purnum = purnum;
	}
	public Date getPurdate() {
		return purdate;
	}
	public void setPurdate(Date purdate) {
		this.purdate = purdate;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public Date getRemdate() {
		return remdate;
	}
	public void setRemdate(Date remdate) {
		this.remdate = remdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	
	
	
}
