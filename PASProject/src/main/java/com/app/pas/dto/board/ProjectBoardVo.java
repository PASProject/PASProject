package com.app.pas.dto.board;

import java.sql.Timestamp;

public class ProjectBoardVo {

	private int pb_Article_Num;
    private int pb_Inq_Count;
    private String mem_Email;
    private int proj_Num;
    private Timestamp pb_Wt_Date;
    private String pb_Content;
    private String mem_Name;
    private String mem_Img;
    
    
    
    
	public String getMem_Img() {
		return mem_Img;
	}
	public void setMem_Img(String mem_Img) {
		this.mem_Img = mem_Img;
	}
	public String getMem_Name() {
		return mem_Name;
	}
	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}
	public Timestamp getPb_Wt_Date() {
		return pb_Wt_Date;
	}
	public void setPb_Wt_Date(Timestamp pb_Wt_Date) {
		this.pb_Wt_Date = pb_Wt_Date;
	}
	public int getPb_Article_Num() {
		return pb_Article_Num;
	}
	public void setPb_Article_Num(int pb_Article_Num) {
		this.pb_Article_Num = pb_Article_Num;
	}
	public int getPb_Inq_Count() {
		return pb_Inq_Count;
	}
	public void setPb_Inq_Count(int pb_Inq_Count) {
		this.pb_Inq_Count = pb_Inq_Count;
	}
	public String getMem_Email() {
		return mem_Email;
	}
	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	public int getProj_Num() {
		return proj_Num;
	}
	public void setProj_Num(int proj_Num) {
		this.proj_Num = proj_Num;
	}
	public String getPb_Content() {
		return pb_Content;
	}
	public void setPb_Content(String pb_Content) {
		this.pb_Content = pb_Content;
	}
}
