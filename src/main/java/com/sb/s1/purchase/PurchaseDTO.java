package com.sb.s1.purchase;

import java.sql.Date;

public class PurchaseDTO {

	private long purnum;
	private Date purdate;
	private String isbn;
	private long remdate;
	private String id;
	private long price;
	private long purcount;
	private String ordernumber;
	
	
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public long getPurcount() {
		return purcount;
	}
	public void setPurcount(long purcount) {
		this.purcount = purcount;
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
	public long getRemdate() {
		return remdate;
	}
	public void setRemdate(long remdate) {
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
