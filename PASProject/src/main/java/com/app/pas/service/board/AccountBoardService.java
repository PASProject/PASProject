package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.AccountBoardDao;
import com.app.pas.dto.board.AccountBoardVo;

public class AccountBoardService {

	private AccountBoardDao accountBoardDao;

	public void setAccountboardDao(AccountBoardDao accountBoardDao) {
		this.accountBoardDao = accountBoardDao;
	}

	public List<AccountBoardVo> getAccountList(int proj_Num)
			throws SQLException {

		List<AccountBoardVo> list = accountBoardDao
				.selectAccountBoardByProj(proj_Num);
		return list;
	}

	public void InsertAccountBoard(AccountBoardVo accountBoardVo)
			throws SQLException {
		accountBoardDao.insertAccountBoard(accountBoardVo);
	}

}
