package com.sb.s1.util;

public class Pager {
	private long perPage;
	private long perBlock;
	private long curPage;
	private long curBlock;
	
	public Pager() {
		this.perPage = 20;
		this.perBlock = 10;
		this.curPage = 1;
	}
	
	private long startRow;
	private long endRow;
	private long totalPage;
	private long totalBlock;
	private long startBlock;
	private long endBlock;
	private boolean pre;
	private boolean next;
	
	public void makecal(long totalcount) {
		this.endRow = this.curPage * this.perPage;
		this.startRow = this.endRow - this.perPage + 1;
		this.totalPage = ((totalcount%perPage==0) ? (totalcount/perPage) : (totalcount/perPage+1));
		this.totalBlock = ((this.totalPage%this.perBlock==0) ? (this.totalPage/this.perBlock) 
															: (this.totalPage/this.perBlock+1));
		this.makeblock(totalcount);
	}
	
	public void makeblock(long totalcount) {
		this.endBlock = this.curBlock * this.perBlock;
		this.startBlock = this.endBlock - this.perBlock + 1;
		if(this.curBlock == this.totalBlock) {
			this.endBlock = this.totalPage;
		}
		if(this.curBlock>1) {
			this.pre=true;
		}
		if(this.curBlock != this.totalBlock) {
			this.next=true;
		}
	}
	
	private String kind;
	private String search;
	
	public long getPerPage() {
		return perPage;
	}
	public void setPerPage(long perPage) {
		this.perPage = perPage;
	}
	public long getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(long perBlock) {
		this.perBlock = perBlock;
	}
	public long getCurPage() {
		return curPage;
	}
	public void setCurPage(long curPage) {
		this.curPage = curPage;
	}
	public long getStartRow() {
		return startRow;
	}
	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}
	public long getEndRow() {
		return endRow;
	}
	public void setEndRow(long endRow) {
		this.endRow = endRow;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public long getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(long startBlock) {
		this.startBlock = startBlock;
	}
	public long getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(long endBlock) {
		this.endBlock = endBlock;
	}
	public boolean isPre() {
		return pre;
	}
	public void setPre(boolean pre) {
		this.pre = pre;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getKind() {
		return this.kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getSearch() {
		return ((search==null)?"":this.search);
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public long getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(long curBlock) {
		this.curBlock = curBlock;
	}
	public long getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(long totalBlock) {
		this.totalBlock = totalBlock;
	}
	
	private String boardsp;
	private long subnum;
	private long gNumber;
	private String id;
	private String isbn;
	
	
	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public long getgNumber() {
		return gNumber;
	}

	public void setgNumber(long gNumber) {
		this.gNumber = gNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public long getgnumber() {
		return gNumber;
	}
	public void setgnumber(long gNumber) {
		this.gNumber = gNumber;
	}
	public void setSubnum(long subnum) {
		this.subnum = subnum;
	}
	public long getSubnum() {
		return subnum;
	}
	public String getBoardsp() {
		return boardsp;
	}
	public void setBoardsp(String boardsp) {
		this.boardsp = boardsp;
	}
}
