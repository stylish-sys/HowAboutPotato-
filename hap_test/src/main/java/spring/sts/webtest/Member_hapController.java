package spring.sts.webtest;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.test.tst.NaverLoginBO;

import spring.model.board.Board_hapDTO;
import spring.model.mapper.Board_hapMapper;
import spring.model.mapper.Member_hapMapper;
import spring.model.mapper.ResMapper;
import spring.model.member_hap.Member_hapDTO;
import spring.model.res.Res_hapDTO;
import spring.utility.webtest.Utility;

@Controller
public class Member_hapController {

	@Autowired
	private Member_hapMapper mapper;
	
	@Autowired
	private ResMapper rmapper;
	
	@Autowired
	private Board_hapMapper bmapper;

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@GetMapping("/member_hap/agree")
	public String agree() {
		return "/member_hap/agree";
	}

	@PostMapping("/member_hap/member_updatePw")
	public String updatePw(String member_passwd, HttpSession session) {

		Map map = new HashMap();
		map.put("member_id", session.getAttribute("member_id"));
		map.put("member_passwd", member_passwd);

		int flag = mapper.updatePw(map);

		if (flag == 1) {
			return "redirect:./member_read";
		} else {
			return "error";
		}
	}

	@GetMapping("/member_hap/member_updatePw")
	public String updatePw() {
		
		return "/member_hap/member_updatePw";
	}

	@GetMapping("/member_hap/member_updateNick")
	public String updateNick() {

		return "/member_hap/member_updateNick";
	}
	
	@PostMapping("/member_hap/member_updateNick")
	public String updateNick(String member_nickname, HttpSession session) {
		
		Map map = new HashMap();
		map.put("member_id", session.getAttribute("member_id"));
		map.put("member_nickname", member_nickname);
		
		int flag = mapper.updateNick(map);
		
		if (flag == 1) {
			return "redirect:./member_read";
		} else {
			return "error";
		}
	}
	

