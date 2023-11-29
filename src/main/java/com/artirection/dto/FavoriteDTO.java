package com.artirection.dto;

public class FavoriteDTO {
	private String mID;
	private int eSeq;

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
	public FavoriteDTO(String mID, int eSeq) {
		super();
		this.mID = mID;
		this.eSeq = eSeq;
	}
	public FavoriteDTO() {
		super();
	}
	
	
}
