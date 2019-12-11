package spring.sts.webtest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.board.Board_hapDTO;
import spring.model.mapper.Board_hapMapper;
import spring.model.mapper.Room_hapMapper;
import spring.model.room.Room_hapDTO;
import spring.utility.webtest.Utility;

@Controller
public class Board_hapController {
	
	@Autowired
	private Board_hapMapper bmapper;
	
	@Autowired
	private Room_hapMapper rmapper;
	
//	@RequestMapping("/room_hap/list")
//	public String rlist(HttpServletRequest request) {
//		
//		int board_num = (Integer.parseInt(request.getParameter("board_num"))); 
//		List<Room_hapDTO> rlist = rmapper.list(board_num);
//		request.setAttribute("rlist", rlist);
//		return "/room_hap/list";
//	}
	
	@GetMapping("/board_hap/read")
	public String read(int board_num, HttpSession session, Model model, HttpServletRequest request,int nowPage, String col, String word) {
		
		if(board_num == 0) {
			board_num = (Integer)session.getAttribute("board_num");
		}
		
		Board_hapDTO dto = bmapper.read(board_num);
		model.addAttribute("dto", dto);
		model.addAttribute("board_num", board_num);
		request.setAttribute("board_num", board_num);
		
	    List<Room_hapDTO> rlist = rmapper.list(board_num);
		
		request.setAttribute("rlist", rlist);
		/* 댓글 관련 시작  << 리뷰 >> */
		int nPage = 1; // 시작 페이지 번호는 1부터

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 5; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("board_num", board_num);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);

		model.addAllAttributes(map);

		/* 댓글 관련 끝 */

		return "/board_hap/read";
	}
	
	@PostMapping("/board_hap/create")
	public String createProc_board(Board_hapDTO dto, Model model, HttpServletRequest request) {
		
			String url = "/preProc";
			
			String basePath = request.getRealPath("/storage");
			
			int size = (int)dto.getBoard_mapMF().getSize();
			
			if(size > 0) {
				dto.setBoard_map(Utility.saveFileSpring(dto.getBoard_mapMF(), basePath));
			}else {
				dto.setBoard_map("map.jpg");
			}
			
			if(bmapper.create(dto)==1) {
				url = "redirect:/board_hap/list";
			} else {
				model.addAttribute("str", "회원가입 실패입니다..");
				url = "url";
			}
		
		return url;
	}
	
	@GetMapping("/board_hap/create")
	public String create_board() {

		return "/board_hap/create";
	}
	
	@RequestMapping("/board_hap/list")
	public String list(HttpServletRequest request) {
		
		//검색관련
		String word = Utility.checkNull(request.getParameter("word"));
		String col = Utility.checkNull(request.getParameter("col"));

		if (col.equals("total")) {
			word = "";
		}

		//페이징관련

		int nowPage = 1;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5; //한 페이지당 보여줄 레코드갯수

		int sno = ((nowPage - 1) * recordPerPage) + 1; //1~5 6~10 11~15
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();

		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<Board_hapDTO> list = bmapper.list(map);

		int total = bmapper.total(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
 		
		return "/board_hap/list";
	} 

}
