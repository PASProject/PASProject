package com.app.pas.dto;

public class ProjectVo {

	private int proj_Num;
	private String mem_Email;
	private String proj_Content;
	private String proj_Name;
	private String proj_Check;
	
	@Override
	public String toString() {
		return "ProjectVo [proj_Num=" + proj_Num + ", mem_Email=" + mem_Email
				+ ", proj_Content=" + proj_Content + ", proj_Name=" + proj_Name
				+ ", proj_Check=" + proj_Check + "]";
	}
	public int getProj_Num() {
		return proj_Num;
	}
	public void setProj_Num(int proj_Num) {
		this.proj_Num = proj_Num;
	}
	public String getMem_Email() {
		return mem_Email;
	}
	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	public String getProj_Content() {
		return proj_Content;
	}
	public void setProj_Content(String proj_Content) {
		this.proj_Content = proj_Content;
	}
	public String getProj_Name() {
		return proj_Name;
	}
	public void setProj_Name(String proj_Name) {
		this.proj_Name = proj_Name;
	}
	public String getProj_Check() {
		return proj_Check;
	}
	public void setProj_Check(String proj_Check) {
		this.proj_Check = proj_Check;
	}


}
