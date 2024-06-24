package com.escape.airplane.model;

import java.sql.Date;
import java.sql.Time;

public class Flight {
	
	private Long airplaneTimeIdx;
    private Long airplaneIdx;
    private Date startDate;
    private Date endDate;
    private Time startTime;
    private Time endTime;
    private Long departureLoc;
    private Long arrivalLoc;
    private Long known;
    
    public Flight() {}
	public Flight(Long airplaneTimeIdx, Long airplaneIdx, Date startDate, Date endDate, Time startTime, Time endTime,
			Long departureLoc, Long arrivalLoc, Long known) {
		super();
		this.airplaneTimeIdx = airplaneTimeIdx;
		this.airplaneIdx = airplaneIdx;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.departureLoc = departureLoc;
		this.arrivalLoc = arrivalLoc;
		this.known = known;
	}


	public Long getAirplaneTimeIdx() {
		return airplaneTimeIdx;
	}
	public void setAirplaneTimeIdx(Long airplaneTimeIdx) {
		this.airplaneTimeIdx = airplaneTimeIdx;
	}
	public Long getAirplaneIdx() {
		return airplaneIdx;
	}
	public void setAirplaneIdx(Long airplaneIdx) {
		this.airplaneIdx = airplaneIdx;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Time getStartTime() {
		return startTime;
	}
	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}
	public Time getEndTime() {
		return endTime;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
	public Long getDepartureLoc() {
		return departureLoc;
	}
	public void setDepartureLoc(Long departureLoc) {
		this.departureLoc = departureLoc;
	}
	public Long getArrivalLoc() {
		return arrivalLoc;
	}
	public void setArrivalLoc(Long arrivalLoc) {
		this.arrivalLoc = arrivalLoc;
	}
	public Long getKnown() {
		return known;
	}
	public void setKnown(Long known) {
		this.known = known;
	}
	
	@Override
	public String toString() {
		return "Flight [airplaneTimeIdx=" + airplaneTimeIdx + ", airplaneIdx=" + airplaneIdx + ", startDate="
				+ startDate + ", endDate=" + endDate + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", departureLoc=" + departureLoc + ", arrivalLoc=" + arrivalLoc + ", known=" + known + "]";
	}
    
	
	
    /*
    private Time startTime;

    // getter 및 setter
    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    @Override
    public String toString() {
        return "Flight{" +
                "startTime=" + startTime +
                '}';
    }
    */
}
