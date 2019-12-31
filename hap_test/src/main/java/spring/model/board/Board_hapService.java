package spring.model.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.mapper.Board_hapMapper;
import spring.model.mapper.ResMapper;
import spring.model.mapper.Room_hapMapper;

@Service
public class Board_hapService {
	
	@Autowired
	private Board_hapMapper bmapper;
	
	@Autowired
	private Room_hapMapper rmapper;
	
	@Autowired
	private ResMapper remapper;
	
	public void delete(int board_num) throws Exception{
		remapper.bdelete(board_num);
		rmapper.bdelete(board_num);
		bmapper.delete(board_num);
	}
	
	
	

}
