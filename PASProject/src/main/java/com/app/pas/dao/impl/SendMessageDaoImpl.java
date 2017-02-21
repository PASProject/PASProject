package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.SendMessageDao;
import com.app.pas.dto.SendMessageVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SendMessageDaoImpl implements SendMessageDao {

	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<SendMessageVo> selectSendMessageList(SendMessageVo sendMessageVo)
			throws SQLException {
		List<SendMessageVo> list = client.queryForList("selectSendMessageList",
				sendMessageVo);
		return list;
	}

	@Override
	public SendMessageVo selectSendMessage(int sm_Article_Num)
			throws SQLException {
		SendMessageVo sendMessageVo = (SendMessageVo) client.queryForObject(
				"selectSendMessage", sm_Article_Num);
		return sendMessageVo;
	}

	@Override
	public void insertSendMessage(SendMessageVo sendMessageVo)
			throws SQLException {
		client.insert("insertSendMessage", sendMessageVo);

	}

	@Override
	public void deleteSendMessage(int sm_Article_Num) throws SQLException {
		client.delete("deleteSendMessage", sm_Article_Num);

	}

	@Override
	public void updateSendMessageReadYN(int sm_Article_Num) throws SQLException {
		client.update("updateSendMessageReadYN", sm_Article_Num);

	}

	@Override
	public void updateSendMessageDelYN(int sm_Article_Num) throws SQLException {
		client.update("updateSendMessageDelYN", sm_Article_Num);

	}

}
