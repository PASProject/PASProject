package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.BoardJoinDao;
import com.app.pas.dto.BoardJoinVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BoardJoinDaoImpl implements BoardJoinDao{

	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public int insertBoardJoin(BoardJoinVo boardJoinVo) throws SQLException {
		int result = client.update("insertBoardJoin",boardJoinVo);
		return result;
	}

	@Override
	public List<BoardJoinVo> selectBoardJoinList(int bm_Num)
			throws SQLException {
		List<BoardJoinVo> list = client.queryForList("selectBoardJoinList",bm_Num);
		return list;
	}


	@Override
	public void updateBoardJoin(BoardJoinVo boardJoinVo) throws SQLException {
		client.update("updateBoardJoin",boardJoinVo);
	}


}
