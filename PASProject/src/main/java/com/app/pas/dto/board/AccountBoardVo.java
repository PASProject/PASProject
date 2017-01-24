package com.app.pas.dto.board;

import java.sql.Timestamp;

public class AccountBoardVo {

	
	private int acc_Num;
	private Timestamp acc_Date;
	private int acc_Imp;
	private int acc_Exp;
	private String acc_Content;
	private int acc_Total;
	private int proj_Num;
	public int getAcc_Num() {
		return acc_Num;
	}
	public void setAcc_Num(int acc_Num) {
		this.acc_Num = acc_Num;
	}
	public Timestamp getAcc_Date() {
		return acc_Date;
	}
	public void setAcc_Date(Timestamp acc_Date) {
		this.acc_Date = acc_Date;
	}
	public int getAcc_Imp() {
		return acc_Imp;
	}
	public void setAcc_Imp(int acc_Imp) {
		this.acc_Imp = acc_Imp;
	}
	public int getAcc_Exp() {
		return acc_Exp;
	}
	public void setAcc_Exp(int acc_Exp) {
		this.acc_Exp = acc_Exp;
	}
	public String getAcc_Content() {
		return acc_Content;
	}
	public void setAcc_Content(String acc_Content) {
		this.acc_Content = acc_Content;
	}
	public int getAcc_Total() {
		return acc_Total;
	}
	public void setAcc_Total(int acc_Total) {
		this.acc_Total = acc_Total;
	}
	public int getProj_Num() {
		return proj_Num;
	}
	public void setProj_Num(int proj_Num) {
		this.proj_Num = proj_Num;
	}
	
	
	
	
	
	
	
}
