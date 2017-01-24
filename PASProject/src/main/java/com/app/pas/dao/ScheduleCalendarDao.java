package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.ProjectJoinVo;
import com.app.pas.dto.ScheduleCalendarVo;

public interface ScheduleCalendarDao {
	public List<ScheduleCalendarVo> selectScheduleCalendarList()throws SQLException;
	public void insertScheduleCalendar(ScheduleCalendarVo scheduleCalendarVo)throws SQLException;
	public void updateScheduleCalendar(ScheduleCalendarVo scheduleCalendarVo)throws SQLException;
	public void deleteScheduleCalendar(int gt_Num)throws SQLException;
}
