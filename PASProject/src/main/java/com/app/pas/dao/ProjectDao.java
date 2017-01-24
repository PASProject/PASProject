package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.ProjectVo;

public interface ProjectDao {
	public List<ProjectVo> selectProjectList()throws SQLException;
	public ProjectVo selectProject(int proj_Num)throws SQLException;
	public void insertProject(ProjectVo projectVo)throws SQLException;
	public void updateProject(ProjectVo projectVo)throws SQLException;
	public void deleteProject(int proj_Num)throws SQLException;
}
