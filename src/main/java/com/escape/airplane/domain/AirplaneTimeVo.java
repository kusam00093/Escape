package com.escape.airplane.domain;

public class AirplaneTimeVo {

	// Field
	private int airplane_idx1;
	private int airplane_idx2;
    private int airline_idx;
    private String name1;	// airline_tb 의 name, 항공사 이름
    private String name2;	// airline_tb 의 name, 항공사 이름
    private String logo1;	// airline_tb 의 logo, 항공사 로고
    private String logo2;	// airline_tb 의 logo, 항공사 로고
    private int departure_loc;
    private String depCity1;
    private String depCityCode1;
    private String depCity2;
    private String depCityCode2;
    private int arrival_loc;
    private String arrCity1;
    private String arrCityCode1;
    private String arrCity2;
    private String arrCityCode2;
    private String startTime1;
    private String endTime1;
    private String startTime2;
    private String endTime2;
    private int airplane_time_idx1;
    private int airplane_time_idx2;
    private int adultCount;
    private int childCount;
    private int infantCount;
    private String seatClass;
    private int stype;
    private String depDate;
    private String arrDate;
    private int ptype_idx;
    private int stype_idx;
    private String durationhour;
    private String durationminute;
    private int price1;
    private int price2;
    private int totalPrice;
    private int known1;
    private int known2;
    private int seat_su1;
    private int seat_su2;
    private int airplane_reservation_idx;
	
	// Constructor
	public AirplaneTimeVo() {}
	public AirplaneTimeVo(int airplane_idx1, int airplane_idx2, int airline_idx, String name1, String name2,
			String logo1, String logo2, int departure_loc, String depCity1, String depCityCode1, String depCity2,
			String depCityCode2, int arrival_loc, String arrCity1, String arrCityCode1, String arrCity2,
			String arrCityCode2, String startTime1, String endTime1, String startTime2, String endTime2,
			int airplane_time_idx1, int airplane_time_idx2, int adultCount, int childCount, int infantCount,
			String seatClass, int stype, String depDate, String arrDate, int ptype_idx, int stype_idx,
			String durationhour, String durationminute, int price1, int price2, int totalPrice, int known1, int known2,
			int seat_su1, int seat_su2, int airplane_reservation_idx) {
		super();
		this.airplane_idx1 = airplane_idx1;
		this.airplane_idx2 = airplane_idx2;
		this.airline_idx = airline_idx;
		this.name1 = name1;
		this.name2 = name2;
		this.logo1 = logo1;
		this.logo2 = logo2;
		this.departure_loc = departure_loc;
		this.depCity1 = depCity1;
		this.depCityCode1 = depCityCode1;
		this.depCity2 = depCity2;
		this.depCityCode2 = depCityCode2;
		this.arrival_loc = arrival_loc;
		this.arrCity1 = arrCity1;
		this.arrCityCode1 = arrCityCode1;
		this.arrCity2 = arrCity2;
		this.arrCityCode2 = arrCityCode2;
		this.startTime1 = startTime1;
		this.endTime1 = endTime1;
		this.startTime2 = startTime2;
		this.endTime2 = endTime2;
		this.airplane_time_idx1 = airplane_time_idx1;
		this.airplane_time_idx2 = airplane_time_idx2;
		this.adultCount = adultCount;
		this.childCount = childCount;
		this.infantCount = infantCount;
		this.seatClass = seatClass;
		this.stype = stype;
		this.depDate = depDate;
		this.arrDate = arrDate;
		this.ptype_idx = ptype_idx;
		this.stype_idx = stype_idx;
		this.durationhour = durationhour;
		this.durationminute = durationminute;
		this.price1 = price1;
		this.price2 = price2;
		this.totalPrice = totalPrice;
		this.known1 = known1;
		this.known2 = known2;
		this.seat_su1 = seat_su1;
		this.seat_su2 = seat_su2;
		this.airplane_reservation_idx = airplane_reservation_idx;
	}

