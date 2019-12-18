package spring.model.notice;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	
	private int notice_num;//   number  not null,
	private String member_id;// varchar(20) not null,
	private String notice_title;//   varchar(1000)   not null,
	private String notice_content;// varchar(4000)    not null,
	private int notice_viewcnt;// number not null,
	private String notice_passwd;//  varchar(10) not null,
	private String notice_wdate;//   date    not null,
	private String notice_filename;// VARCHAR(50) NULL,
	private int notice_filesize;
	private String notice_noti;
	
	public String getNotice_noti() {
		return notice_noti;
	}

	public void setNotice_noti(String notice_noti) {
		this.notice_noti = notice_noti;
	}

	private MultipartFile notice_filenameMF;
	
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int notice_num, String member_id, String notice_title, String notice_content, int notice_viewcnt,
			String notice_passwd, String notice_wdate, String notice_filename, int notice_filesize,
			MultipartFile notice_filenameMF) {
		super();
		this.notice_num = notice_num;
		this.member_id = member_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_viewcnt = notice_viewcnt;
		this.notice_passwd = notice_passwd;
		this.notice_wdate = notice_wdate;
		this.notice_filename = notice_filename;
		this.notice_filesize = notice_filesize;
		this.notice_filenameMF = notice_filenameMF;
	}

	@Override
	public String toString() {
		return "NoticeDTO [notice_num=" + notice_num + ", member_id=" + member_id + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_viewcnt=" + notice_viewcnt + ", notice_passwd="
				+ notice_passwd + ", notice_wdate=" + notice_wdate + ", notice_filename=" + notice_filename
				+ ", notice_filesize=" + notice_filesize + ", notice_filenameMF=" + notice_filenameMF + "]";
	}

	public int getNotice_num() {
		return notice_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public int getNotice_viewcnt() {
		return notice_viewcnt;
	}

	public String getNotice_passwd() {
		return notice_passwd;
	}

	public String getNotice_wdate() {
		return notice_wdate;
	}

	public String getNotice_filename() {
		return notice_filename;
	}

	public int getNotice_filesize() {
		return notice_filesize;
	}

	public MultipartFile getNotice_filenameMF() {
		return notice_filenameMF;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public void setNotice_viewcnt(int notice_viewcnt) {
		this.notice_viewcnt = notice_viewcnt;
	}

	public void setNotice_passwd(String notice_passwd) {
		this.notice_passwd = notice_passwd;
	}

	public void setNotice_wdate(String notice_wdate) {
		this.notice_wdate = notice_wdate;
	}

	public void setNotice_filename(String notice_filename) {
		this.notice_filename = notice_filename;
	}

	public void setNotice_filesize(int notice_filesize) {
		this.notice_filesize = notice_filesize;
	}

	public void setNotice_filenameMF(MultipartFile notice_filenameMF) {
		this.notice_filenameMF = notice_filenameMF;
	}
	
}
