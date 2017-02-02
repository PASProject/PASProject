package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.SkillSharingBoardVo;

public interface SkillSharingBoardReplyDao {
	
	public List<SkillSharingBoardVo> selectSkillSharingBoardList()throws SQLException;
	public SkillSharingBoardVo selectSkillSharingBoard(int ssb_Article_Num)throws SQLException;
	public SkillSharingBoardVo selectSkillSharingBoardTitle(String ssb_Title) throws SQLException;
	public void insertSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)throws SQLException;
	public void updateSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)throws SQLException;
	public void deleteSkillSharingBoard(int ssb_Article_Num)throws SQLException;
	public int selectSsbTotalCount() throws SQLException;
	public List<SkillSharingBoardVo> selectSearchSsbTitle(String ssb_title)throws SQLException;
	public List<SkillSharingBoardVo> selectSearchSsbTitle()throws SQLException;
}
