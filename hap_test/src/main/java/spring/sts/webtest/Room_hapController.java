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
import org.springframework.web.multipart.MultipartFile;

import spring.model.mapper.Room_hapMapper;
import spring.model.room.Room_hapDTO;
import spring.model.room.Room_hapService;
import spring.utility.webtest.Utility;

@Controller
public class Room_hapController {

	@Autowired
	private Room_hapMapper rmapper;
	
	@Autowired
	private Room_hapService service;
	
	@PostMapping("/room_hap/updateFile")
	public String updateFile(Room_hapDTO dto,String oldfile, MultipartFile room_filenameMF,  HttpSession session, HttpServletRequest request, Model model) {
		
		// 검색관련
		String word = Utility.checkNull(request.getParameter("word"));
		String col = Utility.checkNull(request.getParameter("col"));

		if (col.equals("total")) {
			word = "";
			}

		// 페이징관련
		int nowPage = 1;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}

		String basePath = request.getRealPath("/storage");
		
		if (oldfile != null) {
			Utility.deleteFile(basePath, oldfile);
		}
		
		Map map = new HashMap();
		map.put("room_num", dto.getRoom_num());
		map.put("room_filename", Utility.saveFileSpring(room_filenameMF, basePath));
		
		int flag = rmapper.updateFile(map);
		
		if (flag==1) {
			return "redirect:/board_hap/read?board_num=" + dto.getBoard_num()  + "&col=" + col + "&word=" + word + "&nowPage=" + nowPage;

		} else {
			
			model.addAttribute("str", "업데이트 실패입니다");
			return "/room_hap/preProc";
		}
	}
	
	@GetMapping("/room_hap/updateFile")
	public String updateFile() {
		
		return "/room_hap/updateFile";
	}

	@PostMapping("/room_hap/update")
	public String update(Room_hapDTO dto, MultipartFile room_filename, String oldfile, HttpSession session,
			HttpServletRequest request, Model model) {
		
		// 검색관련
		String word = Utility.checkNull(request.getParameter("word"));
		String col = Utility.checkNull(request.getParameter("col"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이징관련

		int nowPage = 1;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}


		int flag = rmapper.update(dto);

		if (flag==1) {
			return "redirect:/board_hap/read?board_num=" + dto.getBoard_num()  + "&col=" + col + "&word=" + word + "&nowPage=" + nowPage;

		} else {
			
			model.addAttribute("str", "업데이트 실패입니다");
			return "/room_hap/preProc";
		}

	}

	@GetMapping("/room_hap/update")
	public String update(int room_num, HttpSession session, Model model) {

		Room_hapDTO dto = rmapper.read(room_num);
		System.out.println(dto.getRoom_name());
		model.addAttribute("dto", dto);
		return "/room_hap/update";
	}

	@GetMapping("/room_hap/delete")
	public String delete() {

		return "/room_hap/delete";
	}

	@PostMapping("/room_hap/delete") // se
	public String delete(Room_hapDTO dto, int room_num, HttpSession session, HttpServletRequest requset, Model model, HttpServletRequest request) {
		
				// 검색관련
				String word = Utility.checkNull(request.getParameter("word"));
				String col = Utility.checkNull(request.getParameter("col"));

				if (col.equals("total")) {
					word = "";
				}

				// 페이징관련

				int nowPage = 1;

				if (request.getParameter("nowPage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}

		try{
			service.delete(room_num);
			return "redirect:/board_hap/read?board_num=" + dto.getBoard_num() + "&col=" + col + "&word=" + word + "&nowPage=" + nowPage;
		} catch(Exception e) {
			model.addAttribute("str", "방 정보 삭제실패입니다..");
			return "error";

		}
	}

	@PostMapping("/room_hap/create") // room 정보등록(board안에서)
	public String createProc_room(Room_hapDTO dto, Model model, HttpServletRequest request) {
		
		// 검색관련
		String word = Utility.checkNull(request.getParameter("word"));
		String col = Utility.checkNull(request.getParameter("col"));

		if (col.equals("total")) {
			word = "";
		}

		// 페이징관련

		int nowPage = 1;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		String url = "/preProc";
		String basePath = request.getRealPath("/images");
		int size = (int) dto.getRoom_filenameMF().getSize();
		
		if (size > 0) {
			dto.setRoom_filename(Utility.saveFileSpring(dto.getRoom_filenameMF(), basePath));
		} else {
			dto.setRoom_filename("room1.jpg");
		}
		if (rmapper.create(dto) == 1) {
			url = "redirect:/board_hap/read";
			url += "?board_num=" + dto.getBoard_num();
			url += "&col=" + col;
			url += "&word=" + word;
			url += "&nowPage=" + nowPage;

		} else {
			model.addAttribute("str", "방 정보 입력실패입니다..");
			url = "/preProc";
		}

		return url;
	}

	@GetMapping("/room_hap/create")
	public String create_room() {

		return "/room_hap/create";
	}

	@RequestMapping("/room_hap/list")
	public String list(HttpServletRequest request) {

		int board_num = (Integer.parseInt(request.getParameter("board_num")));

		List<Room_hapDTO> rlist = rmapper.list(board_num);
		request.setAttribute("rlist", rlist);

		return "/room_hap/list";
	}

}
