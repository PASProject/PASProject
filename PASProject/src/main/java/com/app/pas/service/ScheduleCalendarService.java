package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ScheduleCalendarDao;
import com.app.pas.dto.ScheduleCalendarVo;

public class ScheduleCalendarService {

	
	private ScheduleCalendarDao scheduleCalendarDao;

	
	
	public void setScheduleCalendarDao(ScheduleCalendarDao scheduleCalendarDao) {
		this.scheduleCalendarDao = scheduleCalendarDao;
	}
	
	public List<ScheduleCalendarVo> selectScheduleCalendarList (int sc_Proj_Num) throws SQLException{
		
		List<ScheduleCalendarVo> list = scheduleCalendarDao.selectScheduleCalendarList(sc_Proj_Num);
		return list;
	}
	public void insertScheduleCalendar (ScheduleCalendarVo scheduleCalendarVo)throws SQLException{
		scheduleCalendarDao.insertScheduleCalendar(scheduleCalendarVo);
	}
	public void updateScheduleCalendar(ScheduleCalendarVo scheduleCalendarVo) throws SQLException{
		scheduleCalendarDao.updateScheduleCalendar(scheduleCalendarVo);
	}
	public int deleteScheduleCalendar(int sc_Num) throws SQLException{
		int flag = scheduleCalendarDao.deleteScheduleCalendar(sc_Num);
		return flag;
	}
	public void updateScheduleCalendarColor(ScheduleCalendarVo scheduleCalendarVo) throws SQLException{
		scheduleCalendarDao.updateScheduleCalendarColor(scheduleCalendarVo);
	}
	
	public ScheduleCalendarVo selectScheduleCalendarByScNum (int sc_Num)throws SQLException{
		return (ScheduleCalendarVo)scheduleCalendarDao.selectScheduleCalendarByScNum(sc_Num);
	}
}
