package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.FreeBoardVo;

public interface FreeBoardDao {
	
	public List<FreeBoardVo> selectFreeBoardList()throws SQLException;
	public FreeBoardVo selectFreeBoard(int frb_Article_Num)throws SQLException;
	public void insertFreeBoard(FreeBoardVo freeBoardVo)throws SQLException;
	public void updateFreeBoard(FreeBoardVo freeBoardVo)throws SQLException;
	public void deleteFreeBoard(int frb_Article_Num)throws SQLException;
	public FreeBoardVo selectFreeBoardDetail(int frb_Article_Num) throws SQLException;
}
