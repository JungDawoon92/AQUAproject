package client.book.db;

import java.sql.Date;

public class Item {
	
	private int no;
	private String i_name;
	private String content;
	private int cnt;
	private int tot;
	private int price;
	private Date st_date;
	private Date ed_date;
	private String img;
	private String categ;
	private Date up_date;
	
	public Item() {	}

	public Item(int no, String i_name, String content, int cnt, int tot, int price, Date st_date, Date ed_date,
			String img, String categ, Date up_date) {
		super();
		this.no = no;
		this.i_name = i_name;
		this.content = content;
		this.cnt = cnt;
		this.tot = tot;
		this.price = price;
		this.st_date = st_date;
		this.ed_date = ed_date;
		this.img = img;
		this.categ = categ;
		this.up_date = up_date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCateg() {
		return categ;
	}

	public void setCateg(String categ) {
		this.categ = categ;
	}

	public Date getUp_date() {
		return up_date;
	}

	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}

	
	
}
