package com.hk.project.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {

	private String id;
	private String pw;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String name;
	private int tel;
	private String email;
	private int verify;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", birth=" + birth + ", name=" + name + ", tel=" + tel + ", email="
				+ email + ", verify=" + verify + "]";
	}
}
