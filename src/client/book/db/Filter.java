package client.book.db;

import java.sql.Date;

public class Filter {
	private String categ;
	private int limit;
	private int offset;
	private Date st_date;
	private Date ed_date;
	private boolean dateSel_option;
	private boolean ascNo;
	private boolean orderByPrice;
	private boolean ascPrice;
	public Filter() {	}
	public Filter(String categ, int limit, int offset, Date st_date, Date ed_date, boolean dateSel_option,
			boolean ascNo, boolean orderByPrice, boolean ascPrice) {
		super();
		this.categ = categ;
		this.limit = limit;
		this.offset = offset;
		this.st_date = st_date;
		this.ed_date = ed_date;
		this.dateSel_option = dateSel_option;
		this.ascNo = ascNo;
		this.orderByPrice = orderByPrice;
		this.ascPrice = ascPrice;
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
	public boolean isDateSel_option() {
		return dateSel_option;
	}
	public void setDateSel_option(boolean dateSel_option) {
		this.dateSel_option = dateSel_option;
	}
	public boolean isAscNo() {
		return ascNo;
	}
	public void setAscNo(boolean ascNo) {
		this.ascNo = ascNo;
	}
	public boolean isOrderByPrice() {
		return orderByPrice;
	}
	public void setOrderByPrice(boolean orderByPrice) {
		this.orderByPrice = orderByPrice;
	}
	public boolean isAscPrice() {
		return ascPrice;
	}
	public void setAscPrice(boolean ascPrice) {
		this.ascPrice = ascPrice;
	}
	
	
}
