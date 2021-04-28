package com.sb.s1.address;

public class AddressDTO {
	
	private long adrnum;
	private String address;
	private String id;
	private String name;
	private String phonenum;
	private String recentuse;
	private String postcode;
	
	
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public long getAdrnum() {
		return adrnum;
	}
	public void setAdrnum(long adrnum) {
		this.adrnum = adrnum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getRecentuse() {
		return recentuse;
	}
	public void setRecentuse(String recentuse) {
		this.recentuse = recentuse;
	}
}
