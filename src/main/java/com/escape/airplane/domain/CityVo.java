package com.escape.airplane.domain;

public class CityVo {

	// city_tb, country_tb
	private int city_idx;
	private int country_idx;
	private String name;
	private String ename;
	
	// Constructor
	public CityVo() {}
	public CityVo(int city_idx, int country_idx, String name, String ename) {
		super();
		this.city_idx = city_idx;
		this.country_idx = country_idx;
		this.name = name;
		this.ename = ename;
	}
		
	// Getter/Setter
	public int getCity_idx() {
		return city_idx;
	}
	public void setCity_idx(int city_idx) {
		this.city_idx = city_idx;
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
		return "CityVo [city_idx=" + city_idx + ", country_idx=" + country_idx + ", name=" + name + ", ename=" + ename
				+ "]";
	}	
	
}
