package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.ProjectBoardDao;
import com.app.pas.dto.board.FreeBoardReplyVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.ProjectBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ProjectBoardDaoImpl implements ProjectBoardDao{
	
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
	public ProjectBoardVo selectProjectBoard(int pb_Article_Num)
			throws SQLException {
		ProjectBoardVo projectBoardVo = (ProjectBoardVo) client.queryForObject("selectProjectBoard",pb_Article_Num);
		return projectBoardVo;
	}
//-----------------------------------------------------------------
	@Override
	public void insertProjectBoard(ProjectBoardVo projectBoardVo)
			throws SQLException {
		client.insert("insertProjectBoard",projectBoardVo);
		
	}

	@Override
	public void updateProjectBoard(ProjectBoardVo projectBoardVo)
			throws SQLException {
		client.update("updateProjectBoard",projectBoardVo);
	}

	@Override
	public void deleteProjectBoard(int pb_Article_Num) throws SQLException {
		client.delete("deleteProjectBoard",pb_Article_Num);
	}

	@Override
	public ProjectBoardVo selectProjectBoardDetail(int pb_Article_Num)
			throws SQLException {
		ProjectBoardVo projectBoardVo = (ProjectBoardVo) client.queryForObject("selectProjectBoardDetail", pb_Article_Num);
		return projectBoardVo;
	}
	
	@Override
	public int selectPBTotalCount() throws SQLException {
		int PBTotalCount = (Integer) client.queryForObject("selectPBTotalCount");
		return PBTotalCount;
	}

	@Override
	public List<ProjectBoardVo> selectProjectBoardListV(int pb_Article_Num)
			throws SQLException {
		List<ProjectBoardVo> list = client.queryForList("selectProjectBoard",pb_Article_Num);
		return list;
		
	}


}
