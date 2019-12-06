package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.member_hap.Member_hapDTO;

public interface Member_hapMapper {

	int member_create(Member_hapDTO dto) ;

	int duplicatedId(String member_id);

	int duplicatedEmail(String member_email);
	
	//String getMember_fname(String member_id);
	
	int loginCheck(Map<String, String> map);

	String getMember_grade(String member_id);

	String findId(Map map);

	String findPasswd(Map map);

	List<Member_hapDTO> member_list(Map map);

	int member_total(Map map);
	
	Member_hapDTO member_read(String member_id);
	
	int member_delete(String member_id);
	
	int member_update(Member_hapDTO dto);

}
