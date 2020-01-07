package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.board.Board_hapDTO;

public interface Board_hapMapper {
	
	List<Board_hapDTO> list(Map map);
	
	List<Board_hapDTO> listM(Map map);
	int total(Map map);
	int create(Board_hapDTO dto);
	Board_hapDTO read(int board_num);
	int delete(int board_num);
	int update(Board_hapDTO dto);
	int updateFile(Map map);
	int upcnt(int board_num);
	int duplicatedBoard_name(String board_name);
	
	int price(int board_num);
	
	
}
