package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.room.Room_hapDTO;

public interface Room_hapMapper {
	
	int create(Room_hapDTO dto);
	List<Room_hapDTO> list(int board_num);
	int delete(int room_num);
	Room_hapDTO read(int room_num);
	int update(Room_hapDTO dto);
	int updateFile(Map map);
	int bdelete(int board_num);

}
