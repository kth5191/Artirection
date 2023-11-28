package com.artirection.dto;

import java.sql.Timestamp;

public class FavoriteDTO {
	private int seq;
	private String mID;
	private int eSeq;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getmID() {
		return mID;
	}
	public void setmID(String mID) {
		this.mID = mID;
	}
	public int geteSeq() {
		return eSeq;
	}
	public void seteSeq(int eSeq) {
		this.eSeq = eSeq;
	}
	public FavoriteDTO(int seq, String mID, int eSeq) {
		super();
		this.seq = seq;
		this.mID = mID;
		this.eSeq = eSeq;
	}
	public FavoriteDTO() {
		super();
	}
	
	
}
