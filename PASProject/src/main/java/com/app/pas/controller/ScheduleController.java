package com.app.pas.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@RequestMapping(value = "/weeklyChecklist" )
	public String weelyChecklist(ScheduleCalendarVo scheduleCalendarVo,
			Model model, HttpSession session,
			@RequestParam(defaultValue = "")String d,	
			@RequestParam(defaultValue = "")String wk_Content,
			WeeklyCheckVo weeklyCheckVo) throws SQLException, ParseException{
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
		
		
		
		
		// select ------------------------------------------------------------
		List<WeeklyCheckVo> weekCheckList = new ArrayList<WeeklyCheckVo>();
		weekCheckList = weeklyCheckService.weeklyCheck();
		
		
		
		
//		for(ScheduleCalendarVo a :  weekly_dateList){
//			System.out.println("반복문 1 : " + a.getDt());
//			
//		}
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		for(WeeklyCheckVo object : weekCheckList) {
//			System.out.println("반복문 안에 : " + object.getWk_Date());
//			System.out.println(sdf.format(object.getWk_Date())); 
//		}
//	
		System.out.println("일주일일정 : " + weekCheckList);
		model.addAttribute("weekCheckList", weekCheckList);                                     
		
		System.out.println("jsp에서 넘어옴 : " + d );
		
		//업데이트-----------------------------------------------------------------
	
		
		System.out.println("내용 : " + wk_Content );
		if ((d.equals(""))) {
		}else{
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date to = transFormat.parse(d);
			System.out.println("날자자자자: "+to);
			weeklyCheckVo.setWk_Content(wk_Content);
			weeklyCheckVo.setWk_Date(to);
			weeklyCheckVo.setWk_Mem_Email(mem_Email);
		
//		
			weeklyCheckService.weeklyCheck_Update(weeklyCheckVo);

		}
//		String from = "20130408";
			////		
	
		return url;
	}

	
	
}
