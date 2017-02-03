package com.app.pas.dto;

import java.sql.Timestamp;

public class MemApplyViewVo {
	private int apply_Num;
	private Timestamp apply_Time;
	private String apply_Commit_Check;
	private String mem_Email;
	private int proj_Num;
	private String proj_Name;
	private String p_Mem_Email;
	private String alarm_Clsfct;
	private String Alarm_Clsfct_Name;
	
	@Override
	public String toString() {
		return "MemApplyViewVo [apply_Num=" + apply_Num + ", apply_Time="
				+ apply_Time + ", apply_Commit_Check=" + apply_Commit_Check
				+ ", mem_Email=" + mem_Email + ", proj_Num=" + proj_Num
				+ ", proj_Name=" + proj_Name + ", p_Mem_Email=" + p_Mem_Email
				+ ", alarm_Clsfct=" + alarm_Clsfct + ", Alarm_Clsfct_Name="
				+ Alarm_Clsfct_Name + "]";
	}
	public int getApply_Num() {
		return apply_Num;
	}
	public void setApply_Num(int apply_Num) {
		this.apply_Num = apply_Num;
	}
	public Timestamp getApply_Time() {
		return apply_Time;
	}
	public void setApply_Time(Timestamp apply_Time) {
		this.apply_Time = apply_Time;
	}
	public String getApply_Commit_Check() {
		return apply_Commit_Check;
	}
	public void setApply_Commit_Check(String apply_Commit_Check) {
		this.apply_Commit_Check = apply_Commit_Check;
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
	public String getProj_Name() {
		return proj_Name;
	}
	public void setProj_Name(String proj_Name) {
		this.proj_Name = proj_Name;
	}
	public String getP_Mem_Email() {
		return p_Mem_Email;
	}
	public void setP_Mem_Email(String p_Mem_Email) {
		this.p_Mem_Email = p_Mem_Email;
	}
	public String getAlarm_Clsfct() {
		return alarm_Clsfct;
	}
	public void setAlarm_Clsfct(String alarm_Clsfct) {
		this.alarm_Clsfct = alarm_Clsfct;
	}
	public String getAlarm_Clsfct_Name() {
		return Alarm_Clsfct_Name;
	}
	public void setAlarm_Clsfct_Name(String alarm_Clsfct_Name) {
		Alarm_Clsfct_Name = alarm_Clsfct_Name;
	}
	
}
