package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.res.Res_hapDTO;

public interface ResMapper {
	List<Res_hapDTO> list(Map map);
	List<Res_hapDTO> list_acc(Map map);
	
	List<Res_hapDTO> room_hap(int board_num);
	Res_hapDTO room_r_hap(int room_num);
	Res_hapDTO member_hap(String member_id);
	Res_hapDTO board_hap(int board_num);
	
	int total(Map map);
	int total_acc(Map map);
	
	Res_hapDTO list_m(String member_id);
	Res_hapDTO read(int res_num);
	List<Res_hapDTO> read_id (Map map);
	Res_hapDTO res_find(int res_rannum);
	int create(Res_hapDTO dto);
	int create_acc(Res_hapDTO dto);
	int update(Res_hapDTO dto);
	int delete(int res_num);
	int delete_acc(Res_hapDTO dto);
}
