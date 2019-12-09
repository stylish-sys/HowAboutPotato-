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
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.mapper.NoticeMapper;
import spring.model.notice.NoticeDTO;
import spring.utility.webtest.Utility;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeMapper notice_mapper;
	
	@RequestMapping("/notice/listNotice")
	public String list(HttpServletRequest request) {
		
		String word=Utility.checkNull(request.getParameter("word"));//검색어 입력시 받는 문자열 저장
		
		String col=Utility.checkNull(request.getParameter("col"));
		
		if(col.equals("total")){
			word="";
		}
		
		int nowPage=1; //보고있는 페이지 
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage=5;
		
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno=nowPage*recordPerPage;  
				
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		map.put("sno",sno);
		map.put("eno",eno);
		
		List<NoticeDTO> list = notice_mapper.list(map);
		
		int total=notice_mapper.total(map);
		String paging=Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("notice_mapper", notice_mapper);
		
		return "/notice/listNotice";
	}
	
	@GetMapping("/notice/createNotice")
	public String create() {
		
		return "/notice/createNotice";
	}
	
	@PostMapping("/notice/create")
	public String create(NoticeDTO dto, Model model,HttpServletRequest request) {
		
		String basePath = request.getRealPath("/storage");
		
		int filesize = (int) dto.getNotice_filenameMF().getSize();
				
		if(filesize>0) {
			dto.setNotice_filename(Utility.saveFileSpring(dto.getNotice_filenameMF(), basePath));
		}
		int flag=notice_mapper.create(dto);
		
		if(flag==1) {
			return "redirect:/notice/listNotice";
		}else {
			model.addAttribute("str","error");
			return "/notice/preProcNotice";
		}
	}
	
	@GetMapping("/notice/readNotice")
	public String read(int notice_num, Model model) {
		notice_mapper.upViewcnt(notice_num);
		NoticeDTO dto=notice_mapper.read(notice_num);
		model.addAttribute("dto", dto);
		//model객체를 이용해서 view로 데이터 전달
		
		String notice_content=dto.getNotice_content().replaceAll("\r\n", "<br>");
		dto.setNotice_content(notice_content);
		
		return "/notice/readNotice";
	}
	
	@GetMapping("/notice/updateNotice")
	public String update(int notice_num, Model model) {
		model.addAttribute("dto", notice_mapper.read(notice_num));
			
		return "/notice/updateNotice";
	}
	
	@PostMapping("/notice/updateNotice")
	public String update(NoticeDTO dto, Model model, HttpServletRequest request, String notice_oldfile) {
		
		String basePath=request.getRealPath("/storage");
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("notice_num", String.valueOf(dto.getNotice_num()));
		map.put("notice_passwd", dto.getNotice_passwd());
		
		int pflag=notice_mapper.passCheck(map);
		int flag=0;
		
		dto.setNotice_filesize((int)dto.getNotice_filenameMF().getSize());
		
		if(pflag==1) {
			if(dto.getNotice_filesize()>0) {
				Utility.deleteFile(basePath, notice_oldfile);
				dto.setNotice_filename(Utility.saveFileSpring(dto.getNotice_filenameMF(), basePath));
				
			}
			flag=notice_mapper.update(dto);
		}
		model.addAttribute("pflag", pflag);
		model.addAttribute("flag", flag);
		
		return "redirect:/notice/listNotice";
		
	}
	
	@GetMapping("/notice/deleteNotice")
	public String delete(int notice_num, Model model) {
		model.addAttribute("dto", notice_mapper.read(notice_num));
		
		return "/notice/deleteNotice";
	}
	
	@PostMapping("/notice/deleteNotice")
	public String delete(HttpServletRequest request, @RequestParam Map<String, String> map,int nowPage, String word, String col, Model model) {
		
		String basePath =request.getRealPath("/storage");
		
		int pflag=notice_mapper.passCheck(map);
		int flag=0;		
		if(pflag==1) {
			Utility.deleteFile(basePath, request.getParameter("notice_oldfile"));
			flag=notice_mapper.delete(Integer.parseInt(map.get("notice_num")));
		}	
		if(flag==1) {
			model.addAttribute("nowPage", nowPage);
		    model.addAttribute("word", word);
		    model.addAttribute("col", col);
		    model.addAttribute("flag", flag);
		    model.addAttribute("pflag", pflag);
		    
		    return "redirect:/notice/listNotice";
		}else {
			
			return "/notice/preProcNotice";
		}
	    
	    
	}
	
}
