package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.mapper.ResMapper;
import spring.model.res.Res_hapDTO;
import spring.utility.webtest.Utility;

@Controller
public class ResController {
	@Autowired
	private ResMapper mapper;
//	private RoomMapper r_mapper;
//	private BoardMapper b_mapper;
//	private MemberMapper m_mapper;
//	private Resmapper mapper;

	private static final Logger logger = LoggerFactory.getLogger(ResController.class);

	@RequestMapping("/res/list")
	public String list(HttpServletRequest request, Model model) {

		logger.info("list()가 호출되었음");

		String word = Utility.checkNull(request.getParameter("word"));
		String col = Utility.checkNull(request.getParameter("col"));
		
		Map map = new HashMap();
		
		if (col.equals("total")) { word = ""; }
		
		
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 4;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;


		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		
		List<Res_hapDTO> list = mapper.list(map);
		
		int total = mapper.total(map);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);

		return "/res/list";
	}

	@GetMapping("/res/create")
	public String create(Model model, int board_num, HttpServletRequest request, HttpSession session){
		Map map = new HashMap();
		
		List<Res_hapDTO> room_hap = mapper.room_hap(board_num);
		
		Res_hapDTO dto_b = mapper.board_hap(board_num);
		//Res_hapDTO dto_m = mapper.member_hap(dto_b.getMember_id());
		
		model.addAttribute("dto_b", dto_b);
		//model.addAttribute("dto_m", dto_m);

		request.setAttribute("room_hap", room_hap);
		
		return "/res/create";
	}

	@PostMapping("/res/create")
	public String create(Res_hapDTO dto, Model model, HttpServletRequest request) {
	
		if (mapper.create(dto) == 1) {
			return "redirect:/res/list";
		} else {
			return "error";
		}
	}

	@GetMapping("/res/read")
	public String read(int res_num, Model model, HttpServletRequest request) {
		Res_hapDTO dto = mapper.read(res_num);
		Res_hapDTO dto_r = mapper.room_r_hap(dto.getRoom_num());
		Res_hapDTO dto_m = mapper.member_hap(dto.getMember_id());
		Res_hapDTO dto_b = mapper.board_hap(dto.getBoard_num());
		
		model.addAttribute("dto_r", dto_r);
		model.addAttribute("dto_b", dto_b);
		model.addAttribute("dto_m", dto_m);
		model.addAttribute("dto", dto);

		/*
		 * int nPage = 1; if (request.getParameter("nPage") != null) { nPage =
		 * Integer.parseInt(request.getParameter("nPage")); } int recordPerPage = 3;
		 * 
		 * int sno = ((nPage - 1) * recordPerPage) + 1; int eno = nPage * recordPerPage;
		 * 
		 * Map map = new HashMap(); map.put("res_num", res_num); map.put("sno", sno);
		 * map.put("eno", eno); map.put("nPage", nPage); map.put("nowPage", nowPage);
		 * map.put("col", col); map.put("word", word);
		 * 
		 * model.addAllAttributes(map);
		 */
		return "/res/read";
	}

	@GetMapping("/res/update")
	public String update(int res_num, Model model) {
		Res_hapDTO dto = mapper.read(res_num);
		
		model.addAttribute("dto", dto);

		return "/res/update";
	}

	@PostMapping("/res/update")
	public String update(Res_hapDTO dto, Model model, String col, String word, String nowPage) {
		Map map = new HashMap();
		map.put("res_num", dto.getRes_num());
		
		int flag = 0;
		flag = mapper.update(dto);
		if (flag == 1) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			// redirect 로 갈시에는 정보가 안넘어가서
			// model 로 넘겨줘야함
			return "redirect:/res/list";
		} else {
			model.addAttribute("str", "에러");
			return "error";
		}
	}

	@GetMapping("/res/delete")
	public String delete(Model model) {

		return "/res/delete";
	}

	@PostMapping("/res/delete")
	public String delete(int res_num, Model model, String col, String word, String nowPage) {

		int flag = mapper.delete(res_num);
		if(flag == 1)
			return "redirect:/res/list";
		else
			return "error";
			
	}
}
