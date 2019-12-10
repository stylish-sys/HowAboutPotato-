package spring.sts.webtest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.mapper.Room_hapMapper;
import spring.model.room.Room_hapDTO;
import spring.utility.webtest.Utility;

@Controller
public class Room_hapController {
	
	@Autowired
	private Room_hapMapper rmapper;
	
	@PostMapping("/room_hap/create") //room 정보등록(board안에서)
	public String createProc_room(Room_hapDTO dto, Model model, HttpServletRequest request) {
		
			String url = "/preProc";
			String basePath = request.getRealPath("/storage");
			int size = (int)dto.getRoom_filenameMF().getSize();
			if(size > 0) {
				dto.setRoom_filename(Utility.saveFileSpring(dto.getRoom_filenameMF(), basePath));
			}else {
				dto.setRoom_filename("room1.jpg");
			}
			if(rmapper.create(dto)==1) {
				url = "redirect:/board_hap/read";
				url += "?board_num=" + dto.getBoard_num();
				
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
		
		System.out.println("board_num :" + board_num);
		
		List<Room_hapDTO> rlist = rmapper.list(board_num);
		request.setAttribute("rlist", rlist);
		
		return "/room_hap/list";
	}

}
