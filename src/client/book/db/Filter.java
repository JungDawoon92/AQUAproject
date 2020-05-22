package client.book.db;

import java.sql.Date;

public class Filter {
	private String categ;
	private int limit;
	private int offset;
	private Date st_date;
	private Date ed_date;
	private int price;
	private String priceDesc;
	private Date up_date;
	private String up_dateDesc;
	public Filter() {	}
	public Filter(String categ, int limit, int offset, Date st_date, Date ed_date, int price, String priceDesc,
			Date up_date, String up_dateDesc) {
		super();
		this.categ = categ;
		this.limit = limit;
		this.offset = offset;
		this.st_date = st_date;
		this.ed_date = ed_date;
		this.price = price;
		this.priceDesc = priceDesc;
		this.up_date = up_date;
		this.up_dateDesc = up_dateDesc;
	}
	public String getCateg() {
		return categ;
	}
	public void setCateg(String categ) {
		this.categ = categ;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
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
	public String getPriceDesc() {
		return priceDesc;
	}
	public void setPriceDesc(String priceDesc) {
		this.priceDesc = priceDesc;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}
	public String getUp_dateDesc() {
		return up_dateDesc;
	}
	public void setUp_dateDesc(String up_dateDesc) {
		this.up_dateDesc = up_dateDesc;
	}
	
	
}
