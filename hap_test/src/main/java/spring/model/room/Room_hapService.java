package spring.model.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.mapper.Room_hapMapper;
import spring.model.mapper.ResMapper;

@Service
public class Room_hapService {

	@Autowired
	private Room_hapMapper rmapper;

	@Autowired
	private ResMapper remapper;

	public void delete(int room_num) throws Exception{
		remapper.rdelete(room_num);
		rmapper.delete(room_num);
	}




}