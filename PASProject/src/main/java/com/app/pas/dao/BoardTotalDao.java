package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.BoardTotalVo;

public interface BoardTotalDao {

	public List<BoardTotalVo> selectBoardTotalList(int bm_Num) throws SQLException;
}
