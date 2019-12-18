package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.qna.QnaDTO;

public interface QnaMapper {

	List<QnaDTO> list(Map map);
	
	List<QnaDTO> list_Y(Map map);
	
	int total(Map map);
	
	int create(QnaDTO dto);
	
	QnaDTO read(int qna_num);
	
	int upViewcnt(int qna_num);
	
	int update(QnaDTO dto);
	
	int passCheck(Map<String, String> map);
	
	int delete(int qna_num);	
	
	int checkRef(int qna_num);
	
	int reply_create(QnaDTO dto);
	
	void reply_ansnum(Map map);
	
	QnaDTO reply_read(int qna_num);
	
	int checkRefnum(int qna_num);
}
