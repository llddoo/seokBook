package com.sb.s1.member.membercart;

public class MembercartDTO {

	private long cartNum;
	private String id;
	private String isbn;
	private long bookcount;
	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}	
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
	public long getBookcount() {
		return bookcount;
	}
	public void setBookcount(long bookcount) {
		this.bookcount = bookcount;
	}
}
