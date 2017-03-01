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
	
	public List<WeeklyCheckVo> weeklyCheck (WeeklyCheckVo weeklyCheckVo) throws SQLException{
		List<WeeklyCheckVo> list = weeklyCheckDao.weeklyCheck_Select(weeklyCheckVo);
		return list;
	}
//------------------------------------------------------------------------------------------	
	public void weeklyCheck_Update(WeeklyCheckVo weeklyCheckVo) throws SQLException{
		weeklyCheckDao.weeklyCheck_Update(weeklyCheckVo);
	}

}
