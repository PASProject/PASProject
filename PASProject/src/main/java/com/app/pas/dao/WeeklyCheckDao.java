package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;


import com.app.pas.dto.WeeklyCheckVo;

public interface WeeklyCheckDao {
	
	public List<WeeklyCheckVo> weeklyCheck_Select(WeeklyCheckVo weeklyCheckVo) throws SQLException;
	public void weeklyCheck_Update(WeeklyCheckVo weeklyCheckVo) throws SQLException;

}