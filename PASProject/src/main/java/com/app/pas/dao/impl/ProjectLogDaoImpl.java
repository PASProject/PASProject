package com.app.pas.dao.impl;

import java.sql.SQLException;

import com.app.pas.dao.ProjectLogDao;
import com.app.pas.dto.ProjectLogVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProjectLogDaoImpl implements ProjectLogDao {
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public void insertProjectLog(ProjectLogVo projectLogVo) throws SQLException {
		client.insert("insertProjectLog",projectLogVo);
		
	}

	@Override
	public ProjectLogVo selectLastProjectLogList(ProjectLogVo projectLogVo)
			throws SQLException {
		ProjectLogVo resultVo =(ProjectLogVo) client.queryForObject("selectLastProjectLogList",projectLogVo);
		return resultVo;
	}

}
