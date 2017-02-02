package com.app.pas.dto;

public class MemPositionViewVo {

	private String mem_Email;
	private String mem_Name;
	private String mem_Phone;
	private String mem_Img;
	private int pjj_Per_Num;
	private int position_Num;
	private String position_Name;
	private int proj_Num;
	private String proj_Name;


	@Override
	public String toString() {
		return "MemPositionViewVo [mem_Email=" + mem_Email + ", mem_Name="
				+ mem_Name + ", mem_Phone=" + mem_Phone + ", mem_Img="
				+ mem_Img + ", pjj_Per_Num=" + pjj_Per_Num + ", position_Num="
				+ position_Num + ", position_Name=" + position_Name
				+ ", proj_Num=" + proj_Num + ", proj_Name=" + proj_Name + "]";
	}

	public String getMem_Email() {
		return mem_Email;
	}

	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
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

	public String getMem_Img() {
		return mem_Img;
	}

	public void setMem_Img(String mem_Img) {
		this.mem_Img = mem_Img;
	}

	public int getPjj_Per_Num() {
		return pjj_Per_Num;
	}

	public void setPjj_Per_Num(int pjj_Per_Num) {
		this.pjj_Per_Num = pjj_Per_Num;
	}

	public int getPosition_Num() {
		return position_Num;
	}

	public void setPosition_Num(int position_Num) {
		this.position_Num = position_Num;
	}

	public String getPosition_Name() {
		return position_Name;
	}

	public void setPosition_Name(String position_Name) {
		this.position_Name = position_Name;
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

}
