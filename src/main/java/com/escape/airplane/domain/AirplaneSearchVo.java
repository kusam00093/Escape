package com.escape.airplane.domain;

import java.sql.Time;
import java.util.List;

public class AirplaneSearchVo {

	// Field
	// airplane_time_tb
	private int airplane_time_idx;
	private int airplane_idx;
	private String start_date;
	private String end_date;
	private String start_time;
	private String end_time;
	private int departure_loc;
	private int arrival_loc;
	private int known;
	
	// airplane_price_tb
	private int airplane_price_idx;
	private int price;
	private int ptype_idx;
	private int stype_idx;
	
	// filtering
	private List<String> times;
    private List<String> airlines;
    //private String priceRange;
    private List<String> priceRange;
	
	// Constructor
	public AirplaneSearchVo() {}
	public AirplaneSearchVo(int airplane_time_idx, int airplane_idx, String start_date, String end_date,
			String start_time, String end_time, int departure_loc, int arrival_loc, int known, int airplane_price_idx,
			int price, int ptype_idx, int stype_idx, List<String> times, List<String> airlines, List<String> priceRange) {
		super();
		this.airplane_time_idx = airplane_time_idx;
		this.airplane_idx = airplane_idx;
		this.start_date = start_date;
		this.end_date = end_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.departure_loc = departure_loc;
		this.arrival_loc = arrival_loc;
		this.known = known;
		this.airplane_price_idx = airplane_price_idx;
		this.price = price;
		this.ptype_idx = ptype_idx;
		this.stype_idx = stype_idx;
		this.times = times;
		this.airlines = airlines;
		this.priceRange = priceRange;
	}

	// Getter/Setter
	public int getAirplane_time_idx() {
		return airplane_time_idx;
	}
	public void setAirplane_time_idx(int airplane_time_idx) {
		this.airplane_time_idx = airplane_time_idx;
	}
	public int getAirplane_idx() {
		return airplane_idx;
	}
	public void setAirplane_idx(int airplane_idx) {
		this.airplane_idx = airplane_idx;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public int getDeparture_loc() {
		return departure_loc;
	}
	public void setDeparture_loc(int departure_loc) {
		this.departure_loc = departure_loc;
	}
	public int getArrival_loc() {
		return arrival_loc;
	}
	public void setArrival_loc(int arrival_loc) {
		this.arrival_loc = arrival_loc;
	}
	public int getKnown() {
		return known;
	}
	public void setKnown(int known) {
		this.known = known;
	}
	public int getAirplane_price_idx() {
		return airplane_price_idx;
	}
	public void setAirplane_price_idx(int airplane_price_idx) {
		this.airplane_price_idx = airplane_price_idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPtype_idx() {
		return ptype_idx;
	}
	public void setPtype_idx(int ptype_idx) {
		this.ptype_idx = ptype_idx;
	}
	public int getStype_idx() {
		return stype_idx;
	}
	public void setStype_idx(int stype_idx) {
		this.stype_idx = stype_idx;
	}

	
	public List<String> getTimes() {
		return times;
	}
	public void setTimes(List<String> times) {
		this.times = times;
	}
	public List<String> getAirlines() {
		return airlines;
	}
	public void setAirlines(List<String> airlines) {
		this.airlines = airlines;
	}
	public List<String> getPriceRange() {
		return priceRange;
	}
	public void setPriceRange(List<String> priceRange) {
		this.priceRange = priceRange;
	}
	
	// toString
	@Override
	public String toString() {
		return "AirplaneSearchVo [airplane_time_idx=" + airplane_time_idx + ", airplane_idx=" + airplane_idx
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", start_time=" + start_time + ", end_time="
				+ end_time + ", departure_loc=" + departure_loc + ", arrival_loc=" + arrival_loc + ", known=" + known
				+ ", airplane_price_idx=" + airplane_price_idx + ", price=" + price + ", ptype_idx=" + ptype_idx
				+ ", stype_idx=" + stype_idx + ", times=" + times + ", airlines=" + airlines + ", priceRange=" + priceRange + "]";
	}
	
}