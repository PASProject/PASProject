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
	public List<WeeklyCheckVo> day_check()
			throws SQLException {
		List<WeeklyCheckVo> list = client.queryForList("day_check");
		return list;
	}

	@Override
	public void dayCheckUpdate(WeeklyCheckVo weeklyCheckVo) throws SQLException {
		client.update("dayCheckUpdate", weeklyCheckVo);
		
	}

}
