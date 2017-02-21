package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.ReceiveMessageVo;

public interface ReceiveMessageDao {

	  public List<ReceiveMessageVo> selectReceiveMessageList(ReceiveMessageVo receiveMessageVo)throws SQLException;
/*	  public List<ReceiveMessageVo>selectAllSendMessage()throws SQLException;  */
	  public ReceiveMessageVo selectReceiveMessage(int rm_Article_Num)throws SQLException;
	  public void insertReceiveMessage(ReceiveMessageVo receiveMessageVo)throws SQLException;

	  public void deleteReceiveMessage(int rm_Article_Num)throws SQLException;
	  public void updateReceiveMessageReadYN(int rm_Article_Num)throws SQLException;
	  public void updateReceiveMessageDelYN(int rm_Article_Num )throws SQLException;
	  
}
