package com.app.pas.dto.board;

import java.sql.Timestamp;

public class ProjectBoardVo {

	private int pb_Article_Num;
    private int pb_Inq_Count;
    private String mem_Email;
    private int proj_Num;
    private Timestamp pb_wt_date;
    
	public Timestamp getPb_wt_date() {
		return pb_wt_date;
	}
	public void setPb_wt_date(Timestamp pb_wt_date) {
		this.pb_wt_date = pb_wt_date;
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
	
    
    
    
    
	
}
