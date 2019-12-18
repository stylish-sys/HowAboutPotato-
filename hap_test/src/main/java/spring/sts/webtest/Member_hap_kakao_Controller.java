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
public class Member_hap_kakao_Controller {

	@Autowired
	private Member_hapMapper mapper;

	
	@RequestMapping("/member_hap/member_kakao_create")
	public String member_create(HttpServletRequest request, Model model) {
		
		String kakao_id =request.getParameter("id");
		String kakao_email =request.getParameter("email");
		String kakao_fname =request.getParameter("fname");
		String kakao_name =request.getParameter("name");
		
		model.addAttribute("kakao_id",kakao_id);
		model.addAttribute("kakao_email",kakao_email);
		model.addAttribute("kakao_fname",kakao_fname);
		model.addAttribute("kakao_name",kakao_name);
		
		return "/member_hap/member_kakao_create";
	}
	
//	@PostMapping("/member_hap/member_kakao_createProc")
//	public String member_createProc(Member_hapDTO dto, Model model, HttpServletRequest request) {
//		
//		String url="/member_hap/preProc";
//		
//		if(mapper.duplicatedId(dto.getMember_id())==1){
//			model.addAttribute("str", "중복된 아이디입니다. 아이디를 다시 입력해주세요");
//		}else if(mapper.duplicatedEmail(dto.getMember_email())==1){
//			model.addAttribute("str", "중복된 이메일입니다. 이메일을 다시 입력해주세요");
//		}else {
//		
//			String basePath=request.getRealPath("/storage");
//			
//			int size=(int)dto.getMember_fnameMF().getSize();
//			
//			if(size>0) {
//				dto.setMember_fname(Utility.saveFileSpring(dto.getMember_fnameMF(), basePath));
//			}else {
//				dto.setMember_fname("member.jpg");
//			}
//			
//			int flag=mapper.member_create(dto);
//			
//			if(flag==1) {
//				return "redirect:/";
//			}else {
//				model.addAttribute("str", "알 수 없는 이유로 회원가입에 실패하였습니다.");
//			}		
//     	}
//		return url;
//	}
	
}