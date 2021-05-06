package com.sb.s1.member;

public class MemberPager {

	private long perPage;
	private long perBlock;
	
	public MemberPager() {
			this.perPage = 10;
			this.perBlock = 5;
			this.curPage = 1;
			
	}

	private long curPage;
	
	private long startRow;
	private long endRow;

	public void makeRow() {
		this.startRow = (this.curPage-1)*perPage+1;
		this.endRow = this.curPage*this.perPage;
	}

	private long totalPage;
	private long startBlock;
	private long endBlock;
	private boolean pre;
	private boolean next;
	
	public void makeNum(long totalCount) {
		this.totalPage = totalCount/this.perPage;
		
		if(totalCount%this.perPage != 0) {
			totalPage++;
		}
		
		
		
		long totalBlock = this.totalPage / this.perBlock;
		
		if(this.totalPage%this.perBlock != 0) {
			totalBlock++;
		}
		
		
		long curBlock = this.curPage / this.perBlock;
		
		if(this.curPage%this.perBlock != 0) {
			curBlock++;
		}
		
		
		
		
		
		
		this.startBlock = (curBlock-1)*this.perBlock+1;
		this.endBlock = curBlock*this.perBlock;
		
		if(curBlock == totalBlock) {
			this.endBlock = this.totalPage;
		}
		
		if(curBlock > 1) {
			this.pre = true;
		}
		if(curBlock != totalBlock) {
			this.next = true;
		}
	}

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
	
	
	private String kind;
	private String search;

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if(this.search == null) {
			this.search="";
		}
		return search;
	}

	public void setSearch(String search) {
		if(search == null) {
			search = "";
		}
		this.search = search;
	}
	
}