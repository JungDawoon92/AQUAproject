package admin.item.db;

import java.sql.Date;

public class ItemVO {
	private int no;
	private String i_name;
	private String content;
	private int cnt;
	private int tot;
	private int price;
	private String categ;
	private String img;
	private Date up_date;
	private Date ed_date;
	private Date st_date;
	
	public ItemVO() {}

	public ItemVO(int no, String i_name, String content, int cnt, int tot,
			int price, String categ, String img, Date up_date, Date ed_date,
			Date st_date) {
		super();
		this.no = no;
		this.i_name = i_name;
		this.content = content;
		this.cnt = cnt;
		this.tot = tot;
		this.price = price;
		this.categ = categ;
		this.img = img;
		this.up_date = up_date;
		this.ed_date = ed_date;
		this.st_date = st_date;
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

	public String getCateg() {
		return categ;
	}

	public void setCateg(String categ) {
		this.categ = categ;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getUp_date() {
		return up_date;
	}

	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}

	public Date getEd_date() {
		return ed_date;
	}

	public void setEd_date(Date ed_date) {
		this.ed_date = ed_date;
	}

	public Date getSt_date() {
		return st_date;
	}

	public void setSt_date(Date st_date) {
		this.st_date = st_date;
	}
	
}
