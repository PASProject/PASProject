package com.app.pas.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.pas.dao.CalendarDao;
import com.app.pas.dao.impl.CalendarDaoImpl;
import com.app.pas.dto.CalVo;
import com.app.pas.service.CalendarService;

@Controller
public class ControllerCal {

	@Autowired
	CalendarService calendarService;
	
	@Resource(name="CalendarDao")
	public CalendarDao calendarDao;
	
	@RequestMapping(value="calendarAjax.do")
	public @ResponseBody List<CalVo> abc(){
		
		
		List<CalVo> list = null;
		
	   
		try {
			list= calendarService.getCalendar();
			System.out.println(list.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return list;
	}
}
