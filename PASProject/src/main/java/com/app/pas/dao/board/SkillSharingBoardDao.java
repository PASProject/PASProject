package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.SkillSharingBoardVo;

public interface SkillSharingBoardDao {
	
	public List<SkillSharingBoardVo> selectSkillSharingBoardList()throws SQLException;
	public SkillSharingBoardVo selectSkillSharingBoard(int ssb_Article_Num)throws SQLException;
	public void insertSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)throws SQLException;
	public void updateSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)throws SQLException;
	public void deleteSkillSharingBoard(int ssb_Article_Num)throws SQLException;

}