	@PostMapping("/member_hap/member_updateFile")
	public String updateFile(MultipartFile member_fname, String oldfile, HttpSession session,
			HttpServletRequest request) {
		String basePath = request.getRealPath("/storage");
		if (oldfile != null && !oldfile.equals("member.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}

		Map map = new HashMap();
		map.put("member_id", (String) session.getAttribute("member_id"));
		map.put("member_fname", Utility.saveFileSpring(member_fname, basePath));

		int flag = mapper.updateFile(map);
		if (flag == 1) {
			return "redirect:./member_read";
		} else {
			return "error";
		}
	}

	@GetMapping("/member_hap/member_updateFile")
	public String updateFile() {

		return "/member_hap/member_updateFile";
	}
	
	@PostMapping("/member_hap/member_updatebFile")
	public String updatebFile(MultipartFile member_backfile, String oldfile, HttpSession session,
			HttpServletRequest request) {
		String basePath = request.getRealPath("/storage");
		if (oldfile != null && !oldfile.equals("back.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}
		
		Map map = new HashMap();
		map.put("member_id", (String) session.getAttribute("member_id"));
		map.put("member_backfile", Utility.saveFileSpring(member_backfile, basePath));
		
		int flag = mapper.updatebFile(map);
		if (flag == 1) {
			return "redirect:./member_read";
		} else {
			return "error";
		}
	}
	
	@GetMapping("/member_hap/member_updatebFile")
	public String updatebFile() {
		
		return "/member_hap/member_updatebFile";
	}

	@ResponseBody
	@GetMapping(value = "/member_hap/idcheck", produces = "application/json; charset=utf-8")
	public Map<String, Object> idcheck(String member_id) {
		int flag = mapper.duplicatedId(member_id);

		Map<String, Object> map = new HashMap<String, Object>();

		if (flag == 1) {
			map.put("str", member_id + "은(는) 중복된 아이디입니다. 다른 아이디를 입력해주세요.");
		} else {
			map.put("str", member_id + "은(는) 사용할 수 있습니다.");
		}
		return map;
	}

	@ResponseBody
	@GetMapping(value = "/member_hap/emailcheck", produces = "application/json; charset=utf-8")
	public Map<String, Object> emailcheck(String member_email) {

		int flag = mapper.duplicatedEmail(member_email);

		Map<String, Object> map = new HashMap<String, Object>();

		if (flag == 1) {
			map.put("str", member_email + "은(는) 중복된 이메일입니다. 다른 이메일을 입력해주세요.");
		} else {
			map.put("str", member_email + "은(는) 사용할 수 있습니다.");
		}
		return map;
	}

	@RequestMapping("/member_hap/member_create")
	public String member_create(HttpServletRequest request, Model model) {
		if (request.getParameter("id") != null) {
			String kakao_id = request.getParameter("id");
			String kakao_email = request.getParameter("email");
			String kakao_fname = request.getParameter("fname");
			String kakao_name = request.getParameter("name");

			model.addAttribute("kakao_id", kakao_id);
			model.addAttribute("kakao_email", kakao_email);
			model.addAttribute("kakao_fname", kakao_fname);
			model.addAttribute("kakao_name", kakao_name);

			return "/member_hap/member_create";
		} else {
			return "/member_hap/member_create";
		}
	}

	@PostMapping("/member_hap/member_createProc")
	public String member_createProc(Member_hapDTO dto, Model model, HttpServletRequest request) {

		String url = "/member_hap/preProc";

		if (mapper.duplicatedId(dto.getMember_id()) == 1) {
			model.addAttribute("str", "중복된 아이디입니다. 아이디를 다시 입력해주세요");
		} else if (mapper.duplicatedEmail(dto.getMember_email()) == 1) {
			model.addAttribute("str", "중복된 이메일입니다. 이메일을 다시 입력해주세요");
		} else {

			String basePath = request.getRealPath("/storage");
			String basePathF = request.getRealPath("/storage");

//			System.out.println("member_fname_kakao " + request.getParameter("member_fname_kakao"));
//
//			String fname = request.getParameter("member_fname") == null ? "" : request.getParameter("member_fname");

			if (request.getParameter("set").equals("Kakao")) {
				int sizeF = (int) dto.getMember_backfileMF().getSize();

				dto.setMember_fname(request.getParameter("member_fname"));
				if (sizeF > 0) {
					dto.setMember_backfile(Utility.saveFileSpring(dto.getMember_backfileMF(), basePathF));
				} else {
					dto.setMember_backfile("back.jpg");
				}
				int flag = mapper.member_create(dto);

				if (flag == 1) {
					return "redirect:/";
				} else {
					model.addAttribute("str", "알 수 없는 이유로 회원가입에 실패하였습니다.");
				}

			} else if (request.getParameter("set").equals("Normal")) {
				int sizeF = (int) dto.getMember_backfileMF().getSize();
				int size = (int) dto.getMember_fnameMF().getSize();

				if (size > 0) {
					dto.setMember_fname(Utility.saveFileSpring(dto.getMember_fnameMF(), basePathF));
				} else {
					dto.setMember_fname("member.jpg");
				}

				if (sizeF > 0) {
					dto.setMember_backfile(Utility.saveFileSpring(dto.getMember_backfileMF(), basePathF));
				} else {
					dto.setMember_backfile("back.jpg");
				}
				int flag = mapper.member_create(dto);

				if (flag == 1) {
					return "redirect:/";
				} else {
					model.addAttribute("str", "알 수 없는 이유로 회원가입에 실패하였습니다.");
				}
			} else {
				model.addAttribute("str", "알 수 없는 이유로 회원가입에 실패하였습니다.");
			}
		}
		return url;
	}

	@RequestMapping(value = "/member_hap/login", method = { RequestMethod.GET })
	public String login(HttpServletRequest request, HttpSession session, Model model) {
		String c_member_id = "";
		String c_member_id_val = "";

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_member_id")) {
					c_member_id = cookie.getValue();
				} else if (cookie.getName().equals("c_member_id_val")) {
					c_member_id_val = cookie.getValue();
				}
			}
		}

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);

		request.setAttribute("c_member_id", c_member_id);
		request.setAttribute("c_member_id_val", c_member_id_val);

		return "/member_hap/login";
	}

