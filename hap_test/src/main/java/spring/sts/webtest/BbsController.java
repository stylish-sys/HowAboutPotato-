package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.bbs.BbsDTO;
import spring.model.bbs.BbsService;
import spring.model.mapper.BbsMapper;
import spring.model.mapper.ReplyMapper;
import spring.utility.webtest.Utility;

@Controller
public class BbsController {
	@Autowired
	private BbsMapper mapper;
//	private Bbsmapper mapper;
	@Autowired
	private BbsService service;

	@Autowired
	private ReplyMapper rmapper;

	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request) {

		logger.info("list()가 호출되었음");

		String word = Utility.checkNull(request.getParameter("word"));// 검색어 입력시 받는 문자열 저장

		String col = Utility.checkNull(request.getParameter("col"));

		if (col.equals("total")) {
			word = "";
		}

		int nowPage = 1; // 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);

		map.put("sno", sno);
		map.put("eno", eno);

		List<BbsDTO> list = mapper.list(map);

		int total = mapper.total(map);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("rmapper", rmapper);

		return "/bbs/list";
	}

	@GetMapping("/bbs/create")
	public String create() {

		return "/bbs/create";
	}

	@PostMapping("/bbs/create")
	public String create(BbsDTO dto, Model model) {
		if (mapper.create(dto) == 1) {
			return "redirect:/bbs/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/bbs/read")
	public String read(int bbsno, Model model, HttpServletRequest request, int nowPage, String col, String word) {
		mapper.upViewcnt(bbsno);
		BbsDTO dto = mapper.read(bbsno);
		String content = dto.getContent().replaceAll("\r\n", "<br>");
		model.addAttribute("dto", dto);

		int nPage = 1;
		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3;

		int sno = ((nPage - 1) * recordPerPage) + 1;
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);

		model.addAllAttributes(map);

		return "/bbs/read";
	}

	@GetMapping("/bbs/update")
	public String update(int bbsno, Model model) {
		BbsDTO dto = mapper.read(bbsno);
		model.addAttribute("dto", dto);

		return "/bbs/update";
	}

	@PostMapping("/bbs/update")
	public String update(BbsDTO dto, Model model, String col, String word, String nowPage) {
		Map<String, String> map = new HashMap();
		map.put("bbsno", String.valueOf(dto.getBbsno()));
		map.put("passwd", dto.getPasswd());
		int pflag = mapper.passCheck(map);
		int flag = 0;
		if (pflag == 1) {
			flag = mapper.update(dto);
		}
		if (pflag == 0) {
			model.addAttribute("str", "비밀번호 오류");
			return "/preProc";
		} else if (flag == 1) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			// redirect 로 갈시에는 정보가 안넘어가서
			// model 로 넘겨줘야함
			return "redirect:/bbs/list";
		} else {
			model.addAttribute("str", "에러");
			return "error";
		}
	}

	@GetMapping("/bbs/reply")
	public String reply(int bbsno, Model model) {
		model.addAttribute("dto", mapper.reply_read(bbsno));

		return "/bbs/reply";
	}

	@PostMapping("/bbs/reply")
	public String reply(BbsDTO dto, Model model) {
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());

//		mapper.reply_ansnum(map);// 답변순서변경

//		int flag = mapper.reply_create(dto);
		try {
			service.reply(dto);
			return "redirect:/bbs/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("str", "답변 실패입니다");
			return "/bbs/preProc";
		}
		
/*		if (flag == 1) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);

		} else {
		}
*/	}

	@GetMapping("/bbs/delete")
	public String delete(int bbsno, Model model) {
		int flag = mapper.checkRefnum(bbsno);
		model.addAttribute("flag", flag);

		return "/bbs/delete";
	}

	@PostMapping("/bbs/delete")
	public String delete(@RequestParam Map<String, String> map, Model model, String col, String word, String nowPage) {

		int pflag = mapper.passCheck(map);
		int flag = 0;
		if (pflag == 1) {
			try {
				service.delete(Integer.parseInt(map.get("bbsno")));
				return "redirect:/bbs/list";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("str", "삭제 실패");
				return "/bbs/preProc";
			}
		} else {
			model.addAttribute("str", "비밀번호 오류");
			return "/bbs/preProc";
		}
	}
}
