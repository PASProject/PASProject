package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.ProjectBoardReplyDao;
import com.app.pas.dto.board.ProjectBoardReplyVo;



public class ProjectBoardReplyService {

	private ProjectBoardReplyDao projectBoardReplyDao;
	
	public void setProjectBoardReplyDao(ProjectBoardReplyDao projectBoardReplyDao){
		this.projectBoardReplyDao = projectBoardReplyDao;
	}
	
	public void insertProjectBoardReply(ProjectBoardReplyVo projectBoardReplyVo)throws SQLException{
		projectBoardReplyDao.insertProjectBoardReply(projectBoardReplyVo);
	}
	
	public List<ProjectBoardReplyVo> selectProjectBoardReply(int pb_Article_num) throws SQLException{
		List<ProjectBoardReplyVo> list = projectBoardReplyDao.selectProjectBoardReply(pb_Article_num);
		return list;
	}
}
