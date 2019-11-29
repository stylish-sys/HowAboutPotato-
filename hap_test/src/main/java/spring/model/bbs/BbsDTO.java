package spring.model.bbs;

import org.springframework.web.multipart.MultipartFile;

public class BbsDTO {
	private int bbsno;
	private String wname;
	private String title;
	private String content;
	private String passwd;
	private int viewcnt;
	private String wdate;
	private int grpno;
	private int indent;
	private int ansnum;
	private MultipartFile filenameMF;
	private String filename;
	private int filesize;
	

	public BbsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public int getBbsno() {
		return bbsno;
	}


	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}


	public String getWname() {
		return wname;
	}


	public void setWname(String wname) {
		this.wname = wname;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public int getViewcnt() {
		return viewcnt;
	}


	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}


	public String getWdate() {
		return wdate;
	}


	public void setWdate(String wdate) {
		this.wdate = wdate;
	}


	public int getGrpno() {
		return grpno;
	}


	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}


	public int getIndent() {
		return indent;
	}


	public void setIndent(int indent) {
		this.indent = indent;
	}


	public int getAnsnum() {
		return ansnum;
	}


	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public int getFilesize() {
		return filesize;
	}


	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}


	public BbsDTO(int bbsno, String wname, String title, String content, String passwd, int viewcnt, String wdate,
			int grpno, int indent, int ansnum, String filename, int filesize) {
		super();
		this.bbsno = bbsno;
		this.wname = wname;
		this.title = title;
		this.content = content;
		this.passwd = passwd;
		this.viewcnt = viewcnt;
		this.wdate = wdate;
		this.grpno = grpno;
		this.indent = indent;
		this.ansnum = ansnum;
		this.filename = filename;
		this.filesize = filesize;
	}


	@Override
	public String toString() {
		return "BbsDTO [bbsno=" + bbsno + ", wname=" + wname + ", title=" + title + ", content=" + content + ", passwd="
				+ passwd + ", viewcnt=" + viewcnt + ", wdate=" + wdate + ", grpno=" + grpno + ", indent=" + indent
				+ ", ansnum=" + ansnum + ", filename=" + filename + ", filesize=" + filesize + "]";
	}


	public MultipartFile getFilenameMF() {
		return filenameMF;
	}


	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}
	
	

}
