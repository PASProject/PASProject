package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;


import com.app.pas.dto.WeeklyCheckVo;

public interface WeeklyCheckDao {
	
	public List<WeeklyCheckVo> weeklyCheck() throws SQLException;
	public void weeklyCheck_Update(WeeklyCheckVo weeklyCheckVo) throws SQLException;

}
