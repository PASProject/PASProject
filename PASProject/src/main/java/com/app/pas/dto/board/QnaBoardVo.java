package com.app.pas.dto.board;

import java.sql.Timestamp;

public class QnaBoardVo {
	private int qb_Article_Num;
	private String qb_Title;
	private String qb_Content;
	private int qb_Inq_Count;
	private String qb_Password;
	private String mem_Email;
	private Timestamp qb_Wt_Date;
	private String qb_yn;
	
	public Timestamp getQb_Wt_Date() {
		return qb_Wt_Date;
	}
	public void setQb_Wt_Date(Timestamp qb_Wt_Date) {
		this.qb_Wt_Date = qb_Wt_Date;
	}
	public int getQb_Article_Num() {
		return qb_Article_Num;
	}
	public void setQb_Article_Num(int qb_Article_Num) {
		this.qb_Article_Num = qb_Article_Num;
	}
	public String getQb_Title() {
		return qb_Title;
	}
	public void setQb_Title(String qb_Title) {
		this.qb_Title = qb_Title;
	}
	public String getQb_Content() {
		return qb_Content;
	}
	public void setQb_Content(String qb_Content) {
		this.qb_Content = qb_Content;
	}
	public int getQb_Inq_Count() {
		return qb_Inq_Count;
	}
	public void setQb_Inq_Count(int qb_Inq_Count) {
		this.qb_Inq_Count = qb_Inq_Count;
	}
	public String getQb_Password() {
		return qb_Password;
	}
	public void setQb_Password(String qb_Password) {
		this.qb_Password = qb_Password;
	}
	public String getMem_Email() {
		return mem_Email;
	}
	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	
	public String getQb_yn() {
		return qb_yn;
	}
	public void setQb_yn(String qb_yn) {
		this.qb_yn = qb_yn;
	}
	@Override
	public String toString() {
		return "QnaBoardVo [qb_Article_Num=" + qb_Article_Num + ", qb_Title="
				+ qb_Title + ", qb_Content=" + qb_Content + ", qb_Inq_Count="
				+ qb_Inq_Count + ", qb_Password=" + qb_Password
				+ ", mem_Email=" + mem_Email + "]";
	}
	
	
	
}
