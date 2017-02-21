package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.SendMessageVo;

public interface SendMessageDao {

	  public List<SendMessageVo> selectSendMessageList(SendMessageVo sendMessageVo)throws SQLException;
/*	  public List<SendMessageVo>selectAllSendMessage()throws SQLException;  */
	  public SendMessageVo selectSendMessage(int sm_Article_Num)throws SQLException;
	  public void insertSendMessage(SendMessageVo sendMessageVo)throws SQLException;

	  public void deleteSendMessage(int sm_Article_Num)throws SQLException;
	  public void updateSendMessageReadYN(int sm_Article_Num)throws SQLException;
	  public void updateSendMessageDelYN(int sm_Article_Num )throws SQLException;
	  
}
