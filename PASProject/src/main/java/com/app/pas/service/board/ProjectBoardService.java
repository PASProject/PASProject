package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.ProjectBoardDao;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.ProjectBoardVo;

public class ProjectBoardService {

	private ProjectBoardDao projectboardDao;

	public void setProjectboardDao(ProjectBoardDao projectboardDao) {
		this.projectboardDao = projectboardDao;
	}
	
	public List<ProjectBoardVo> selectProjectboardList() throws SQLException{
		List<ProjectBoardVo> list = projectboardDao.selectProjectBoardList();
		return list;
	}
	
	public ProjectBoardVo selectProjectBoardDetail(int pb_Article_Num)throws SQLException{
		ProjectBoardVo projectBoardVo = null;
		projectBoardVo = projectboardDao.selectProjectBoardDetail(pb_Article_Num);
		return projectBoardVo;
	}
	
	//-----------------------
	public void insertProjectBoard(ProjectBoardVo projectBoardVo)throws SQLException{
		projectboardDao.insertProjectBoard(projectBoardVo);
		
	}
	//----------------------------
	
	public void deleteProjectBoard(int pb_Article_Num)throws SQLException{
		projectboardDao.deleteProjectBoard(pb_Article_Num);
	}
	public void updateProjectBoard(ProjectBoardVo projectBoardVo)throws SQLException{
		projectboardDao.updateProjectBoard(projectBoardVo);
	}
	public List<ProjectBoardVo> selectProjectBoardListV(int pb_Article_Num) throws SQLException{
		List<ProjectBoardVo> list = projectboardDao.selectProjectBoardListV(pb_Article_Num);
		return list;
	}
	public int selectPBTotalCount() throws SQLException{
		int pbTotalCount = projectboardDao.selectPBTotalCount();
		return pbTotalCount;
	}
}
