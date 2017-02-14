package com.app.pas.service;

import java.sql.SQLException;

import com.app.pas.dto.ProjectLogVo;

public class ProjectLogService {

	
	private ProjectLogDao projectLogDao;
	
	public void setProjectLogDao(ProjectLogDao projectLogDao) {
		this.projectLogDao = projectLogDao;
	}

	public void insertProjectLog(ProjectLogVo projectLogVo) throws SQLException{
		projectLogDao.insertProjectLog(projectLogVo);
	}
}
