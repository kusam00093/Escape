package com.escape.airplane.domain;

public class AirplaneVo {
	
	// airplane_tb
	private int airplane_idx;
	private int airline_idx;
	private String name;
	
	// Constructor
	public AirplaneVo() {}
	public AirplaneVo(int airplane_idx, int airline_idx, String name) {
		super();
		this.airplane_idx = airplane_idx;
		this.airline_idx = airline_idx;
		this.name = name;
	}

	// Getter/Setter
	public int getAirplane_idx() {
		return airplane_idx;
	}
	public void setAirplane_idx(int airplane_idx) {
		this.airplane_idx = airplane_idx;
	}
	public int getAirline_idx() {
		return airline_idx;
	}
	public void setAirline_idx(int airline_idx) {
		this.airline_idx = airline_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// toString
	@Override
	public String toString() {
		return "AirplaneVo [airplane_idx=" + airplane_idx + ", airline_idx=" + airline_idx + ", name=" + name + "]";
	}
	
}