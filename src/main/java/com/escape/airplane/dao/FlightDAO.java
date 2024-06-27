package com.escape.airplane.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.escape.airplane.model.Flight;

public class FlightDAO {

    public List<Flight> getFlights() {
        List<Flight> flights = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "escape", "1234");
            String sql = "SELECT * FROM airplane_time_tb";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	
            	Flight flight = new Flight();
                flight.setStartTime(rs.getTime("start_time"));
                
                // 다른 필요한 필드도 설정
                flights.add(flight);
                
            }

            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flights;
        
    }
}
