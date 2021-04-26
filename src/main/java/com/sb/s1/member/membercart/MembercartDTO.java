package com.sb.s1.member.membercart;

import com.sb.s1.bookList.BookListDTO;

public class MembercartDTO {

	private long cartNum;
	private long bookcount;
	private String id;
	private String isbn;
	private BookListDTO bookListDTO;
	
	
	public BookListDTO getBookListDTO() {
		return bookListDTO;
	}
	public void setBookListDTO(BookListDTO bookListDTO) {
		this.bookListDTO = bookListDTO;
	}
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
