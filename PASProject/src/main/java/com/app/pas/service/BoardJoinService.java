package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.BoardJoinDao;
import com.app.pas.dto.BoardJoinVo;

public class BoardJoinService {

	private BoardJoinDao boardJoinDao;

	public void setBoardJoinDao(BoardJoinDao boardJoinDao) {
		this.boardJoinDao = boardJoinDao;
	}
	
	public boolean insertBoardJoinDao(BoardJoinVo boardJoinVo) throws SQLException{
		int result = boardJoinDao.insertBoardJoin(boardJoinVo);
		boolean flag = false;
		if(result>=1){
			flag = true;
		}
		return flag;
	}
	public List<BoardJoinVo> selectBoardJoinList(int bm_Num) throws SQLException{
		List<BoardJoinVo> list = boardJoinDao.selectBoardJoinList(bm_Num);
		return list;
	}
}
