package com.artirection.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int bSeq;
	private int eSeq;
	private String bID;
	private String bTitle;
	private String bContents;
	private int bGrade;
	private Timestamp bWriteDate;
	
	public BoardDTO() {
		super();
	}
	
	public BoardDTO(int bSeq, int eSeq, String bID, String bTitle, String bContents, int bGrade, Timestamp bWriteDate) {
		super();
		this.bSeq = bSeq;
		this.eSeq = eSeq;
		this.bID = bID;
		this.bTitle = bTitle;
		this.bContents = bContents;
		this.bGrade = bGrade;
		this.bWriteDate = bWriteDate;
	}

	public int getbSeq() {
		return bSeq;
	}

	public void setbSeq(int bSeq) {
		this.bSeq = bSeq;
	}

	public int geteSeq() {
		return eSeq;
	}

	public void seteSeq(int eSeq) {
		this.eSeq = eSeq;
	}

	public String getbID() {
		return bID;
	}

	public void setbID(String bID) {
		this.bID = bID;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContents() {
		return bContents;
	}

	public void setbContents(String bContents) {
		this.bContents = bContents;
	}

	public int getbGrade() {
		return bGrade;
	}

	public void setbGrade(int bGrade) {
		this.bGrade = bGrade;
	}

	public Timestamp getbWriteDate() {
		return bWriteDate;
	}

	public void setbWriteDate(Timestamp bWriteDate) {
		this.bWriteDate = bWriteDate;
	}
	
}
