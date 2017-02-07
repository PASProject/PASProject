package com.app.pas.dto.board;

import java.sql.Timestamp;

public class FreeBoardVo {

	
	private int frb_Article_Num;
	private Timestamp frb_Wt_Date;
	private String frb_Content;
	private String frb_Title;
	private int frb_Inq_Count;
	private String mem_Email;
	private String frb_Kind;
	private int frb_Like_Count;
	
	public int getFrb_Like_Count() {
		return frb_Like_Count;
	}
	public void setFrb_Like_Count(int frb_Like_Count) {
		this.frb_Like_Count = frb_Like_Count;
	}
	public Timestamp getFrb_Wt_Date() {
		return frb_Wt_Date;
	}
	public void setFrb_Wt_Date(Timestamp frb_Wt_Date) {
		this.frb_Wt_Date = frb_Wt_Date;
	}
	public int getFrb_Article_Num() {
		return frb_Article_Num;
	}
	public void setFrb_Article_Num(int frb_Article_Num) {
		this.frb_Article_Num = frb_Article_Num;
	}
	public String getFrb_Content() {
		return frb_Content;
	}
	public void setFrb_Content(String frb_Content) {
		this.frb_Content = frb_Content;
	}
	public String getFrb_Title() {
		return frb_Title;
	}
	public void setFrb_Title(String frb_Title) {
		this.frb_Title = frb_Title;
	}
	public int getFrb_Inq_Count() {
		return frb_Inq_Count;
	}
	public void setFrb_Inq_Count(int frb_Inq_Count) {
		this.frb_Inq_Count = frb_Inq_Count;
	}
	public String getMem_Email() {
		return mem_Email;
	}
	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	public String getFrb_Kind() {
		return frb_Kind;
	}
	public void setFrb_Kind(String frb_Kind) {
		this.frb_Kind = frb_Kind;
	}
	
	
	
	
	
	
	
	
	
}
