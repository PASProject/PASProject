package com.app.pas.dto.board;

import java.sql.Timestamp;

public class SkillSharingBoardVo {

	
	private int ssb_Article_Num;
	private Timestamp ssb_wt_date;
	private String ssb_Content;
	private String ssb_Title;
	private int ssb_Like;
	private int ssb_Inq_Count;
	private String mem_Email;
	
	public Timestamp getSsb_wt_date() {
		return ssb_wt_date;
	}
	public void setSsb_wt_date(Timestamp ssb_wt_date) {
		this.ssb_wt_date = ssb_wt_date;
	}
	public int getSsb_Article_Num() {
		return ssb_Article_Num;
	}
	public void setSsb_Article_Num(int ssb_Article_Num) {
		this.ssb_Article_Num = ssb_Article_Num;
	}
	public String getSsb_Content() {
		return ssb_Content;
	}
	public void setSsb_Content(String ssb_Content) {
		this.ssb_Content = ssb_Content;
	}
	public String getSsb_Title() {
		return ssb_Title;
	}
	public void setSsb_Title(String ssb_Title) {
		this.ssb_Title = ssb_Title;
	}
	public int getSsb_Like() {
		return ssb_Like;
	}
	public void setSsb_Like(int ssb_Like) {
		this.ssb_Like = ssb_Like;
	}
	public int getSsb_Inq_Count() {
		return ssb_Inq_Count;
	}
	public void setSsb_Inq_Count(int ssb_Inq_Count) {
		this.ssb_Inq_Count = ssb_Inq_Count;
	}
	public String getMem_Email() {
		return mem_Email;
	}
	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	
	
	
	
	
	
	
	
}
