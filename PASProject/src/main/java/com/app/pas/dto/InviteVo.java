package com.app.pas.dto;

public class InviteVo {

	private int invite_Num;
	private String invite_Content;
	private String invite_Commit_Check;
	private String alarm_Clsfct;
	private int proj_Num;
	private String mem_Email;
	
	public int getInvite_Num() {
		return invite_Num;
	}
	public void setInvite_Num(int invite_Num) {
		this.invite_Num = invite_Num;
	}
	public String getInvite_Content() {
		return invite_Content;
	}
	public void setInvite_Content(String invite_Content) {
		this.invite_Content = invite_Content;
	}
	public String getInvite_Commit_Check() {
		return invite_Commit_Check;
	}
	public void setInvite_Commit_Check(String invite_Commit_Check) {
		this.invite_Commit_Check = invite_Commit_Check;
	}
	public String getAlarm_Clsfct() {
		return alarm_Clsfct;
	}
	public void setAlarm_Clsfct(String alarm_Clsfct) {
		this.alarm_Clsfct = alarm_Clsfct;
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
	
}
