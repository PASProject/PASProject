package com.app.pas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pas.service.ScheduleCalendarService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	
	@Autowired
	ScheduleCalendarService scheduleService;
	
	
	@RequestMapping("/calendar")
	public String CalendarList(){
		String url="schedule/monthlySchedule";
		
		
		
		
		
		return url;
	}
	
	

}
