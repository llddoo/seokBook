package com.sb.s1.storeBook;

public class StoreBookDTO {
	
	private String storeNumber; //저장번호
	private long bookCount;		//책 개수
	private long branchNum;		//지부 번호
	private String icbn;	
	
	public String getStoreNumber() {
		return storeNumber;
	}
	public void setStoreNumber(String storeNumber) {
		this.storeNumber = storeNumber;
	}
	public long getBookCount() {
		return bookCount;
	}
	public void setBookCount(long bookCount) {
		this.bookCount = bookCount;
	}
	public long getBranchNum() {
		return branchNum;
	}
	public void setBranchNum(long branchNum) {
		this.branchNum = branchNum;
	}
	public String getIcbn() {
		return icbn;
	}
	public void setIcbn(String icbn) {
		this.icbn = icbn;
	}
	
	
}
