package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.model.mapper.Member1Mapper;
import spring.model.member.MemberDTO;
import spring.utility.webtest.Utility;

@Controller
public class MemberController {
	@Autowired
	private Member1Mapper mapper;
//	private MemberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@PostMapping("/member/passwd_FindProc")
	public String passwd_FindForm(String id, String email, Model model) {

		Map map = new HashMap();
		map.put("id", id);
		map.put("email", email);

		String passwd = mapper.passwd_find(map);

		model.addAttribute("passwd", passwd);

		return "member/passwd_FindProc";
	}

	@GetMapping("/member/passwd_FindForm")
	public String passwd_FindForm() {

		return "member/passwd_FindForm";
	}

	@PostMapping("/member/id_FindProc")
	public String id_FindForm(String mname, String email, Model model) {

		Map map = new HashMap();
		map.put("mname", mname);
		map.put("email", email);
		String id = mapper.id_find(map);

		model.addAttribute("id", id);

		return "member/id_FindProc";
	}

	@GetMapping("/member/id_FindForm")
	public String id_FindForm() {

		return "member/id_FindForm";
	}

	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		logger.info("list()가 호출되었습니다. ");

		if (col.equals("total"))
			word = "";

		int nowPage = 1;
		int recordPerPage = 3;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<MemberDTO> list = mapper.list(map);

		int total = mapper.total(map);

		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);

		return "/list";
	}

	@PostMapping("/member/delete")
	public String delete(String id, String oldfile, HttpServletRequest request, HttpSession session) {
		int flag = mapper.delete(id);
		String basePath = request.getRealPath("/storage");

		if (flag == 1)
			session.invalidate();

		if (flag == 1 && !oldfile.equals("member.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}
		if (flag == 1) {
			return "redirect:/";
		} else {
			return "error";
		}
	}

	@GetMapping("/member/delete")
	public String delete() {

		return "/delete";
	}

	@PostMapping("/member/updatePw")
	public String updatePw(String passwd, HttpSession session) {

		Map map = new HashMap();
		map.put("id", session.getAttribute("id"));
		map.put("pw", passwd);

		int flag = mapper.updatePw(map);

		if (flag == 1) {
			return "redirect:/";
		} else {
			return "error";
		}
	}

	@GetMapping("/member/updatePw")
	public String updatePw() {

		return "/updatePw";
	}

	@PostMapping("/member/updateFile")
	public String updateFile(MultipartFile fname, String oldfile, HttpSession session, HttpServletRequest request) {
		String basePath = request.getRealPath("/storage");
		if (oldfile != null && !oldfile.equals("member.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}

		Map map = new HashMap();
		map.put("id", (String) session.getAttribute("id"));
		map.put("fname", Utility.saveFileSpring(fname, basePath));
		
		int flag = mapper.updateFile(map);
		if (flag == 1) {
			return "redirect:./read";
		} else {
			return "error";
		}
	}

	@GetMapping("/member/updateFile")
	public String updateFile() {

		return "/updateFile";
	}

	@PostMapping("/member/email_proc")
	public String email_proc(String email, Model model) {

		int flag = mapper.duplicateEmail(email);

		model.addAttribute("flag", flag);

		return "member/email_proc";
	}

	@GetMapping("/member/email_form")
	public String email_form() {

		return "member/email_form";
	}

	@PostMapping("/member/update")
	public String update(MemberDTO dto, Model model) {
		int flag = mapper.update(dto);
		if (flag == 1) {
			model.addAttribute("id", dto.getId());
			return "redirect:./read";
		} else {
			return "error";
		}
	}

	@GetMapping("/member/update")
	public String update(String id, HttpSession session, Model model) {
		if (id == null)
			id = (String) session.getAttribute("id");

		MemberDTO dto = mapper.read(id);

		model.addAttribute("dto", dto);

		return "/update";
	}

	@GetMapping("/member/read")
	public String read(String id, HttpSession session, Model model) {
		if (id == null)
			id = (String) session.getAttribute("id");

		MemberDTO dto = mapper.read(id);
		
		
		model.addAttribute("dto", dto);

		return "/read";
	}

	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map,
			Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {

		int flag = mapper.loginCheck(map);
		String grade = null;
		if (flag == 1) {
			grade = mapper.getGrade(map.get("id"));
			session.setAttribute("id", map.get("id"));
			session.setAttribute("grade", grade);

			Cookie cookie = null;

			String c_id = request.getParameter("c_id");

			if (c_id != null) {
				cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(120);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", map.get("id"));
				cookie.setMaxAge(120);
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		if (flag == 1) {
			if(map.get("rurl")!=null && !map.get("rurl").equals("")) {
				model.addAttribute("bbsno",map.get("bbsno"));
				model.addAttribute("nPage",map.get("nPage"));
				model.addAttribute("nowPage",map.get("nowPage"));
				model.addAttribute("col",map.get("col"));
				model.addAttribute("word",map.get("word"));
				
				return "redirect:"+map.get("rurl");
			}else {
				return "redirect:/";
			}
				
		} else {
			request.setAttribute("str", "아이디 또는 비밀번호를 잘못 입력하셨거나" + "<br> 회원이 아닙니다. 회원가입을 하세요.");
			return "/preProc";
		}

	}

	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {
		String c_id = "";
		String c_id_val = "";

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();
				}
			}
		}
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		return "/login";
	}

	@PostMapping("/member/createProc")
	public String createProc(MemberDTO dto, Model model, HttpServletRequest request) {
		String url = "/preProc";
		if (mapper.duplicateID(dto.getId()) == 1) {
			model.addAttribute("str", "중복된 아이디 입니다. 아이디 중복을 확인하세요.");
		} else if (mapper.duplicateEmail(dto.getEmail()) ==1) {
			model.addAttribute("str", "중복된 이메일 입니다. 이메일 중복을 확인하세요.");
		} else {
			String basePath = request.getRealPath("/storage");

			int size = (int) dto.getFnameMF().getSize();

			if (size > 0) {
				dto.setFname(Utility.saveFileSpring(dto.getFnameMF(), basePath));
			} else {
				dto.setFname("member.jpg");
			}
			if (mapper.create(dto) ==1 ) {
				url = "redirect:/";
			} else {
				url = "error";
			}
		}

		return url;
	}

	@ResponseBody
	@GetMapping(value = "/member/emailcheck", produces = "application/json;charset=utf-8")
	public Map<String, Object> emailcheck(String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		int flag = mapper.duplicateEmail(email);

		if (flag == 1) {
			map.put("str", email + "는 중복되어있음");
		} else {
			map.put("str", email + "는 사용 가능");
		}
		return map;
	}

	@ResponseBody
	@GetMapping(value = "/member/idcheck", produces = "application/json;charset=utf-8")
	public Map<String, Object> idCheck(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		int flag = mapper.duplicateID(id);

		if (flag == 1) {
			map.put("str", id + "는 중복되어있음");
		} else {
			map.put("str", id + "는 사용 가능");
		}

		return map;
	}

	@RequestMapping("/member/agree")
	public String agree() {
		return "/agree";
	}

	@RequestMapping("/member/createForm")
	public String create() {

		return "/create";
	}
}
