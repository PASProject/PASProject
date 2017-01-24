package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.AccountBoardVo;

public interface AccountBoardDao {
  
	public List<AccountBoardVo> selectAccountBoardList()throws SQLException;
	public AccountBoardVo selectAccountBoard(int acc_Num)throws SQLException;
	public void insertAccountBoard(AccountBoardVo accountBoardVo)throws SQLException;
	public void updateAccountBoard(AccountBoardVo accountBoardVo)throws SQLException;
	public void deleteAccountBoard(int acc_Num )throws SQLException;	
	
}
