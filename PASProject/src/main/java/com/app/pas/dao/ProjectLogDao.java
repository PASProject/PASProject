package com.app.pas.dao;

import java.sql.SQLException;

import com.app.pas.dto.ProjectLogVo;

public interface ProjectLogDao {
	public void insertProjectLog(ProjectLogVo projectLogVo) throws SQLException;
}
