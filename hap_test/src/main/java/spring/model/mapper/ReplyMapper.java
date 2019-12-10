package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.board.review_hapDTO;

public interface ReplyMapper {
	
	List<review_hapDTO> list(Map map);
	int delete(int rw_num);
	review_hapDTO read (int rw_num);
	int total (int room_num);
	int rcount(int room_num);
	void rdelete(int room_num);
	int create(review_hapDTO dto);
	int update(review_hapDTO dto);
}
