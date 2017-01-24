package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.AccountBoardDao;
import com.app.pas.dto.board.AccountBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class AccountBoardDaoImpl implements AccountBoardDao {

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
	public AccountBoardVo selectAccountBoard(int acc_Num) throws SQLException {
		AccountBoardVo accountBoardVo = (AccountBoardVo) client.queryForObject("selectAccountBoard",acc_Num);
		return accountBoardVo;
	}

	@Override
	public void insertAccountBoard(AccountBoardVo accountBoardVo)
			throws SQLException {
		client.insert("insertAccountBoard",accountBoardVo);
	}

	@Override
	public void updateAccountBoard(AccountBoardVo accountBoardVo)
			throws SQLException {
		client.update("updateAccountBoard",accountBoardVo);
	}

	@Override
	public void deleteAccountBoard(int acc_Num) throws SQLException {
		client.update("deleteAccountBoard",acc_Num);
	}

}
