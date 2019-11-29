package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.mapper.MemoMapper;
import spring.model.memo.MemoDTO;
import spring.utility.webtest.Utility;

@Controller
public class MemoController {

	@Autowired
	private MemoMapper mapper;
//	private Memomapper mapper;

	@PostMapping("/memo/delete")
	public String delete(int memono, Model model, String col, String word, String nowPage) {
		int flag = mapper.delete(memono);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("flag", flag);
		return "redirect:/memo/list";
	}

	@GetMapping("/memo/delete")
	public String delete() {

		return "/memo/delete";
	}

	@PostMapping("/memo/update")
	public String update(MemoDTO dto, Model model, String col, String word, String nowPage) {

		int flag = mapper.update(dto);
		model.addAttribute("flag", flag);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);

		return "redirect:/memo/list";
	}

	@GetMapping("/memo/update")
	public String update(Model model, int memono) {
		MemoDTO dto = mapper.read(memono);

		model.addAttribute("dto", dto);
		return "/memo/update";
	}

	@PostMapping("/memo/create")
	public String create(HttpServletRequest request) {

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		MemoDTO dto = new MemoDTO();
		dto.setTitle(title);
		dto.setContent(content);

		int flag = mapper.create(dto);
		if (flag == 1) {
			return "redirect:/memo/list";

		} else {

			return "error";
		}
	}

	@GetMapping("/memo/create")
	public String create() {

		return "/memo/create";
	}

	@GetMapping("/memo/read")
	public String read(int memono, Model model) {
		mapper.upViewcnt(memono);
		MemoDTO dto = mapper.read(memono);
		String content = dto.getContent().replaceAll("\r\n", "<br>");
		model.addAttribute("dto", dto);
		return "/memo/read";
	}

	@RequestMapping("/memo/list")
	public String list(HttpServletRequest request) {
		// 검색관련

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		// 페이징 관련
		int nowPage = 1;
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
		List<MemoDTO> list = mapper.list(map);

		int total = mapper.total(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		return "/memo/list";

	}

}
