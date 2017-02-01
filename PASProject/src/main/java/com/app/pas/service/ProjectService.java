package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ProjectDao;
import com.app.pas.dto.ProjectVo;

public class ProjectService {

	private ProjectDao projectDao;

	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}

	public List<ProjectVo> getMyProjectById(String mem_Email)
			throws SQLException {
		List<ProjectVo> list = projectDao.selectProjectById(mem_Email);
		return list;
	}

	public List<ProjectVo> getOtherProjectList() throws SQLException {

		List<ProjectVo> list = projectDao.selectProjectList();
		return list;

	}

}
