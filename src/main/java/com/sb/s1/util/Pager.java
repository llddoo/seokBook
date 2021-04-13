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
	private long startNum;
	private long endNum;
	private boolean pre;
	private boolean next;
	
	public void makecal(long totalcount) {
		this.endRow = this.curPage*this.perPage;
		this.startRow = this.endRow - this.perPage + 1;
		this.totalPage = ((totalcount%perPage==0) ? (totalcount/perPage) : (totalcount/perPage+1));
		this.totalBlock = ((this.totalPage%this.perBlock==0) ? (this.totalPage/this.perBlock) 
															: (this.totalPage/this.perBlock+1));
		this.curBlock = ((this.curPage%this.perBlock==0) ? (this.curPage/this.perBlock) 
														: (this.curPage/this.perBlock+1));
		
		
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
	public long getStartNum() {
		return startNum;
	}
	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}
	public long getEndNum() {
		return endNum;
	}
	public void setEndNum(long endNum) {
		this.endNum = endNum;
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
		return ((kind==null) ? "" : this.kind);
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
}
