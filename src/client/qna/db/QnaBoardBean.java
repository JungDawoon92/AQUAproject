package client.qna.db;

import java.sql.Date;

public class QnaBoardBean {
	private int NUM;
	private String ID;
	private String SUBJECT;
	private String CONTENT;
	private int RE_REF;
	private int RE_LEV;
	private int RE_CHE;
	private Date DATE;
	private String RE_ID;
	private String DEL;
	private String CATEGORY;
	
	
	public int getNUM() {
		return NUM;
	}
	public void setNUM(int nUM) {
		NUM = nUM;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSUBJECT() {
		return SUBJECT;
	}
	public void setSUBJECT(String sUBJECT) {
		SUBJECT = sUBJECT;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public int getRE_REF() {
		return RE_REF;
	}
	public void setRE_REF(int rE_REF) {
		RE_REF = rE_REF;
	}
	public int getRE_LEV() {
		return RE_LEV;
	}
	public void setRE_LEV(int rE_LEV) {
		RE_LEV = rE_LEV;
	}
	public int getRE_CHE() {
		return RE_CHE;
	}
	public void setRE_CHE(int rE_CHE) {
		RE_CHE = rE_CHE;
	}
	public Date getDATE() {
		return DATE;
	}
	public void setDATE(Date dATE) {
		DATE = dATE;
	}
	public String getRE_ID() {
		return RE_ID;
	}
	public void setRE_ID(String rE_ID) {
		RE_ID = rE_ID;
	}
	public String getDEL() {
		return DEL;
	}
	public void setDEL(String dEL) {
		DEL = dEL;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	public QnaBoardBean(int nUM, String iD, String sUBJECT, String cONTENT, int rE_REF, int rE_LEV, int rE_CHE, Date dATE,
			String rE_ID, String dEL, String cATEGORY) {
		super();
		NUM = nUM;
		ID = iD;
		SUBJECT = sUBJECT;
		CONTENT = cONTENT;
		RE_REF = rE_REF;
		RE_LEV = rE_LEV;
		RE_CHE = rE_CHE;
		DATE = dATE;
		RE_ID = rE_ID;
		DEL = dEL;
		CATEGORY = cATEGORY;
	}
	public QnaBoardBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	

}
