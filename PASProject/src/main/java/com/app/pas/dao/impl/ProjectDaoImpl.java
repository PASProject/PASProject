package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ProjectDao;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.ProjectVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProjectDaoImpl implements ProjectDao {
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<ProjectVo> selectProjectList() throws SQLException {
		List<ProjectVo> list = client.queryForList("selectProjectList");
		return list;
	}

	@Override
	public ProjectVo selectProject(int proj_Num) throws SQLException {
		ProjectVo projectVo = (ProjectVo) client.queryForObject("selectProject",proj_Num);
		return projectVo;
	}

	@Override
	public void insertProject(ProjectVo projectVo) throws SQLException {
		client.insert("insertProject",projectVo);
		
	}

	@Override
	public void updateProject(ProjectVo projectVo) throws SQLException {
		client.update("updateProject",projectVo);
	}

	@Override
	public void deleteProject(int proj_Num) throws SQLException {
		client.update("deleteProject",proj_Num);
	}

	@Override
	public List<ProjectVo> selectProjectById(String mem_Email) throws SQLException {
		List<ProjectVo> list =client.queryForList("selectProjectById", mem_Email);
		return list;
	}

	@Override
	public List<MemPositionViewVo> selectMemPositionViewListByProjNum(
			int proj_Num) throws SQLException {
		List<MemPositionViewVo> list = client.queryForList("selectMemPositionViewListByProjNum",proj_Num);
		return list;
	}
}
