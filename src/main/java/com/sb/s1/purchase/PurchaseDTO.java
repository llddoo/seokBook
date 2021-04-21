package com.sb.s1.purchase;

import java.sql.Date;

public class PurchaseDTO {

	private long purnum;
	private Date purdate;
	private String icbn;
	private Date remdate;
	private String id;
	private long price;
	
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
	public String getIcbn() {
		return icbn;
	}
	public void setIcbn(String icbn) {
		this.icbn = icbn;
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
