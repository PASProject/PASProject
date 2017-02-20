package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ScheduleCalendarDao;
import com.app.pas.dto.ScheduleCalendarVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ScheduleCalendarDaoImpl implements ScheduleCalendarDao{
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public List<ScheduleCalendarVo> selectScheduleCalendarList(int sc_Proj_Num)
			throws SQLException {
		List<ScheduleCalendarVo> list = client.queryForList("selectScheduleCalendarList",sc_Proj_Num);
		return list;
	}

	@Override
	public void insertScheduleCalendar(ScheduleCalendarVo scheduleCalendarVo)
			throws SQLException {
		client.insert("insertScheduleCalendar",scheduleCalendarVo);
		
	}

	
	@Override
	public void deleteScheduleCalendar(int sc_Num) throws SQLException {
		client.update("deleteScheduleCalendar",sc_Num);
	}

	@Override
	public void updateScheduleCalendar(ScheduleCalendarVo scheduleCalendarVo)
			throws SQLException {
		client.update("updateScheduleCalendar",scheduleCalendarVo);
		
	}

}
