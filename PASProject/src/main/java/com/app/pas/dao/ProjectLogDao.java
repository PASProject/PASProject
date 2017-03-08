package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.SQLWarningException;

import com.app.pas.dto.MemberLogCommand;
import com.app.pas.dto.ProjectLogVo;

public interface ProjectLogDao {
	public void insertProjectLog(ProjectLogVo projectLogVo) throws SQLException;
	public ProjectLogVo selectLastProjectLogList(ProjectLogVo projectLogVo) throws SQLException;
	public List<MemberLogCommand> selectWeekLogCount(int proj_Num) throws SQLException;
}
