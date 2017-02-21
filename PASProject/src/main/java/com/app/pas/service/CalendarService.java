package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.CalendarDao;
import com.app.pas.dto.CalVo;

public class CalendarService {

	private CalendarDao calendarDao;
	
	public void setCalendarDao(CalendarDao calendarDao){
		this.calendarDao = calendarDao;
	}
	
	public List<CalVo> getCalendar() throws SQLException {
		List<CalVo> CalList = calendarDao.getCalendar();
		return CalList;
	}
}
