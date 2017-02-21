package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.MyPostBoardVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.dto.board.SkillSharingBoardReplyVo;
import com.app.pas.dto.board.SkillSharingBoardVo;

public interface MainDao {

	public QnaBoardVo myPostBoard_Qna(QnaBoardVo qnaBoardVo) throws SQLException;
	public List<FreeBoardVo>myPostBoard_frb(FreeBoardVo freeBoardVo)throws SQLException;
	public SkillSharingBoardVo myPostBoard_Skill(SkillSharingBoardVo skillSharingBoardVo) throws SQLException;
	public SkillSharingBoardReplyVo selectSkillSharingBoardReply(int ssb_Article_Num ) throws SQLException;
	
	public List<MyPostBoardVo>MyPostBoard(MyPostBoardVo myPostBoardVo) throws SQLException;
	
}
