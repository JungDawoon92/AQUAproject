package admin.book.db;

import java.sql.Date;

public class BookVO {
	private int pno;
	private String ref_id;
	private int ref_ino;
	private int cnt;
	private Date up_date;
	
	public BookVO() { super(); }
	
	public BookVO(int pno, String ref_id, int ref_ino, int cnt,
			Date up_date) {
		super();
		this.pno = pno;
		this.ref_id = ref_id;
		this.ref_ino = ref_ino;
		this.cnt = cnt;
		this.up_date = up_date;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
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
	
}
