package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.BoardJoinVo;

public interface BoardJoinDao {
	public int insertBoardJoin(BoardJoinVo boardJoinVo) throws SQLException;
	public List<BoardJoinVo> selectBoardJoinList(int bm_Num) throws SQLException; 

	public void updateBoardJoin(BoardJoinVo boardJoinVo) throws SQLException;


} 
