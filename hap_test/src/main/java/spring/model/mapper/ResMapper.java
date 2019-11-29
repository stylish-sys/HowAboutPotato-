package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.res.Res_hapDTO;

public interface ResMapper {
	List<Res_hapDTO> list(Map map);
	List<Res_hapDTO> room_hap(int board_num);
	Res_hapDTO room_r_hap(int room_num);
	Res_hapDTO member_hap(String member_id);
	Res_hapDTO board_hap(int board_num);
	
	int total(Map map);
	Res_hapDTO read(int res_num);
	int create(Res_hapDTO dto);
	int update(Res_hapDTO dto);
	int delete(int res_num);
}
