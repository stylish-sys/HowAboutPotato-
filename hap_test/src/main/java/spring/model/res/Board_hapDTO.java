package spring.model.res;

import org.springframework.web.multipart.MultipartFile;

public class Board_hapDTO {

	private int board_num;
	private String board_name;
	private String board_address;
	private String board_map;
	private String board_account;
	private String board_content;
	private MultipartFile board_mapMF;
	public MultipartFile getBoard_mapMF() {
		return board_mapMF;
	}

	public void setBoard_mapMF(MultipartFile board_mapMF) {
		this.board_mapMF = board_mapMF;
	}

	private int board_cnt;

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}

	public String getBoard_address() {
		return board_address;
	}

	public void setBoard_address(String board_address) {
		this.board_address = board_address;
	}

	public String getBoard_map() {
		return board_map;
	}

	public void setBoard_map(String board_map) {
		this.board_map = board_map;
	}

	public String getBoard_account() {
		return board_account;
	}

	public void setBoard_account(String board_account) {
		this.board_account = board_account;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_cnt() {
		return board_cnt;
	}

	public void setBoard_cnt(int board_cnt) {
		this.board_cnt = board_cnt;
	}

	@Override
	public String toString() {
		return "Board_hapDTO [board_num=" + board_num + ", board_name=" + board_name + ", board_address="
				+ board_address + ", board_map=" + board_map + ", board_account=" + board_account + ", board_content="
				+ board_content + ", board_cnt=" + board_cnt + "]";
	}

	public Board_hapDTO(int board_num, String board_name, String board_address, String board_map, String board_account,
			String board_content, int board_cnt) {
		super();
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_address = board_address;
		this.board_map = board_map;
		this.board_account = board_account;
		this.board_content = board_content;
		this.board_cnt = board_cnt;
	}

	public Board_hapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
