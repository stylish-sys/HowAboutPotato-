package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.mapper.Member_hapMapper;
import spring.model.mapper.QnaMapper;
import spring.model.member_hap.Member_hapDTO;
import spring.model.qna.QnaDTO;
import spring.model.res.Res_hapDTO;
import spring.utility.webtest.Utility;

@Controller
public class QnaController {

	@Autowired
	private QnaMapper qna_mapper;
	private Member_hapMapper member_mapper;

	@RequestMapping("/qna/listQna")
	public String list(HttpServletRequest request) {
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

		List<QnaDTO> list = qna_mapper.list(map);

		int total = qna_mapper.total(map);
		String paging = Utility.paging_qna(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("qna_mapper", qna_mapper);

		return "/qna/listQna";
	}

	@GetMapping("/qna/readQna")
	public String read(int qna_num, Model model) {
		qna_mapper.upViewcnt(qna_num);
		QnaDTO dto = qna_mapper.read(qna_num);
		model.addAttribute("dto", dto);
		// model객체를 이용해서 view로 데이터 전달

		String notice_content = dto.getQna_content().replaceAll("\r\n", "<br>");
		dto.setQna_content(notice_content);

		return "/qna/readQna";
	}

	@GetMapping("/qna/createQna")
	public String create(HttpServletRequest request, HttpSession session, Model model, Member_hapDTO dto) {

		String member_id = (String) session.getAttribute("member_id");

		if (member_id == null) {
			member_id = "비회원";
		}

		model.addAttribute("member_id", member_id);

		return "/qna/createQna";
	}

	@PostMapping("/qna/createQna")
	public String create(QnaDTO dto, HttpServletRequest request, Model model) {
		String basePath = request.getRealPath("/storage");
		int filesize = (int) dto.getQna_filenameMF().getSize();

		if (filesize > 0) {
			dto.setQna_filename(Utility.saveFileSpring(dto.getQna_filenameMF(), basePath));
		}

		int flag = qna_mapper.create(dto);

		if (flag == 1) {
			return "redirect:/qna/listQna";
		} else {
			model.addAttribute("str", "error");
			return "/qna/preProcNotice";
		}

	}

	@GetMapping("/qna/updateQna")
	public String update(int qna_num, Model model) {
		model.addAttribute("dto", qna_mapper.read(qna_num));

		return "/qna/updateQna";
	}

	@PostMapping("/qna/updateQna")
	public String update(QnaDTO dto, HttpServletRequest request, Model model, String qna_oldfile) {
		String basePath = request.getRealPath("/storage");

		Map<String, String> map = new HashMap<String, String>();
		map.put("qna_num", String.valueOf(dto.getQna_num()));
		map.put("qna_passwd", dto.getQna_passwd());

		int pflag = qna_mapper.passCheck(map);

		dto.setQna_filesize((int) dto.getQna_filenameMF().getSize());

		if (pflag == 1) {
			if (dto.getQna_filesize() > 0) {
				Utility.deleteFile(basePath, qna_oldfile);
				dto.setQna_filename(Utility.saveFileSpring(dto.getQna_filenameMF(), basePath));
			}
			int flag = qna_mapper.update(dto);
			model.addAttribute("pflag", pflag);
			model.addAttribute("flag", flag);
			return "redirect:/qna/listQna";
		} else {
			model.addAttribute("str", "비밀번호 오류 입니다.");
			return "/qna/preProcQna";
		}
	}

	@GetMapping("/qna/replyQna")
	public String qna_reply(int qna_num, Model model) {
		model.addAttribute("dto", qna_mapper.reply_read(qna_num));

		return "/qna/replyQna";
	}

	@PostMapping("/qna/replyQna")
	public String qna_reply(QnaDTO dto, Model model, HttpServletRequest request) {
		String basePath = request.getRealPath("/storage");
		dto.setQna_filesize((int) dto.getQna_filenameMF().getSize());

		if (dto.getQna_filesize() > 0) {
			dto.setQna_filename(Utility.saveFileSpring(dto.getQna_filenameMF(), basePath));
		}
		Map map = new HashMap();
		map.put("qna_ref", dto.getQna_ref());
		map.put("qna_ansnum", dto.getQna_ansnum());

		System.out.println("ref : " + dto.getQna_ref());
		System.out.println("ansnum : " + dto.getQna_ansnum());

		qna_mapper.reply_ansnum(map);

		int flag = qna_mapper.reply_create(dto);

		if (flag == 1) {

			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/qna/listQna";// model을 쓰면 redirect 하는 곳까지 정보를 담아준다
		} else {
			model.addAttribute("str", "error");
			return "/qna/preProcQna";
		}
	}

	@GetMapping("/qna/deleteQna")
	public String delete(int qna_num, Model model) {
		int flag = qna_mapper.checkRef(qna_num);

		/*
		 * QnaDTO dto = qna_mapper.read(qna_num);
		 * 
		 * String dto_m = member_mapper.getMember_grade(dto.getMember_id());
		 */
		model.addAttribute("flag", flag);
		/*
		 * model.addAttribute("dto_m", dto_m);
		 */
		return "/qna/deleteQna";
	}

	@PostMapping("/qna/deleteQna")
	public String delete(HttpSession session, HttpServletRequest request, @RequestParam Map<String, String> map) {
		String basePath = request.getRealPath("/storage");

		int pflag = qna_mapper.passCheck(map);
		int flag = 0;

		if (pflag == 1) {
			flag = qna_mapper.delete(Integer.parseInt(map.get("qna_num")));
			Utility.deleteFile(basePath, request.getParameter("qna_oldfile"));

			request.setAttribute("pflag", pflag);
			request.setAttribute("flag", flag);
			request.setAttribute("col", request.getParameter("col"));
			request.setAttribute("word", request.getParameter("word"));
			request.setAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/qna/listQna";
		} else {
			request.setAttribute("str", "error");
			return "/qna/preProcQna";
		}
	}

}
