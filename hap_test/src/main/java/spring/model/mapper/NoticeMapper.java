package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.notice.NoticeDTO;

public interface NoticeMapper {

	List<NoticeDTO> list(Map map);
	List<NoticeDTO> list_Y(Map map);
	
	int total(Map map);
	
	int create(NoticeDTO dto);
	
	NoticeDTO read(int notice_num);
	
	int update(NoticeDTO dto);
	
	int delete(int notice_num);
	
	int upViewcnt(int notice_num);
	
	int passCheck(Map<String, String> map);
	
	int checkRef(int notice_num);//??
	
}
