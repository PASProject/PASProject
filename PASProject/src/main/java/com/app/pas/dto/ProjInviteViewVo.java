package com.app.pas.dto;

import java.sql.Timestamp;

public class ProjInviteViewVo {
	
	private int invite_Num;
	private String invite_Commit_Check;
	private String invite_Content;
	private String mem_Email;
	private String p_Mem_Email;
	private int proj_Num;
	private String proj_Name;
	private String alarm_Clsfct_Name;
	private String mem_Name;
	private Timestamp invite_Time;
	private String mem_Img;
	
	
	
		
	public String getMem_Img() {
		return mem_Img;
	}
	public void setMem_Img(String mem_Img) {
		this.mem_Img = mem_Img;
	}
	public Timestamp getInvite_Time() {
		return invite_Time;
	}
	public void setInvite_Time(Timestamp invite_Time) {
		this.invite_Time = invite_Time;
	}
	public String getMem_Name() {
		return mem_Name;
	}
	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}
	public int getInvite_Num() {
		return invite_Num;
	}
	public void setInvite_Num(int invite_Num) {
		this.invite_Num = invite_Num;
	}
	public String getInvite_Commit_Check() {
		return invite_Commit_Check;
	}
	public void setInvite_Commit_Check(String invite_Commit_Check) {
		this.invite_Commit_Check = invite_Commit_Check;
	}
	public String getInvite_Content() {
		return invite_Content;
	}
	public void setInvite_Content(String invite_Content) {
		this.invite_Content = invite_Content;
	}
	public String getMem_Email() {
		return mem_Email;
	}
	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	public String getP_Mem_Email() {
		return p_Mem_Email;
	}
	public void setP_Mem_Email(String p_Mem_Email) {
		this.p_Mem_Email = p_Mem_Email;
	}
	public int getProj_Num() {
		return proj_Num;
	}
	public void setProj_Num(int proj_Num) {
		this.proj_Num = proj_Num;
	}
	public String getProj_Name() {
		return proj_Name;
	}
	public void setProj_Name(String proj_Name) {
		this.proj_Name = proj_Name;
	}
	public String getAlarm_Clsfct_Name() {
		return alarm_Clsfct_Name;
	}
	public void setAlarm_Clsfct_Name(String alarm_Clsfct_Name) {
		this.alarm_Clsfct_Name = alarm_Clsfct_Name;
	}
	
	

}
