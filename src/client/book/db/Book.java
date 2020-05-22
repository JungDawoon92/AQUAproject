package client.book.db;

import java.sql.Date;

public class Book {
	private String ref_id;
	private int ref_ino;
	private Date date;
	private int cnt;
	private int pno;
	public Book() {	}
	public Book(String ref_id, int ref_ino, Date date, int cnt, int pno) {
		super();
		this.ref_id = ref_id;
		this.ref_ino = ref_ino;
		this.date = date;
		this.cnt = cnt;
		this.pno = pno;
	}
	public String getRef_id() {
		return ref_id;
	}
	public void setRef_id(String ref_id) {
		this.ref_id = ref_id;
	}
	public int getRef_ino() {
		return ref_ino;
	}
	public void setRef_ino(int ref_ino) {
		this.ref_ino = ref_ino;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
}
