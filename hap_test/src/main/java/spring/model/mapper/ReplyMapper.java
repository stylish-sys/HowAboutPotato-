package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.bbs.ReplyDTO;

public interface ReplyMapper {
	int rcount(int bbsno);
	List<ReplyDTO> list(Map map);
	int total(int bbsno);
	int create(ReplyDTO dto);
	ReplyDTO read(int rnum);
	int update(ReplyDTO dto);
	int delete(int rnum);
	int rdelete(int bbsno);
}
