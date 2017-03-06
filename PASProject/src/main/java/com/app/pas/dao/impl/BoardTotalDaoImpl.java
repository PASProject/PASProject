package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.BoardTotalDao;
import com.app.pas.dto.BoardTotalVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class BoardTotalDaoImpl implements BoardTotalDao{

	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<BoardTotalVo> selectBoardTotalList(int bm_Num)
			throws SQLException {
		
		List<BoardTotalVo> list = client.queryForList("selectBoardTotalList",bm_Num);
		return list;
	}

}
