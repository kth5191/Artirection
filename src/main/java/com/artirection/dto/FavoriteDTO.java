package com.artirection.dto;

public class FavoriteDTO {
	private String mID;
	private int eSeq;
	private String category;
	
	public FavoriteDTO() {}
	
	public FavoriteDTO(String mID, int eSeq) {
		super();
		this.mID = mID;
		this.eSeq = eSeq;
	}
	
	public FavoriteDTO(String mID, int eSeq, String category) {
		super();
		this.mID = mID;
		this.eSeq = eSeq;
		this.category = category;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
