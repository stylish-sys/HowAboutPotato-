package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.bbs.BbsDTO;

public interface BbsMapper {
	List<BbsDTO> list(Map map);
	int total(Map map);
	BbsDTO read(int bbsno);
	void upViewcnt(int bbsno);
	int create(BbsDTO dto);
	int update(BbsDTO dto);
	int passCheck(Map map);
	int delete(int bbsno);
	int checkRefnum(int bbsno);
	BbsDTO reply_read(int bbsno);
	void reply_ansnum(Map map);
	int reply_create(BbsDTO dto);
}
