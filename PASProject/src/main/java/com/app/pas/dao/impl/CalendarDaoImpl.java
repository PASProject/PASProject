package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.CalendarDao;
import com.app.pas.dto.CalVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class CalendarDaoImpl implements CalendarDao{

	   private SqlMapClient client;
	   public void setClient(SqlMapClient client){
	      this.client = client;
	   } 
	   
	@Override
	public List<CalVo> getCalendar() throws SQLException {
		List<CalVo> CalList = client.queryForList("getCalendar",null);
		return CalList;
	}

}