	@PostMapping("/member_hap/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		int flag = mapper.loginCheck(map); // 여기면 flag 가 true

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);

		if (flag == 1) {
			String member_grade = mapper.getMember_grade(map.get("member_id"));

			session.setAttribute("member_id", map.get("member_id"));
			session.setAttribute("member_grade", member_grade);

			Cookie cookie = null;

			String c_member_id = request.getParameter("c_member_id");

			if (c_member_id != null) {
				cookie = new Cookie("c_member_id", "Y");
				cookie.setMaxAge(60 * 60);
				response.addCookie(cookie);

				cookie = new Cookie("c_member_id_val", map.get("member_id"));
				cookie.setMaxAge(60 * 60);
				response.addCookie(cookie);

			} else { // check를 푼 경우, 기존 쿠키의 유지값을 0으로 바꿔서 없애는 것
				cookie = new Cookie("c_member_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_member_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		if (flag == 1) {

			if (map.get("rurl") != null && !map.get("rurl").equals("")) {
				model.addAttribute("member_num", map.get("member_num"));
				model.addAttribute("nPage", map.get("nPage"));
				model.addAttribute("nowPage", map.get("nowPage"));
				model.addAttribute("col", map.get("col"));
				model.addAttribute("word", map.get("word"));

				return "redirect:" + map.get("rurl"); // rurl이 받아온 경로의 read페이지로
			} else {
				return "redirect:/";
			}

		} else {
			request.setAttribute("str", "아이디 또는 비밀번호가 잘못 입력하였거나<br>회원이 아닙니다. 회원가입을 해주세요.");
			return "/member_hap/preProc";

		}

	}

	@RequestMapping(value = "/member_hap/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		System.out.println(nickname);
		// 4.파싱 닉네임 세션으로 저장

		if (apiResult != null) {
			Member_hapDTO dto = new Member_hapDTO();

			JSONObject create1 = response_obj;

			Member_hapDTO flag = mapper.member_pread(nickname);

			if (flag != null) {
				request.setAttribute("str", "이미 네이버로 회원가입 되어있습니다.");

				return "/member_hap/preProc";
			} else {

				Object member_email = create1.get("email");
				Object member_birth = create1.get("birthday");
				Object member_name = create1.get("name");

				dto.setMember_id(nickname);
				dto.setMember_name((String) member_name);
				dto.setMember_email((String) member_email);
				dto.setMember_birth("1999-" + (String) member_birth);
				dto.setMember_fname("member.jpg");
				dto.setMember_backfile("back.jpg");
				dto.setMember_phone("010-0000-0000");
				dto.setMember_passwd("1234");

				mapper.member_create(dto);

				model.addAttribute("dto", dto);
			}
		}

		session.setAttribute("sessionId", nickname); // 세션 생성
		model.addAttribute("result", apiResult);
		return "/member_hap/callback";
	}

	@GetMapping("/member_hap/logout")
	public String logout(HttpSession session) throws IOException {
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/member_hap/idFind")
	public String idFind() {

		return "member_hap/idFind";
	}

	@PostMapping("/member_hap/idFind")
	public String idFind(String member_name, String member_email, Model model) {

		Map map = new HashMap();
		map.put("member_name", member_name);
		map.put("member_email", member_email);

		String member_id = mapper.findId(map);
		String str = "";

		if (member_id != null) {
			model.addAttribute("member_id", member_id);
			str = "당신의 아이디는 " + member_id + " 입니다.";
		} else {
			str = "가입된 회원이 아닙니다.";
		}

		model.addAttribute("str", str);
		return "member_hap/idFind_Proc";
	}

	@GetMapping("/member_hap/passwdFind")
	public String passwdFind() {

		return "member_hap/passwdFind";
	}

	@PostMapping("/member_hap/passwdFind")
	public String passwdFind(String member_name, String member_id, String member_email, Model model) {

		Map map = new HashMap();
		map.put("member_name", member_name);
		map.put("member_id", member_id);
		map.put("member_email", member_email);

		String member_passwd = mapper.findPasswd(map);
		String str = "";

		if (member_passwd != null) {
			model.addAttribute("member_passwd", member_passwd);
			str = "당신의 비밀번호는 " + member_passwd + " 입니다.";
		} else {
			str = "입력한 정보가 맞는 회원정보가 없습니다.";
		}

		model.addAttribute("str", str);
		return "member_hap/passwdFind_Proc";
	}

	@RequestMapping("/admin/member_list")
	public String list(HttpServletRequest request) {

		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		int nowPage = 1;
		int recordPerPage = 3;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = (nowPage - 1) * recordPerPage + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<Member_hapDTO> member_list = mapper.member_list(map);

		int total = mapper.member_total(map);
		String paging = Utility.paging_l(total, nowPage, recordPerPage, col, word);

		request.setAttribute("member_list", member_list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);

		return "/member_hap/member_list";
	}

	@GetMapping("/member_hap/member_read")
	public String read(String member_id, HttpSession session, Model model) {
		if (member_id == null) {
			member_id = (String) session.getAttribute("member_id");
		}
		Member_hapDTO dto = mapper.member_read(member_id);
		Map map = new HashMap();

		map.put("member_id",member_id);
		
		List<Res_hapDTO> dto_r = rmapper.read_id(map);
		
		
		/*
		 * Board_hapDTO dto_b = bmapper.read((int) map.get("board_num"));
		 */ 	

		model.addAttribute("dto", dto);
		model.addAttribute("dto_r",dto_r);
		/*
		 * model.addAttribute("dto_b",dto_b);
		 */
		return "/member_hap/member_read";
	}

	@GetMapping("/member_hap/member_delete")
	public String delete() {

		return "/member_hap/member_delete";
	}

	@PostMapping("/member_hap/member_delete")
	public String delete(String member_id, String oldfile, HttpServletRequest request, HttpSession session) {

		String basePath = request.getRealPath("/storage");

		int flag = mapper.member_delete(member_id);

		if (flag == 1) {
			session.invalidate();

		}
		if (flag == 1 && !oldfile.equals("member.jpg")) {
			Utility.deleteFile(basePath, oldfile);
		}

		if (flag == 1) {
			return "redirect:/";
		} else {
			request.setAttribute("str", "회원탈퇴에 실패하였습니다. 다시 시도 해주세요.");
			return "/member_hap/preProc";
		}
	}

	@GetMapping("/member_hap/member_update")
	public String update(String member_id, HttpSession session, Model model) {

		if (member_id == null) {
			member_id = (String) session.getAttribute("member_id");
		}

		Member_hapDTO dto = mapper.member_read(member_id);

		model.addAttribute("dto", dto);

		return "/member_hap/member_update";
	}

	@PostMapping("/member_hap/member_update")
	public String update(Member_hapDTO dto, Model model) {

		int flag = mapper.member_update(dto);

		if (flag == 1) {
			model.addAttribute("member_id", dto.getMember_id());
			return "redirect:./member_read";

		} else {
			String str = "회원정보 수정에 실패하였습니다. 다시 시도 해주세요.";
			return "/member_hap/preProc";
		}

	}

	@GetMapping("/member_hap/email_Form")
	public String email_Form() {

		return "member_hap/email_Form";
	}

	@PostMapping("/member_hap/email_Proc")
	public String email_Proc(String member_email, Model model) {

		int cnt = mapper.duplicatedEmail(member_email);

		boolean flag = false;

		if (cnt > 0)
			flag = true;
		model.addAttribute("flag", flag);

		return "member_hap/email_Proc";
	}

}