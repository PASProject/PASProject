package com.app.pas.dao;

import java.sql.SQLException;

import org.springframework.jdbc.SQLWarningException;

import com.app.pas.dto.ProjectLogVo;

public interface ProjectLogDao {
	public void insertProjectLog(ProjectLogVo projectLogVo) throws SQLException;
	public ProjectLogVo selectLastProjectLogList(ProjectLogVo projectLogVo) throws SQLException;
}
