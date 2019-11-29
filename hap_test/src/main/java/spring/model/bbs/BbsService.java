package spring.model.bbs;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.mapper.BbsMapper;
import spring.model.mapper.ReplyMapper;

@Service
public class BbsService {

	@Autowired
	private BbsMapper bmapper;

	@Autowired
	private ReplyMapper rmapper;

	public void delete(int bbsno) throws Exception {

		rmapper.rdelete(bbsno);
		bmapper.delete(bbsno);
	}

	public void reply(BbsDTO dto) throws Exception {
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		
		bmapper.reply_ansnum(map);
		bmapper.reply_create(dto);
	}
}
