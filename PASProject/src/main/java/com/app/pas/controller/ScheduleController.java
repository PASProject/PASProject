package com.app.pas.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pas.dto.ScheduleCalendarCommand;
import com.app.pas.dto.ScheduleCalendarVo;
import com.app.pas.service.ScheduleCalendarService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	
	@Autowired
	ScheduleCalendarService scheduleService;
	@Autowired
	ScheduleCalendarService schdulCalendarService;
	
	
	@RequestMapping("/calendar")
	public String CalendarList(){
		String url="schedule/monthlySchedule";
	
		return url;
	}
	
	
	@RequestMapping("/weeklyChecklist")
	public String weelyChecklist(ScheduleCalendarVo scheduleCalendarVo, Model model) throws SQLException{
		String url="schedule/weeklyChecklist";
		List<ScheduleCalendarVo> weelyList = new ArrayList<ScheduleCalendarVo>();
		scheduleCalendarVo.setSc_Wk_Mem_Email("3@naver.com");
		weelyList = schdulCalendarService.selectWeeklylist(scheduleCalendarVo);
		
//		ScheduleCalendarCommand command = scheduleCalendarVo.toCommand();
//		model.addAttribute("command",command);
		model.addAttribute("weelyList", weelyList);
		System.out.println("날짜 : " + scheduleCalendarVo.getSc_End_Date());
		System.out.println(weelyList);
		return url;
	}
	
	
	
}
