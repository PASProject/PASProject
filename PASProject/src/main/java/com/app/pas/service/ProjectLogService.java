package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ProjectLogDao;
import com.app.pas.dto.MemberLogCommand;
import com.app.pas.dto.ProjectLogVo;

public class ProjectLogService {

	
	private ProjectLogDao projectLogDao;
	
	public void setProjectLogDao(ProjectLogDao projectLogDao) {
		this.projectLogDao = projectLogDao;
	}

	public void insertProjectLog(ProjectLogVo projectLogVo) throws SQLException{
		projectLogDao.insertProjectLog(projectLogVo);
	}
	public ProjectLogVo selectLastProjectLogList(ProjectLogVo projectLogVo) throws SQLException{
		ProjectLogVo resultVo = projectLogDao.selectLastProjectLogList(projectLogVo);
		return resultVo;
	}
	public List<MemberLogCommand> selectWeekLogCount(int proj_Num) throws SQLException {
		List<MemberLogCommand> list = projectLogDao.selectWeekLogCount(proj_Num);
		return list;
	}
}
