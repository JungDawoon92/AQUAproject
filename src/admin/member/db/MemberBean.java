package admin.member.db;

import java.sql.Date;

public class MemberBean {
	private int num;
	private String id;
	private String name;
	private String pass;
	private String gen;
	private String addr;
	private java.sql.Date birthday;
	private String email;
	private String phone;
	private java.sql.Date joindate;
	
	
	
	public MemberBean() {
		super();
		// TODO Auto-generated constructor stub
	}



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPass() {
		return pass;
	}



	public void setPass(String pass) {
		this.pass = pass;
	}



	public String getGen() {
		return gen;
	}



	public void setGen(String gen) {
		this.gen = gen;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}



	public java.sql.Date getBirthday() {
		return birthday;
	}



	public void setBirthday(java.sql.Date birthday) {
		this.birthday = birthday;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public java.sql.Date getJoindate() {
		return joindate;
	}



	public void setJoindate(java.sql.Date joindate) {
		this.joindate = joindate;
	}



	public MemberBean(int num, String id, String name, String pass, String gen, String addr, Date birthday,
			String email, String phone, Date joindate) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
		this.pass = pass;
		this.gen = gen;
		this.addr = addr;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.joindate = joindate;
	}
	
		
}
