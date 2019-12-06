package spring.model.member_hap;

import org.springframework.web.multipart.MultipartFile;

public class Member_hapDTO {

	private int member_num       ;
	private String member_id     ;  
	private String member_name   ;
	private String  member_passwd;
	private String member_phone  ;
	private String member_email  ;
	private String member_birth  ;
	private String member_fname  ;
	private MultipartFile member_fnameMF;
	private char member_grade  ;
	
	public Member_hapDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Member_hapDTO(int member_num, String member_id, String member_name, String member_passwd,
			String member_phone, String member_email, String member_birth, String member_fname, MultipartFile member_fnameMF,
			char member_grade) {
		super();
		this.member_num = member_num;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_passwd = member_passwd;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_birth = member_birth;
		this.member_fname = member_fname;
		this.member_fnameMF = member_fnameMF;
		this.member_grade = member_grade;
	}
	
	@Override
	public String toString() {
		return "Member_hapDTO [member_num=" + member_num + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_passwd=" + member_passwd + ", member_phone=" + member_phone + ", member_email="
				+ member_email + ", member_birth=" + member_birth + ", member_fname=" + member_fname + ", member_fnameMF="
				+ member_fnameMF + ", member_grade=" + member_grade + "]";
	}

	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
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
	public String getMember_passwd() {
		return member_passwd;
	}
	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_fname() {
		return member_fname;
	}
	public void setMember_fname(String member_fname) {
		this.member_fname = member_fname;
	}
	
	public MultipartFile getMember_fnameMF() {
		return member_fnameMF;
	}

	public void setMember_fnameMF(MultipartFile member_fnameMF) {
		this.member_fnameMF = member_fnameMF;
	}

	public char getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(char member_grade) {
		this.member_grade = member_grade;
	}
	
	
}
