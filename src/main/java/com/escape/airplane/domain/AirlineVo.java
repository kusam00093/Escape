package com.escape.airplane.domain;

public class AirlineVo {

	// airline_tb
	private int airline_idx;
	private int user_idx;
	private String name;
	private int cnum;
	private String phone;
	private String logo;
	
	// Constructor
	public AirlineVo() {}
	public AirlineVo(int airline_idx, int user_idx, String name, int cnum, String phone, String logo) {
		super();
		this.airline_idx = airline_idx;
		this.user_idx = user_idx;
		this.name = name;
		this.cnum = cnum;
		this.phone = phone;
		this.logo = logo;
	}
	
	// Getter/Setter
	public int getAirline_idx() {
		return airline_idx;
	}
	public void setAirline_idx(int airline_idx) {
		this.airline_idx = airline_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	// toString
	@Override
	public String toString() {
		return "AirlineVo [airline_idx=" + airline_idx + ", user_idx=" + user_idx + ", name=" + name + ", cnum=" + cnum
				+ ", phone=" + phone + ", logo=" + logo + "]";
	}
	
}
