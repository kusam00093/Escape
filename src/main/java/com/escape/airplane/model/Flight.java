package com.escape.airplane.model;

import java.sql.Time;

public class Flight {
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
}
