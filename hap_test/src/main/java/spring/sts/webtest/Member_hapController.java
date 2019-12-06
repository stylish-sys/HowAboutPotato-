package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.mapper.Member_hapMapper;
import spring.model.member_hap.Member_hapDTO;
import spring.utility.webtest.Utility;

@Controller
public class Member_hapController {

	@Autowired
	private Member_hapMapper mapper;

	@GetMapping("/member_hap/agree")
	public String agree() {
		return "/member_hap/agree";
	}
	
	@ResponseBody
	@GetMapping(value = "/member_hap/idcheck", produces = "application/json; charset=utf-8")
	public Map<String, Object> idcheck(String member_id) {
		int flag = mapper.duplicatedId(member_id);

		Map<String, Object> map=new HashMap<String, Object>();

		if (flag==1) {
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

		Map<String, Object> map=new HashMap<String, Object>();

		if (flag==1) {
			map.put("str", member_email + "은(는) 중복된 이메일입니다. 다른 이메일을 입력해주세요.");
		} else {
			map.put("str", member_email + "은(는) 사용할 수 있습니다.");
		}
		return map;
	}
	
	@RequestMapping("/member_hap/member_create")
	public String member_create() {
		return "/member_hap/member_create";
	}
	
	@PostMapping("/member_hap/member_createProc")
	public String member_createProc(Member_hapDTO dto, Model model, HttpServletRequest request) {
		
		String url="/member_hap/preProc";
		
		if(mapper.duplicatedId(dto.getMember_id())==1){
			model.addAttribute("str", "중복된 아이디입니다. 아이디를 다시 입력해주세요");
		}else if(mapper.duplicatedEmail(dto.getMember_email())==1){
			model.addAttribute("str", "중복된 이메일입니다. 이메일을 다시 입력해주세요");
		}else {
		
			String basePath=request.getRealPath("/storage");
			
			int size=(int)dto.getMember_fnameMF().getSize();
			
			if(size>0) {
				dto.setMember_fname(Utility.saveFileSpring(dto.getMember_fnameMF(), basePath));
			}else {
				dto.setMember_fname("member.jpg");
			}
			
			int flag=mapper.member_create(dto);
			
			if(flag==1) {
				return "redirect:/";
			}else {
				model.addAttribute("str", "알 수 없는 이유로 회원가입에 실패하였습니다.");
			}		
     	}
		return url;
	}
	
	@GetMapping("/member_hap/login")
	public String login(HttpServletRequest request) {
		String c_member_id="";
		String c_member_id_val="";
		
		Cookie[] cookies=request.getCookies();
		Cookie cookie=null;
		
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				cookie=cookies[i];
				
				if(cookie.getName().equals("c_member_id")){
					c_member_id=cookie.getValue();
				 }else if(cookie.getName().equals("c_member_id_val")){ 
					c_member_id_val=cookie.getValue();
				}
			}
		}
		
		request.setAttribute("c_member_id", c_member_id);
		request.setAttribute("c_member_id_val", c_member_id_val);
		
