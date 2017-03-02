package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.WeeklyCheckDao;
import com.app.pas.dto.WeeklyCheckVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class WeeklyCheckDaoImpl implements WeeklyCheckDao{
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<WeeklyCheckVo> weeklyCheck_Select(WeeklyCheckVo weeklyCheckVo)
			throws SQLException {
		List<WeeklyCheckVo> list = client.queryForList("weeklyCheck_Select",weeklyCheckVo);
		return list;
	}

	@Override
	public void weeklyCheck_Update(WeeklyCheckVo weeklyCheckVo) throws SQLException {
		client.update("weeklyCheck_Update", weeklyCheckVo);
		
	}

	@Override
	public void weeklyCheck_Delete(WeeklyCheckVo weeklyCheckVo)
			throws SQLException {
		client.delete("weeklyCheck_Delete", weeklyCheckVo);
		
	}

	@Override
	public void weeklyCheck_YN(WeeklyCheckVo weeklyCheckVo) throws SQLException {
		client.update("weeklyCheck_YN", weeklyCheckVo);
		
	}

	@Override
	public List<WeeklyCheckVo> weeklyCheck_Select_Y(WeeklyCheckVo weeklyCheckVo)
			throws SQLException {
		List<WeeklyCheckVo> list = client.queryForList("weeklyCheck_Select_Y", weeklyCheckVo);
		return list;
	}

}
