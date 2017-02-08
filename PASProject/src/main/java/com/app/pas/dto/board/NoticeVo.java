package com.app.pas.dto.board;

import java.sql.Timestamp;

public class NoticeVo {

	
	private int notice_Num;
	private String notice_Title;
	private String notice_Content;
	private Timestamp notice_Date;
	private int notice_Inq_Count;
	private int proj_Num;
	private String mem_Name;
	
	
	
	
	
	public String getMem_Name() {
		return mem_Name;
	}
	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}
	public Timestamp getNotice_Date() {
		return notice_Date;
	}
	public void setNotice_Date(Timestamp notice_Date) {
		this.notice_Date = notice_Date;
	}
	public int getNotice_Num() {
		return notice_Num;
	}
	public void setNotice_Num(int notice_Num) {
		this.notice_Num = notice_Num;
	}
	public String getNotice_Title() {
		return notice_Title;
	}
	public void setNotice_Title(String notice_Title) {
		this.notice_Title = notice_Title;
	}
	public String getNotice_Content() {
		return notice_Content;
	}
	public void setNotice_Content(String notice_Content) {
		this.notice_Content = notice_Content;
	}
	public int getNotice_Inq_Count() {
		return notice_Inq_Count;
	}
	public void setNotice_Inq_Count(int notice_Inq_Count) {
		this.notice_Inq_Count = notice_Inq_Count;
	}
	public int getProj_Num() {
		return proj_Num;
	}
	public void setProj_Num(int proj_Num) {
		this.proj_Num = proj_Num;
	}
	
	
	
	
	
	
	
}
