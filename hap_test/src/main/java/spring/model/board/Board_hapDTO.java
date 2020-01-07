package spring.model.board;

import org.springframework.web.multipart.MultipartFile;

public class Board_hapDTO {
	
    private int board_num            ;
    private String board_name        ;
    private String board_address1     ;//새로 추가
    private String board_address2     ; //새로 추가
    private String board_zipcode     ; //새로 추가
    private String board_map         ;
    private String board_filename    ; //새로 추가
    private String board_account     ;
    private String board_content     ;
    private int board_cnt            ;
    private MultipartFile board_mapMF;
    private MultipartFile board_filenameMF;
    
    private int room_price;
	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public MultipartFile getBoard_filenameMF() {
		return board_filenameMF;
	}

	public void setBoard_filenameMF(MultipartFile board_filenameMF) {
		this.board_filenameMF = board_filenameMF;
	}

	public MultipartFile getBoard_mapMF() {
		return board_mapMF;
	}

	public void setBoard_mapMF(MultipartFile board_mapMF) {
		this.board_mapMF = board_mapMF;
	}

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

	public String getBoard_address1() {
		return board_address1;
	}

	public void setBoard_address1(String board_address1) {
		this.board_address1 = board_address1;
	}

	public String getBoard_address2() {
		return board_address2;
	}

	public void setBoard_address2(String board_address2) {
		this.board_address2 = board_address2;
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



	public String getBoard_zipcode() {
		return board_zipcode;
	}

	public void setBoard_zipcode(String board_zipcode) {
		this.board_zipcode = board_zipcode;
	}

	public Board_hapDTO(int board_num, String board_name, String board_address1, String board_address2,
			String board_zipcode, String board_map, String board_filename, String board_account, String board_content,
			int board_cnt, MultipartFile board_mapMF, int room_price) {
		super();
		this.board_num = board_num;
		this.board_name = board_name;
		this.board_address1 = board_address1;
		this.board_address2 = board_address2;
		this.board_zipcode = board_zipcode;
		this.board_map = board_map;
		this.board_filename = board_filename;
		this.board_account = board_account;
		this.board_content = board_content;
		this.board_cnt = board_cnt;
		this.board_mapMF = board_mapMF;
		this.room_price = room_price;
	}

	@Override
	public String toString() {
		return "Board_hapDTO [board_num=" + board_num + ", board_name=" + board_name + ", board_address1="
				+ board_address1 + ", board_address2=" + board_address2 + ", board_zipcode=" + board_zipcode
				+ ", board_map=" + board_map + ", board_filename=" + board_filename + ", board_account=" + board_account
				+ ", board_content=" + board_content + ", board_cnt=" + board_cnt + ", board_mapMF=" + board_mapMF + ", room_price=" + room_price
				+ "]";
	}

	public String getBoard_filename() {
		return board_filename;
	}

	public void setBoard_filename(String board_filename) {
		this.board_filename = board_filename;
	}

	public Board_hapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    

}
