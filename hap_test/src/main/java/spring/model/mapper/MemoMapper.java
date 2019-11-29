package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.memo.MemoDTO;

public interface MemoMapper {

	int total(Map map);
	List<MemoDTO> list(Map map);
	int upViewcnt(int memono);
	MemoDTO read(int memono);
	int create(MemoDTO dto);
	int update(MemoDTO dto);
	int delete(int memono);

}
