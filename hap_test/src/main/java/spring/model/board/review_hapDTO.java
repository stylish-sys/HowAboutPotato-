package spring.model.board;

public class review_hapDTO {
	private String member_id;
	private String member_fname;
	private int rw_num;
	private String rw_content;
	private String rw_date;
	private int board_num;
	private String rw_star;
	public review_hapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public review_hapDTO(String member_id, String member_fname, int rw_num, String rw_content, String rw_date,
			int board_num, String rw_star) {
		super();
		this.member_id = member_id;
		this.member_fname = member_fname;
		this.rw_num = rw_num;
		this.rw_content = rw_content;
		this.rw_date = rw_date;
		this.board_num = board_num;
		this.rw_star = rw_star;
	}
	@Override
	public String toString() {
		return "review_hapDTO [member_id=" + member_id + ", member_fname=" + member_fname + ", rw_num=" + rw_num
				+ ", rw_content=" + rw_content + ", rw_date=" + rw_date + ", board_num=" + board_num + ", rw_star="
				+ rw_star + "]";
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_fname() {
		return member_fname;
	}
	public void setMember_fname(String member_fname) {
		this.member_fname = member_fname;
	}
	public int getRw_num() {
		return rw_num;
	}
	public void setRw_num(int rw_num) {
		this.rw_num = rw_num;
	}
	public String getRw_content() {
		return rw_content;
	}
	public void setRw_content(String rw_content) {
		this.rw_content = rw_content;
	}
	public String getRw_date() {
		return rw_date;
	}
	public void setRw_date(String rw_date) {
		this.rw_date = rw_date;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getRw_star() {
		return rw_star;
	}
	public void setRw_star(String rw_star) {
		this.rw_star = rw_star;
	}
	

	
}
