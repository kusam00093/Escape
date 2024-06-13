package com.escape.airplane.domain;

public class AirportVo {

	// airport_tb
	private int airport_idx;
	private int country_idx;
	private String name;
	private String ename;
	
	// Constructor
	public AirportVo() {}
	public AirportVo(int airport_idx, int country_idx, String name, String ename) {
		super();
		this.airport_idx = airport_idx;
		this.country_idx = country_idx;
		this.name = name;
		this.ename = ename;
	}

	// Getter/Setter
	public int getAirport_idx() {
		return airport_idx;
	}
	public void setAirport_idx(int airport_idx) {
		this.airport_idx = airport_idx;
	}
	public int getCountry_idx() {
		return country_idx;
	}
	public void setCountry_idx(int country_idx) {
		this.country_idx = country_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
	// toString
	@Override
	public String toString() {
		return "AirportVo [airport_idx=" + airport_idx + ", country_idx=" + country_idx + ", name=" + name + ", ename="
				+ ename + "]";
	}
	
}
