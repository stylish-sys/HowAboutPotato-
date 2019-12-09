package spring.model.qna;

import org.springframework.web.multipart.MultipartFile;

public class QnaDTO {
	private int qna_num;//  NUMBER(6) NOT NULL,     
    private String member_id;//   VARCHAR(10) NOT NULL,    
    private String qna_title;// VARCHAR(100) NOT NULL, 
    private String qna_content;//  VARCHAR(4000) NOT NULL,
    private int qna_viewcnt;//   NUMBER(5) DEFAULT 0 NOT NULL,
    private String qna_wdate;// DATE NOT NULL,
    private String qna_passwd;//  VARCHAR(15) NOT NULL,
    private String qna_filename;//    VARCHAR(50) NULL,
    private int qna_filesize;//    number(10) null,
    private int qna_ref;// NUMBER(5) NOT NULL, 
    private int qna_indent;//  NUMBER(2) DEFAULT 0 NOT NULL,
    private int qna_ansnum;// NUMBER(5) DEFAULT 0 NOT NULL, 
    private int qna_refnum;//  NUMBER    DEFAULT 0,
	
    private MultipartFile qna_filenameMF;
    
	public QnaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "QnaDTO [qna_num=" + qna_num + ", member_id=" + member_id + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_viewcnt=" + qna_viewcnt + ", qna_wdate=" + qna_wdate + ", qna_passwd="
				+ qna_passwd + ", qna_filename=" + qna_filename + ", qna_filesize=" + qna_filesize + ", qna_ref="
				+ qna_ref + ", qna_indent=" + qna_indent + ", qna_ansnum=" + qna_ansnum + ", qna_refnum=" + qna_refnum
				+ ", qna_filenameMF=" + qna_filenameMF + "]";
	}

	public QnaDTO(int qna_num, String member_id, String qna_title, String qna_content, int qna_viewcnt,
			String qna_wdate, String qna_passwd, String qna_filename, int qna_filesize, int qna_ref, int qna_indent,
			int qna_ansnum, int qna_refnum, MultipartFile qna_filenameMF) {
		super();
		this.qna_num = qna_num;
		this.member_id = member_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_viewcnt = qna_viewcnt;
		this.qna_wdate = qna_wdate;
		this.qna_passwd = qna_passwd;
		this.qna_filename = qna_filename;
		this.qna_filesize = qna_filesize;
		this.qna_ref = qna_ref;
		this.qna_indent = qna_indent;
		this.qna_ansnum = qna_ansnum;
		this.qna_refnum = qna_refnum;
		this.qna_filenameMF = qna_filenameMF;
	}

	public int getQna_num() {
		return qna_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public int getQna_viewcnt() {
		return qna_viewcnt;
	}

	public String getQna_wdate() {
		return qna_wdate;
	}

	public String getQna_passwd() {
		return qna_passwd;
	}

	public String getQna_filename() {
		return qna_filename;
	}

	public int getQna_filesize() {
		return qna_filesize;
	}

	public int getQna_ref() {
		return qna_ref;
	}

	public int getQna_indent() {
		return qna_indent;
	}

	public int getQna_ansnum() {
		return qna_ansnum;
	}

	public int getQna_refnum() {
		return qna_refnum;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public void setQna_viewcnt(int qna_viewcnt) {
		this.qna_viewcnt = qna_viewcnt;
	}

	public void setQna_wdate(String qna_wdate) {
		this.qna_wdate = qna_wdate;
	}

	public void setQna_passwd(String qna_passwd) {
		this.qna_passwd = qna_passwd;
	}

	public void setQna_filename(String qna_filename) {
		this.qna_filename = qna_filename;
	}

	public void setQna_filesize(int qna_filesize) {
		this.qna_filesize = qna_filesize;
	}

	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}

	public void setQna_indent(int qna_indent) {
		this.qna_indent = qna_indent;
	}

	public void setQna_ansnum(int qna_ansnum) {
		this.qna_ansnum = qna_ansnum;
	}

	public void setQna_refnum(int qna_refnum) {
		this.qna_refnum = qna_refnum;
	}
	
	public MultipartFile getQna_filenameMF() {
		return qna_filenameMF;
	}

	public void setQna_filenameMF(MultipartFile qna_filenameMF) {
		this.qna_filenameMF = qna_filenameMF;
	}
}
