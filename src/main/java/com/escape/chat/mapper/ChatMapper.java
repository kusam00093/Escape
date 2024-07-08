package com.escape.chat.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.escape.chat.domain.Room;

@Mapper
public interface ChatMapper {
    void createRoom(Room room);
    List<Room> getAllRooms();
	void saveMessage(Map<String, Object> paramMap);
}