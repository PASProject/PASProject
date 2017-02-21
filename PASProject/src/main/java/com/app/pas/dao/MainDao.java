package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.dto.board.SkillSharingBoardVo;

public interface MainDao {

	public List<QnaBoardVo>myPostBoard_Qna(QnaBoardVo qnaBoardVo) throws SQLException;
	public List<FreeBoardVo>myPostBoard_frb(FreeBoardVo freeBoardVo)throws SQLException;
	public List<SkillSharingBoardVo>myPostBoard_Skill(SkillSharingBoardVo skillSharingBoardVo) throws SQLException;
	
}
