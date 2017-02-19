package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.ProjectJoinVo;
import com.app.pas.dto.ScheduleCalendarVo;

public interface ScheduleCalendarDao {
	public List<ScheduleCalendarVo> selectScheduleCalendarList(int sc_Proj_Num)throws SQLException;
	public void insertScheduleCalendar(ScheduleCalendarVo scheduleCalendarVo)throws SQLException;
	public void deleteScheduleCalendar(int sc_Num)throws SQLException;
}
