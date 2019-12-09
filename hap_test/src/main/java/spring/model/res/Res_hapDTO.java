package spring.model.res;

public class Res_hapDTO {
	private int res_num;
	private int res_rannum;
	private String res_name;
	private String res_phone;
	private String res_content;
	private String res_res1;
	private String res_res2;
	private int res_people;
	private int board_num;
	private int room_num;
	private String member_id;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String board_name;
	private String board_map;
	private String board_account;
	private String board_content;
	private String room_filename;
	private int room_price;
	private String room_name;
	private String room_content;
	private String res_acc;
	
	public String getRes_acc() {
		return res_acc;
	}

	public void setRes_acc(String res_acc) {
		this.res_acc = res_acc;
	}



	private int room_max;
	
	public int getRes_num() {
		return res_num;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public int getRes_rannum() {
		return res_rannum;
	}



	public void setRes_rannum(int res_rannum) {
		this.res_rannum = res_rannum;
	}



	public String getRes_name() {
		return res_name;
	}



	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}



	public String getRes_phone() {
		return res_phone;
	}



	public void setRes_phone(String res_phone) {
		this.res_phone = res_phone;
	}



	public String getRes_content() {
		return res_content;
	}



	public void setRes_content(String res_content) {
		this.res_content = res_content;
	}



	public String getRes_res1() {
		return res_res1;
	}



	public void setRes_res1(String res_res1) {
		this.res_res1 = res_res1;
	}



	public String getRes_res2() {
		return res_res2;
	}



	public void setRes_res2(String res_res2) {
		this.res_res2 = res_res2;
	}



	public int getRes_people() {
		return res_people;
	}



	public void setRes_people(int res_people) {
		this.res_people = res_people;
	}



	public int getBoard_num() {
		return board_num;
	}



	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}



	public int getRoom_num() {
		return room_num;
	}



	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}



	public String getMember_id() {
		return member_id;
	}



	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}



	public String getMember_name() {
		return member_name;
	}



	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}



	public String getMember_email() {
		return member_email;
	}



	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}



	public String getMember_phone() {
		return member_phone;
	}



	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}



	public String getBoard_name() {
		return board_name;
	}



	public void setBoard_name(String board_name) {
		this.board_name = board_name;
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



	@Override
	public String toString() {
		return "Res_hapDTO [res_num=" + res_num + ", res_rannum=" + res_rannum + ", res_name=" + res_name
				+ ", res_phone=" + res_phone + ", res_content=" + res_content + ", res_res1=" + res_res1 + ", res_res2="
				+ res_res2 + ", res_people=" + res_people + ", board_num=" + board_num + ", room_num=" + room_num
				+ ", member_id=" + member_id + ", member_name=" + member_name + ", member_email=" + member_email
				+ ", member_phone=" + member_phone + ", board_name=" + board_name + ", board_map=" + board_map
				+ ", board_account=" + board_account + ", board_content=" + board_content + ", room_filename="
				+ room_filename + ", room_price=" + room_price + ", room_name=" + room_name + ", room_content="
				+ room_content + ", room_max=" + room_max + "]";
	}



	public Res_hapDTO(int res_num, int res_rannum, String res_name, String res_phone, String res_content,
			String res_res1, String res_res2, int res_people, int board_num, int room_num, String member_id,
			String member_name, String member_email, String member_phone, String board_name, String board_map,
			String board_account, String board_content, String room_filename, int room_price, String room_name,
			String room_content, int room_max) {
		super();
		this.res_num = res_num;
		this.res_rannum = res_rannum;
		this.res_name = res_name;
		this.res_phone = res_phone;
		this.res_content = res_content;
		this.res_res1 = res_res1;
		this.res_res2 = res_res2;
		this.res_people = res_people;
		this.board_num = board_num;
		this.room_num = room_num;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.board_name = board_name;
		this.board_map = board_map;
		this.board_account = board_account;
		this.board_content = board_content;
		this.room_filename = room_filename;
		this.room_price = room_price;
		this.room_name = room_name;
		this.room_content = room_content;
		this.room_max = room_max;
	}



	public Res_hapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}