package com.sb.s1.member.membercart;

public class MembercartDTO {

	private long cartNum;
	private String id;
	private String ISBN;
	private long bookcount;
	
	
	public long getCartNum() {
		return cartNum;
	}
	public void setCartNum(long cartNum) {
		this.cartNum = cartNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public long getBookcount() {
		return bookcount;
	}
	public void setBookcount(long bookcount) {
		this.bookcount = bookcount;
	}
}
