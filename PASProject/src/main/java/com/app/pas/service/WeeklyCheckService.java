package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.WeeklyCheckDao;
import com.app.pas.dto.WeeklyCheckVo;

public class WeeklyCheckService {
	
	private WeeklyCheckDao weeklyCheckDao;

	public void setWeeklyCheckDao(WeeklyCheckDao weeklyCheckDao) {
		this.weeklyCheckDao = weeklyCheckDao;
	}
	
	public List<WeeklyCheckVo> day_check () throws SQLException{
		
		List<WeeklyCheckVo> list = weeklyCheckDao.day_check();
		return list;
	
	}
	
	public void dayCheckUpdate(WeeklyCheckVo weeklyCheckVo) throws SQLException{
		weeklyCheckDao.dayCheckUpdate(weeklyCheckVo);
	}

}
