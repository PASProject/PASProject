package com.app.pas.dto.dic;

import java.sql.Timestamp;
import java.util.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

@Data
@Alias("GantChart")
public class GantChartVo {

	
	private int gt_Num;
	private Date gt_Start_Date;
	private Date gt_End_Date;
	private double gt_Compl_Rate;
	private int proj_Num;
	private String gt_Title;
	
	
	
	public GantChartCommand toCommand(){
		GantChartCommand gantChartCommand = new GantChartCommand();
		gantChartCommand.setStart(this.getGt_Start_Date());
		gantChartCommand.setEnd(this.getGt_End_Date());
		gantChartCommand.setPercentComplete(this.getGt_Compl_Rate());
		gantChartCommand.setTitle(this.getGt_Title());
		return gantChartCommand;
	}
	
	public GantChartVo fromCommand(GantChartCommand gantChartCommand){
		GantChartVo gantChartVo = new GantChartVo();
		gantChartVo.setGt_Start_Date(gt_Start_Date);
		gantChartVo.setGt_End_Date(gt_End_Date);
		gantChartVo.setGt_Title(gt_Title);
		gantChartVo.setGt_Compl_Rate(gt_Compl_Rate);
		return gantChartVo;
	}
	
	/*
	
	public ScheduleCalendarVo fromCommand(ScheduleCalendarCommand scheduleCalendarCommand){
		ScheduleCalendarVo scheduleCalendarVo = new ScheduleCalendarVo();
		if(scheduleCalendarCommand.getId()!=null){
			scheduleCalendarVo.setSc_Num(Integer.parseInt(scheduleCalendarCommand.getId()));
		}
		
		scheduleCalendarVo.setSc_Start_Date(scheduleCalendarCommand.getStart());
		scheduleCalendarVo.setSc_End_Date(scheduleCalendarCommand.getEnd()) ;
		scheduleCalendarVo.setSc_Title( scheduleCalendarCommand.getTitle());
		scheduleCalendarVo.setSc_Color(scheduleCalendarCommand.getColor()) ;
		scheduleCalendarVo.setSc_Description(scheduleCalendarCommand.getDescription());
		return scheduleCalendarVo;
	}
	*/
}
