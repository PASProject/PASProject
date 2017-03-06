package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.BoardTotalDao;
import com.app.pas.dto.BoardTotalVo;

public class BoardTotalService {

	private BoardTotalDao boardTotalDao;

	public void setBoardTotalDao(BoardTotalDao boardTotalDao) {
		this.boardTotalDao = boardTotalDao;
	}
	
	public List<BoardTotalVo> selectBoardTotalList(int bt_Num) throws SQLException{
		List<BoardTotalVo> list = boardTotalDao.selectBoardTotalList(bt_Num);
		return list;
	}
}
