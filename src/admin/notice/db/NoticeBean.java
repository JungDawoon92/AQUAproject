package admin.notice.db;

import java.sql.Date;

public class NoticeBean {
	private int num;
	private String subject;
	private String content;
	private int readcount;
	private Date date;
	private String file;

	
	public NoticeBean(int num, String subject, String content, int readcount, Date date, String file) {
		super();
		this.num = num;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.date = date;
		this.file = file;
	}

	public NoticeBean() {
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
}