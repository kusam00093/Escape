package com.escape.login.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.escape.board.domain.BoardVo;
import com.escape.login.domain.Airline;
import com.escape.login.domain.Airplane_time;
import com.escape.login.domain.Hotel;
import com.escape.login.domain.Person;
import com.escape.login.domain.Pkg;
import com.escape.login.domain.Room;
import com.escape.login.domain.Room_reservation;
import com.escape.login.domain.Seller;
import com.escape.login.domain.User;

@Mapper
public interface MypageMapper {
	
	Person getPersonByuser_idx(int user_idx);

	Seller getSellerByuser_idx(int user_idx);

	Airline getAirlineByuser_idx(int user_idx);

	void updateUser(User user);

	void updatePerson(Person person);

	void updateSeller(Seller seller);

	void updateAirline(Airline airline);

	List<Pkg> getPkgByuser_idx(int user_idx);

	List<Room> getRoomByuser_idx(int user_idx);

	List<Room_reservation> getRoom_reByuser_idx(int user_idx);

	List<Airplane_time> getAirtimeByuser_idx(int user_idx);

	List<Hotel> getHotelByuser_idx(int user_idx);

	List<Pkg> getPkgbookmarkByuser_idx(int user_idx);

	List<BoardVo> getBoardVoByuser_idx(int user_idx);

	List<Pkg> getPkgBysellerUser_idx(int user_idx);

	List<Room> getRoomBysellerUser_idx(int user_idx);

	List<Room> getRoomcostomerBysellerUser_idx(int user_idx);

	List<Pkg> getPkgcostomerBysellerUser_idx(int user_idx);

	List<Pkg> getPkgsoldoutBysellerUser_idx(int user_idx);

	List<Room> getRoomsoldoutBysellerUser_idx(int user_idx);






	// List<Pkg> getPackageBypackage_idx(List<Apply> apply);

	// List<Pkg> getPackageBypackage_idx();

	

}
