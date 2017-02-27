package com.app.pas.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pas.dto.MemberVo;
import com.app.pas.dto.ScheduleCalendarVo;
import com.app.pas.dto.WeeklyCheckVo;
import com.app.pas.service.ScheduleCalendarService;
import com.app.pas.service.WeeklyCheckService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	
	@Autowired
	ScheduleCalendarService scheduleService;
	@Autowired
	ScheduleCalendarService schdulCalendarService;
	@Autowired
	WeeklyCheckService weeklyCheckService;
	
	
	@RequestMapping("/calendar")
	public String CalendarList(){
		String url="schedule/monthlySchedule";

		return url;
	}
	
	
	@RequestMapping("/weeklyChecklist")
	public String weelyChecklist(ScheduleCalendarVo scheduleCalendarVo, Model model, HttpSession session,
			WeeklyCheckVo weeklyCheckVo) throws SQLException{
		String url="schedule/weeklyChecklist";
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		
		List<ScheduleCalendarVo> weelyList_start = new ArrayList<ScheduleCalendarVo>();
		scheduleCalendarVo.setSc_Wk_Mem_Email(mem_Email);
		weelyList_start = schdulCalendarService.selectWeeklylist_Start(scheduleCalendarVo);
		model.addAttribute("weelyList_start", weelyList_start);
		
		//마감
		List<ScheduleCalendarVo> weelyList_end = new ArrayList<ScheduleCalendarVo>();
		weelyList_end = schdulCalendarService.selectWeeklylist_End(scheduleCalendarVo);
		model.addAttribute("weelyList_end", weelyList_end);	
		
		//마감,시작 포함일정
		
		ScheduleCalendarVo schedulCalendarVo = new ScheduleCalendarVo();
		List<ScheduleCalendarVo> weekly_dateList = new ArrayList<ScheduleCalendarVo>();
		weekly_dateList = schdulCalendarService.weekly_date();

		model.addAttribute("weekly_dateList", weekly_dateList);
		
		
		
		List<WeeklyCheckVo> weekCheckList = new ArrayList<WeeklyCheckVo>();
		weekCheckList = weeklyCheckService.day_check();
	
		System.out.println("일주일일정 : " + weekCheckList);
		model.addAttribute("weekCheckList", weekCheckList);
		
		//업데이트-----------------------------------------------------------------
		weeklyCheckVo.setMon("월");
		weeklyCheckVo.setThu("들어가나 실험중");
		weeklyCheckService.dayCheckUpdate(weeklyCheckVo);
		

	
		return url;
	}

	
	
}
