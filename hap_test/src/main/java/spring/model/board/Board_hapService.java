package spring.model.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.mapper.Board_hapMapper;
import spring.model.mapper.Room_hapMapper;

@Service
public class Board_hapService {
	
	@Autowired
	private Board_hapMapper bmapper;
	
	@Autowired
	private Room_hapMapper rmapper;
	
	public void delete(int board_num) throws Exception{
		
		rmapper.delete(board_num);
		bmapper.delete(board_num);
	}
	
	
	

}
