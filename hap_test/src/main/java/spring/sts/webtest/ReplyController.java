package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.model.bbs.ReplyDTO;
import spring.model.mapper.ReplyMapper;
import spring.utility.webtest.Utility;

@RestController
public class ReplyController {
	@Autowired
	private ReplyMapper mapper;

	private static final Logger log = LoggerFactory.getLogger(ReplyController.class);

	@PostMapping("/bbs/reply/create")
	public ResponseEntity<String> create(@RequestBody ReplyDTO vo) {

		log.info("ReplyDTO1: " + vo.getContent());
		log.info("ReplyDTO1: " + vo.getId());
		log.info("ReplyDTO1: " + vo.getBbsno());

		vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));

		int flag = mapper.create(vo);

		log.info("Reply INSERT flag: " + flag);

		return flag == 1 ? new ResponseEntity<String>("댓글 달기 성공", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/bbs/reply/list/{bbsno}/{sno}/{eno}")
	// {}가 있으면 pathvariable가 사용가능
	public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("bbsno") int bbsno, @PathVariable("sno") int sno,
			@PathVariable("eno") int eno) {
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);

		return new ResponseEntity<List<ReplyDTO>>(mapper.list(map), HttpStatus.OK);
	}

	@GetMapping("/bbs/reply/page")
	public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, @RequestParam("nowPage") int nowPage,
			@RequestParam("bbsno") int bbsno, @RequestParam("col") String col, @RequestParam("word") String word) {

		int total = mapper.total(bbsno);
		String url = "read";

		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

		String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, bbsno);

		return new ResponseEntity<String>(paging, HttpStatus.OK);
	}

	@GetMapping("/bbs/reply/{rnum}")
	public ResponseEntity<ReplyDTO> get(@PathVariable("rnum") int rnum) {
		log.info("get:" + rnum);

		return new ResponseEntity<ReplyDTO>(mapper.read(rnum), HttpStatus.OK);
	}

	@PutMapping("/bbs/reply/{rnum}")
	public ResponseEntity<String> modify(@RequestBody ReplyDTO vo, @PathVariable("rnum") int rnum) {

		log.info("rnum: " + rnum);
		log.info("modify: " + vo);

		return mapper.update(vo) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@DeleteMapping("/bbs/reply/{rnum}")
	public ResponseEntity<String> remove(@PathVariable("rnum") int rnum) {

		log.info("remove: " + rnum);

		return mapper.delete(rnum) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
}
