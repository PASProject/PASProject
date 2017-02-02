package com.app.pas.dto;

public class MemberVo {

	private String mem_Email;
	private String quit_Check;
	private String mem_Name;
	private String mem_Phone;
	private String mem_Pass;
	private String mem_Img;
	private String mem_Approve;

	@Override
	public String toString() {
		return "MemberVo [mem_Email=" + mem_Email + ", quit_Check="
				+ quit_Check + ", mem_Name=" + mem_Name + ", mem_Phone="
				+ mem_Phone + ", mem_Pass=" + mem_Pass + ", mem_Img=" + mem_Img
				+ "]";
	}

	public String getMem_Approve() {
		return mem_Approve;
	}

	public void setMem_Approve(String mem_Approve) {
		this.mem_Approve = mem_Approve;
	}

	public String getMem_Email() {
		return mem_Email;
	}

	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}

	public String getQuit_Check() {
		return quit_Check;
	}

	public void setQuit_Check(String quit_Check) {
		this.quit_Check = quit_Check;
	}

	public String getMem_Name() {
		return mem_Name;
	}

	public void setMem_Name(String mem_Name) {
		this.mem_Name = mem_Name;
	}

	public String getMem_Phone() {
		return mem_Phone;
	}

	public void setMem_Phone(String mem_Phone) {
		this.mem_Phone = mem_Phone;
	}

	public String getMem_Pass() {
		return mem_Pass;
	}

	public void setMem_Pass(String mem_Pass) {
		this.mem_Pass = mem_Pass;
	}

	public String getMem_Img() {
		return mem_Img;
	}

	public void setMem_Img(String mem_Img) {
		this.mem_Img = mem_Img;
	}

}