	// Getter/Setter	
	public int getAirplane_idx1() {
		return airplane_idx1;
	}
	public void setAirplane_idx1(int airplane_idx1) {
		this.airplane_idx1 = airplane_idx1;
	}
	public int getAirplane_idx2() {
		return airplane_idx2;
	}
	public void setAirplane_idx2(int airplane_idx2) {
		this.airplane_idx2 = airplane_idx2;
	}
	public int getAirline_idx() {
		return airline_idx;
	}
	public void setAirline_idx(int airline_idx) {
		this.airline_idx = airline_idx;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getLogo1() {
		return logo1;
	}
	public void setLogo1(String logo1) {
		this.logo1 = logo1;
	}
	public String getLogo2() {
		return logo2;
	}
	public void setLogo2(String logo2) {
		this.logo2 = logo2;
	}
	public int getDeparture_loc() {
		return departure_loc;
	}
	public void setDeparture_loc(int departure_loc) {
		this.departure_loc = departure_loc;
	}
	public String getDepCity1() {
		return depCity1;
	}
	public void setDepCity1(String depCity1) {
		this.depCity1 = depCity1;
	}
	public String getDepCityCode1() {
		return depCityCode1;
	}
	public void setDepCityCode1(String depCityCode1) {
		this.depCityCode1 = depCityCode1;
	}
	public String getDepCity2() {
		return depCity2;
	}
	public void setDepCity2(String depCity2) {
		this.depCity2 = depCity2;
	}
	public String getDepCityCode2() {
		return depCityCode2;
	}
	public void setDepCityCode2(String depCityCode2) {
		this.depCityCode2 = depCityCode2;
	}
	public int getArrival_loc() {
		return arrival_loc;
	}
	public void setArrival_loc(int arrival_loc) {
		this.arrival_loc = arrival_loc;
	}
	public String getArrCity1() {
		return arrCity1;
	}
	public void setArrCity1(String arrCity1) {
		this.arrCity1 = arrCity1;
	}
	public String getArrCityCode1() {
		return arrCityCode1;
	}
	public void setArrCityCode1(String arrCityCode1) {
		this.arrCityCode1 = arrCityCode1;
	}
	public String getArrCity2() {
		return arrCity2;
	}
	public void setArrCity2(String arrCity2) {
		this.arrCity2 = arrCity2;
	}
	public String getArrCityCode2() {
		return arrCityCode2;
	}
	public void setArrCityCode2(String arrCityCode2) {
		this.arrCityCode2 = arrCityCode2;
	}
	public String getStartTime1() {
		return startTime1;
	}
	public void setStartTime1(String startTime1) {
		this.startTime1 = startTime1;
	}
	public String getEndTime1() {
		return endTime1;
	}
	public void setEndTime1(String endTime1) {
		this.endTime1 = endTime1;
	}
	public String getStartTime2() {
		return startTime2;
	}
	public void setStartTime2(String startTime2) {
		this.startTime2 = startTime2;
	}
	public String getEndTime2() {
		return endTime2;
	}
	public void setEndTime2(String endTime2) {
		this.endTime2 = endTime2;
	}
	public int getAirplane_time_idx1() {
		return airplane_time_idx1;
	}
	public void setAirplane_time_idx1(int airplane_time_idx1) {
		this.airplane_time_idx1 = airplane_time_idx1;
	}
	public int getAirplane_time_idx2() {
		return airplane_time_idx2;
	}
	public void setAirplane_time_idx2(int airplane_time_idx2) {
		this.airplane_time_idx2 = airplane_time_idx2;
	}
	public int getAdultCount() {
		return adultCount;
	}
	public void setAdultCount(int adultCount) {
		this.adultCount = adultCount;
	}
	public int getChildCount() {
		return childCount;
	}
	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}
	public int getInfantCount() {
		return infantCount;
	}
	public void setInfantCount(int infantCount) {
		this.infantCount = infantCount;
	}
	public String getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}
	public int getStype() {
		return stype;
	}
	public void setStype(int stype) {
		this.stype = stype;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public String getDepDate() {
		return depDate;
	}
	public void setDepDate(String depDate) {
		this.depDate = depDate;
	}
	public String getArrDate() {
		return arrDate;
	}
	public void setArrDate(String arrDate) {
		this.arrDate = arrDate;
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
	public String getDurationhour() {
		return durationhour;
	}
	public void setDurationhour(String durationhour) {
		this.durationhour = durationhour;
	}
	public String getDurationminute() {
		return durationminute;
	}
	public void setDurationminute(String durationminute) {
		this.durationminute = durationminute;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getKnown1() {
		return known1;
	}
	public void setKnown1(int known1) {
		this.known1 = known1;
	}
	public int getKnown2() {
		return known2;
	}
	public void setKnown2(int known2) {
		this.known2 = known2;
	}
	public int getSeat_su1() {
		return seat_su1;
	}
	public void setSeat_su1(int seat_su1) {
		this.seat_su1 = seat_su1;
	}
	public int getSeat_su2() {
		return seat_su2;
	}
	public void setSeat_su2(int seat_su2) {
		this.seat_su2 = seat_su2;
	}
	public int getAirplane_reservation_idx() {
		return airplane_reservation_idx;
	}
	public void setAirplane_reservation_idx(int airplane_reservation_idx) {
		this.airplane_reservation_idx = airplane_reservation_idx;
	}
	
	// toString
	@Override
	public String toString() {
		return "AirplaneTimeVo [airplane_idx1=" + airplane_idx1 + ", airplane_idx2=" + airplane_idx2 + ", airline_idx="
				+ airline_idx + ", name1=" + name1 + ", name2=" + name2 + ", logo1=" + logo1 + ", logo2=" + logo2
				+ ", departure_loc=" + departure_loc + ", depCity1=" + depCity1 + ", depCityCode1=" + depCityCode1
				+ ", depCity2=" + depCity2 + ", depCityCode2=" + depCityCode2 + ", arrival_loc=" + arrival_loc
				+ ", arrCity1=" + arrCity1 + ", arrCityCode1=" + arrCityCode1 + ", arrCity2=" + arrCity2
				+ ", arrCityCode2=" + arrCityCode2 + ", startTime1=" + startTime1 + ", endTime1=" + endTime1
				+ ", startTime2=" + startTime2 + ", endTime2=" + endTime2 + ", airplane_time_idx1=" + airplane_time_idx1
				+ ", airplane_time_idx2=" + airplane_time_idx2 + ", adultCount=" + adultCount + ", childCount="
				+ childCount + ", infantCount=" + infantCount + ", seatClass=" + seatClass + ", stype=" + stype
				+ ", depDate=" + depDate + ", arrDate=" + arrDate + ", ptype_idx=" + ptype_idx + ", stype_idx="
				+ stype_idx + ", durationhour=" + durationhour + ", durationminute=" + durationminute + ", price1="
				+ price1 + ", price2=" + price2 + ", totalPrice=" + totalPrice + ", known1=" + known1 + ", known2="
				+ known2 + ", seat_su1=" + seat_su1 + ", seat_su2=" + seat_su2 + ", airplane_reservation_idx="
				+ airplane_reservation_idx + "]";
	}
	
}