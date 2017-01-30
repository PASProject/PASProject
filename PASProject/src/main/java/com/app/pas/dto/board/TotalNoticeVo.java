package com.app.pas.dto.board;

public class TotalNoticeVo {

	
	private int ttnotice_Num;
	private String ttnotice_Title;
	private String ttnotice_Content;
	private int ttnotice_Inq_Count;
	private String admin_Email;
	public int getTtnotice_Num() {
		return ttnotice_Num;
	}
	public void setTtnotice_Num(int ttnotice_Num) {
		this.ttnotice_Num = ttnotice_Num;
	}
	public String getTtnotice_Title() {
		return ttnotice_Title;
	}
	public void setTtnotice_Title(String ttnotice_Title) {
		this.ttnotice_Title = ttnotice_Title;
	}
	public String getTtnotice_Content() {
		return ttnotice_Content;
	}
	public void setTtnotice_Content(String ttnotice_Content) {
		this.ttnotice_Content = ttnotice_Content;
	}
	public int getTtnotice_Inq_Count() {
		return ttnotice_Inq_Count;
	}
	public void setTtnotice_Inq_Count(int ttnotice_Inq_Count) {
		this.ttnotice_Inq_Count = ttnotice_Inq_Count;
	}
	public String getAdmin_Email() {
		return admin_Email;
	}
	public void setAdmin_Email(String admin_Email) {
		this.admin_Email = admin_Email;
	}
	@Override
	public String toString() {
		return "TotalNoticeVo [ttnotice_Num=" + ttnotice_Num
				+ ", ttnotice_Title=" + ttnotice_Title + ", ttnotice_Content="
				+ ttnotice_Content + ", ttnotice_Inq_Count="
				+ ttnotice_Inq_Count + ", admin_Email=" + admin_Email + "]";
	}
	
	
	
	
}
