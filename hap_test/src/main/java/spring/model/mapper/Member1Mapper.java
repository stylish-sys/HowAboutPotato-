package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.member.MemberDTO;

public interface Member1Mapper {
	int create(MemberDTO dto);
	int delete(String id);
	int duplicateEmail(String email);
	int duplicateID(String id);
	String getGrade(String id);
	List<MemberDTO> list(Map map);
	int loginCheck(Map<String,String> map);
	MemberDTO read(String id);
	int total(Map map);
	int update(MemberDTO dto);
	int updateFile(Map map);
	int updatePw(Map map);
	
	String id_find(Map map);
	String passwd_find(Map map);
	
}
