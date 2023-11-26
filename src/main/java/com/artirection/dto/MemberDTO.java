package com.artirection.dto;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String mID;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private Timestamp mSignupDate;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String mID, String pw, String name, String email, String phone, int favorite,
			Timestamp mSignupDate) {
		super();
		this.mID = mID;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.mSignupDate = mSignupDate;
	}

	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Timestamp getmSignupDate() {
		return mSignupDate;
	}

	public void setmSignupDate(Timestamp mSignupDate) {
		this.mSignupDate = mSignupDate;
	}
	
}
