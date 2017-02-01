package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ProjectDao;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.ProjectVo;

public class ProjectService {

	private ProjectDao projectDao;

	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}

	public List<ProjectVo> selectMyProjectById(String mem_Email)
			throws SQLException {
		List<ProjectVo> list = projectDao.selectProjectById(mem_Email);
		return list;
	}

	public List<ProjectVo> selectOtherProjectList() throws SQLException {
		List<ProjectVo> list = projectDao.selectProjectList();
		return list;

	}
	
	public List<MemPositionViewVo> selectMemPositionViewListByProjNum(int proj_Num) throws SQLException{
		List<MemPositionViewVo> list = projectDao.selectMemPositionViewListByProjNum(proj_Num);
		return list;
	}

}
