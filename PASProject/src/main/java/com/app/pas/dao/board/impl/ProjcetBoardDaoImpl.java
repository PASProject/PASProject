package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.ProjectBoardDao;
import com.app.pas.dto.board.ProjectBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProjcetBoardDaoImpl implements ProjectBoardDao{
	
	private SqlMapClient client;
	
	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public List<ProjectBoardVo> selectProjectBoardList() throws SQLException {
		List<ProjectBoardVo> list = client.queryForList("selectProjectBoardList");
		return list;
	}

	@Override
	public ProjectBoardVo selectProjectBoard(int pbArticleNum)
			throws SQLException {
		ProjectBoardVo projectBoardVo = (ProjectBoardVo) client.queryForObject("selectProjectBoard",pbArticleNum);
		return projectBoardVo;
	}

	@Override
	public void insertProjectBoard(ProjectBoardVo projectboardVo)
			throws SQLException {
		client.insert("insertProjectBoard",projectboardVo);
		
	}

	@Override
	public void updateProjectBoard(ProjectBoardVo projectboardVo)
			throws SQLException {
		client.update("updateProjectBoard",projectboardVo);
	}

	@Override
	public void deleteProjectBoard(int pbArticleNum) throws SQLException {
		client.delete("deleteProjectBoard",pbArticleNum);
	}

}