		return "/member_hap/login";
	}
	
	
	@PostMapping("/member_hap/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session,
					HttpServletRequest request, HttpServletResponse response, Model model) { 

		int flag=mapper.loginCheck(map);  //여기면 flag 가 true
		
		if(flag==1){
			String member_grade=mapper.getMember_grade(map.get("member_id"));
			
			session.setAttribute("member_id", map.get("member_id"));
			session.setAttribute("member_grade", member_grade);
			
			Cookie cookie=null;
			
			String c_member_id=request.getParameter("c_member_id");
			
			if(c_member_id !=null){
				cookie=new Cookie("c_member_id", "Y");
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);
				
				cookie=new Cookie("c_member_id_val", map.get("member_id"));
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);
				
			}else{    //check를 푼 경우, 기존 쿠키의 유지값을 0으로 바꿔서 없애는 것
				cookie=new Cookie("c_member_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
				cookie=new Cookie("c_member_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
			if(flag==1) {
				
				if(map.get("rurl")!=null && !map.get("rurl").equals("")) {
					model.addAttribute("member_num", map.get("member_num"));
					model.addAttribute("nPage", map.get("nPage"));
					model.addAttribute("nowPage", map.get("nowPage"));
					model.addAttribute("col", map.get("col"));
					model.addAttribute("word", map.get("word"));
					
					return "redirect:"+map.get("rurl");  //rurl이 받아온 경로의 read페이지로
				} else {
					return "redirect:/";
				}
				
			}else {
				request.setAttribute("str", "아이디 또는 비밀번호가 잘못 입력하였거나<br>회원이 아닙니다. 회원가입을 해주세요.");
				return "/member_hap/preProc";
			
			}
		
		}
	
	
	@GetMapping("/member_hap/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	@GetMapping("/member_hap/idFind")
	public String idFind() {
		
		return "member_hap/idFind";
	}
	
	
	
	@PostMapping("/member_hap/idFind")
	public String idFind(String member_name, String member_email, Model model) {
		
		Map map=new HashMap();
		map.put("member_name", member_name);
		map.put("member_email", member_email);
					
		String member_id=mapper.findId(map);	 
		String str="";
		
		if(member_id!=null) {
			model.addAttribute("member_id", member_id);
			str= "당신의 아이디는 "+member_id+ " 입니다.";
		}else { 
			 str="가입된 회원이 아닙니다.";		
		 } 
		
		model.addAttribute("str", str);
		return "member_hap/idFind_Proc";
	}
	
	
	@GetMapping("/member_hap/passwdFind")
	public String passwdFind() {
		
		return "member_hap/passwdFind";
	}
	
	
	
	@PostMapping("/member_hap/passwdFind")
	public String passwdFind( String member_name, String member_id, String member_email, Model model) {
		
		Map map=new HashMap();
		map.put("member_name", member_name);
		map.put("member_id", member_id);
		map.put("member_email", member_email);
					
		String member_passwd=mapper.findPasswd(map);	
		String str="";
		
		if(member_passwd!=null) {
			model.addAttribute("member_passwd", member_passwd);
			str= "당신의 비밀번호는 "+member_passwd+ " 입니다.";
		}else { 
			 str="입력한 정보가 맞는 회원정보가 없습니다.";		
		 } 
		
		model.addAttribute("str", str);
		return "member_hap/passwdFind_Proc";
	}
	
	
	@RequestMapping("/admin/member_list")
	public String list(HttpServletRequest request) {
		
		String col= Utility.checkNull(request.getParameter("col"));
		String word= Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) word="";
		
		int nowPage=1;
		int recordPerPage=3;
		
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno=(nowPage-1)*recordPerPage+1;
		int eno=nowPage*recordPerPage;
		
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<Member_hapDTO> member_list=mapper.member_list(map);
		
		int total=mapper.member_total(map); 
		String paging=Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("member_list", member_list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/member_hap/member_list";
	}
	
	
	@GetMapping("/member_hap/member_read")
	public String read(String member_id, HttpSession session, Model model) {
		
		if(member_id==null) {
			member_id= (String)session.getAttribute("member_id");
		}

		Member_hapDTO dto=mapper.member_read(member_id);
		
		model.addAttribute("dto", dto);
		
		return "/member_hap/member_read";
	}
	
	@GetMapping("/member_hap/member_delete")
	public String delete() {
		
		return "/member_hap/member_delete";
	}
	
	@PostMapping("/member_hap/member_delete")
	public String delete(String member_id, String oldfile, 
			HttpServletRequest request, HttpSession session) {
		
		String basePath=request.getRealPath("/storage");
		
		 int flag = mapper.member_delete(member_id);
		    
		   if(flag==1){
			   session.invalidate();
			   
		   }
		    if(flag==1 && !oldfile.equals("member.jpg")){
		      Utility.deleteFile(basePath, oldfile);
		    }
		 			
		    if(flag==1){
		    	return "redirect:/";
		     }else{
		    	 request.setAttribute("str", "회원탈퇴에 실패하였습니다. 다시 시도 해주세요.");
				return "/member_hap/preProc";
		      }
	}
	
	@GetMapping("/member_hap/member_update")
	public String update(String member_id, HttpSession session, Model model) {
		
		if(member_id==null) {
			member_id= (String)session.getAttribute("member_id");
		}

		Member_hapDTO dto=mapper.member_read(member_id);
		
		model.addAttribute("dto", dto);
		
		return "/member_hap/member_update";
	}
	
	@PostMapping("/member_hap/member_update")
	public String update(Member_hapDTO dto,Model model) {
		
		int flag=mapper.member_update(dto);
		
		if(flag==1) {
			model.addAttribute("member_id", dto.getMember_id());
			return "redirect:./member_read";
			
		}else {
	    	String str= "회원정보 수정에 실패하였습니다. 다시 시도 해주세요.";
			return "/member_hap/preProc";
		}
		
	}
	
	@GetMapping("/member_hap/email_Form")
	public String email_Form() {
		
		return "member_hap/email_Form";
	}
	
	@PostMapping("/member_hap/email_Proc")
	public String email_Proc(String member_email,Model model) {
		
		int cnt=mapper.duplicatedEmail(member_email);
		
		boolean flag=false;
		
		if(cnt>0) flag=true;
		model.addAttribute("flag", flag);
		
		return "member_hap/email_Proc";
	}
	
	
	
}