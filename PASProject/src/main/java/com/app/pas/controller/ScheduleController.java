package com.app.pas.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pas.dto.MemberVo;
import com.app.pas.dto.ScheduleCalendarVo;
import com.app.pas.dto.Weekly_dateVo;
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
	public String weelyChecklist(ScheduleCalendarVo scheduleCalendarVo, Model model, HttpSession session) throws SQLException{
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
		List<Weekly_dateVo>weeklyList = new ArrayList<Weekly_dateVo>();
		weeklyList = schdulCalendarService.weekly_date();
		
		Weekly_dateVo weekly_dateVo = new Weekly_dateVo();
		weekly_dateVo = (Weekly_dateVo) schdulCalendarService.weekly_date();
		
//			if( weekly_dateVo.getDy() equals("월요일")){
//				String mon = dateList.getDt();
//				model.addAttribute("mon", mon);
//			
//		}
		
		
		model.addAttribute("weeklyList", weeklyList);	
		
		
		
		return url;
	}

	
	
}
