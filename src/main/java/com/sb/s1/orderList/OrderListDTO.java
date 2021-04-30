package com.sb.s1.orderList;

public class OrderListDTO {
	
	private String ordernumber;
    private long pointusage;
    private long lumpsum;
    
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public long getPointusage() {
		return pointusage;
	}
	public void setPointusage(long pointusage) {
		this.pointusage = pointusage;
	}
	public long getLumpsum() {
		return lumpsum;
	}
	public void setLumpsum(long lumpsum) {
		this.lumpsum = lumpsum;
	}
}
