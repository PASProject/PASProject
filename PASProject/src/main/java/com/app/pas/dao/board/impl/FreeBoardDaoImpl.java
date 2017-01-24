package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.FreeBoardDao;
import com.app.pas.dto.board.AccountBoardVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class FreeBoardDaoImpl implements FreeBoardDao{
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<FreeBoardVo> selectFreeBoardList() throws SQLException {
		List<FreeBoardVo> list = client.queryForList("selectFreeBoardList");
		return list;
	}

	@Override
	public FreeBoardVo selectFreeBoard(int frb_Article_Num) throws SQLException {
		FreeBoardVo freeBoardVo = (FreeBoardVo) client.queryForObject("selectFreeBoard",frb_Article_Num);
		return freeBoardVo;
	}

	@Override
	public void insertFreeBoard(FreeBoardVo freeBoardVo) throws SQLException {
		client.insert("insertFreeBoard",freeBoardVo);
	}

	@Override
	public void updateFreeBoard(FreeBoardVo freeBoardVo) throws SQLException {
		client.update("updateFreeBoard",freeBoardVo);
	}

	@Override
	public void deleteFreeBoard(int frb_Article_Num) throws SQLException {
		client.delete("deleteFreeBoard",frb_Article_Num);
	}

	@Override
	public FreeBoardVo selectFreeBoardDetail(int frb_Article_Num)
			throws SQLException {
		FreeBoardVo freeBoardVo = (FreeBoardVo) client.queryForObject("selectFreeBoardDetail",frb_Article_Num);
		return freeBoardVo;
	}

}
