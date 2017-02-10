package com.app.pas.service;

import java.sql.SQLException;

import com.app.pas.dao.ProjectJoinDao;
import com.app.pas.dto.ProjectJoinVo;

public class ProjectJoinService {

	
	private ProjectJoinDao projectjoinDao;

	public void setProjectjoinDao(ProjectJoinDao projectjoinDao) {
		this.projectjoinDao = projectjoinDao;
	}
	public void insertProject(ProjectJoinVo projectjoinVo) throws SQLException{
		projectjoinDao.insertProjectJoin(projectjoinVo);
	}
	
	
}
