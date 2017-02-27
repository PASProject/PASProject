package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;


import com.app.pas.dto.WeeklyCheckVo;

public interface WeeklyCheckDao {
	
	public List<WeeklyCheckVo> day_check() throws SQLException;
	public void dayCheckUpdate(WeeklyCheckVo weeklyCheckVo) throws SQLException;

}
