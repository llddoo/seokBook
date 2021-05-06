package com.sb.s1.purchase;

import java.sql.Date;

import com.sb.s1.bookList.BookListDTO;

public class PurchaseDTO{

	private long purnum;
	private Date purdate;
	private String isbn;
	private long remdate;
	private String id;
	private long price;
	private long purcount;
	private String ordernumber;
	private BookListDTO bookListDTO;
	private String bookName;
	private String gname;
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public BookListDTO getBookListDTO() {
		return bookListDTO;
	}
	public void setBookListDTO(BookListDTO bookListDTO) {
		this.bookListDTO = bookListDTO;
	}
	
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
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
