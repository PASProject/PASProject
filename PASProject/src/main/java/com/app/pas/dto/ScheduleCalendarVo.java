package com.app.pas.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;


@Alias("ScheduleCalendar")
@Data
public class ScheduleCalendarVo implements Serializable {

	
	private int gt_Num;
	private Timestamp sc_Start_Date;
	private Timestamp sc_End_Date;
	private String sc_Wk_Name;
	private String sc_Color;
	private String sc_Charge_Mem;
	
	public int getGt_Num() {
		return gt_Num;
	}
	public void setGt_Num(int gt_Num) {
		this.gt_Num = gt_Num;
	}
	public Timestamp getSc_Start_Date() {
		return sc_Start_Date;
	}
	public void setSc_Start_Date(Timestamp sc_Start_Date) {
		this.sc_Start_Date = sc_Start_Date;
	}
	public Timestamp getSc_End_Date() {
		return sc_End_Date;
	}
	public void setSc_End_Date(Timestamp sc_End_Date) {
		this.sc_End_Date = sc_End_Date;
	}
	public String getSc_Wk_Name() {
		return sc_Wk_Name;
	}
	public void setSc_Wk_Name(String sc_Wk_Name) {
		this.sc_Wk_Name = sc_Wk_Name;
	}
	public String getSc_Color() {
		return sc_Color;
	}
	public void setSc_Color(String sc_Color) {
		this.sc_Color = sc_Color;
	}
	public String getSc_Charge_Mem() {
		return sc_Charge_Mem;
	}
	public void setSc_Charge_Mem(String sc_Charge_Mem) {
		this.sc_Charge_Mem = sc_Charge_Mem;
	}
	
}
