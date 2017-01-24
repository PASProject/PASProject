package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.AccountBoardDao;
import com.app.pas.dto.board.AccountBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class AcountBoardDaoImpl implements AccountBoardDao {

	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<AccountBoardVo> selectAccountBoardList() throws SQLException {
		List<AccountBoardVo> list = client.queryForList("selectAccountBoardList");
		return list;
	}

	@Override
	public AccountBoardVo selectAccountBoard(int accNum) throws SQLException {
		AccountBoardVo accountBoardVo = (AccountBoardVo) client.queryForObject("selectAccountBoard",accNum);
		return accountBoardVo;
	}

	@Override
	public void insertAccountBoard(AccountBoardVo accountboardVo)
			throws SQLException {
		client.insert("insertAccountBoard",accountboardVo);
	}

	@Override
	public void updateAccountBoard(AccountBoardVo accountboardVo)
			throws SQLException {
		client.update("updateAccountBoard",accountboardVo);
	}

	@Override
	public void deleteAccountBoard(int accNum) throws SQLException {
		client.update("deleteAccountBoard",accNum);
	}

}
