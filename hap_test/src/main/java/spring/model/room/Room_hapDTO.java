package spring.model.room;

import org.springframework.web.multipart.MultipartFile;

public class Room_hapDTO {
	
    private int		 room_num           ;
    private String 	 room_filename      ;
    private int 	 room_price         ;
    private String   room_name          ;
    private String   room_content       ;
    private int      room_max           ;
    private int      board_num          ;
    private MultipartFile room_filenameMF; //새로 추가
    
	public MultipartFile getRoom_filenameMF() {
		return room_filenameMF;
	}


	public void setRoom_filenameMF(MultipartFile room_filenameMF) {
		this.room_filenameMF = room_filenameMF;
	}


	public int getRoom_num() {
		return room_num;
	}


	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}



	public String getRoom_filename() {
		return room_filename;
	}



	public void setRoom_filename(String room_filename) {
		this.room_filename = room_filename;
	}



	public int getRoom_price() {
		return room_price;
	}



	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}



	public String getRoom_name() {
		return room_name;
	}



	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}



	public String getRoom_content() {
		return room_content;
	}



	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}



	public int getRoom_max() {
		return room_max;
	}



	public void setRoom_max(int room_max) {
		this.room_max = room_max;
	}



	public int getBoard_num() {
		return board_num;
	}



	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}



	@Override
	public String toString() {
		return "Room_hapDTO [room_num=" + room_num + ", room_filename=" + room_filename + ", room_price=" + room_price
				+ ", room_name=" + room_name + ", room_content=" + room_content + ", room_max=" + room_max
				+ ", board_num=" + board_num + "]";
	}



	public Room_hapDTO(int room_num, String room_filename, int room_price, String room_name, String room_content,
			int room_max, int board_num) {
		super();
		this.room_num = room_num;
		this.room_filename = room_filename;
		this.room_price = room_price;
		this.room_name = room_name;
		this.room_content = room_content;
		this.room_max = room_max;
		this.board_num = board_num;
	}



	public Room_hapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    

}
