package client.book.db;

import java.sql.Date;

public class Booked {
	private int ref_ino;
	private String i_name;
	private String img;
	private String content;
	private Date st_date;
	private Date ed_date;
	private int price;
	private int cnt;
	private Date up_date;
	private int pno;
	public Booked() {	}
	public Booked(int ref_ino, String i_name, String img, String content, Date st_date, Date ed_date, int price,
			int cnt, Date up_date, int pno) {
		super();
		this.ref_ino = ref_ino;
		this.i_name = i_name;
		this.img = img;
		this.content = content;
		this.st_date = st_date;
		this.ed_date = ed_date;
		this.price = price;
		this.cnt = cnt;
		this.up_date = up_date;
		this.pno = pno;
	}
	public int getRef_ino() {
		return ref_ino;
	}
	public void setRef_ino(int ref_ino) {
		this.ref_ino = ref_ino;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSt_date() {
		return st_date;
	}
	public void setSt_date(Date st_date) {
		this.st_date = st_date;
	}
	public Date getEd_date() {
		return ed_date;
	}
	public void setEd_date(Date ed_date) {
		this.ed_date = ed_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
}
