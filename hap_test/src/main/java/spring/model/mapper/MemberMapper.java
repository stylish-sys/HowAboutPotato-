package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.res.Board_hapDTO;
import spring.model.res.Member_hapDTO;
import spring.model.res.Res_hapDTO;
import spring.model.res.Room_hapDTO;

public interface MemberMapper {
	List<Member_hapDTO> list(Map map);
}
