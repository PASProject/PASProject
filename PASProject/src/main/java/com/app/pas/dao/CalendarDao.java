package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.CalVo;


public interface CalendarDao {
	List<CalVo> getCalendar() throws SQLException;
}
