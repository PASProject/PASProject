package com.app.pas.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.SendMessageDao;
import com.app.pas.dto.SendMessageVo;

public class SendMessageService {

	private SendMessageDao sendMessageDao;

	public void setSendMessageDao(SendMessageDao sendMessageDao) {
		this.sendMessageDao = sendMessageDao;
	}

	public List<SendMessageVo> selectSendMessageList(SendMessageVo sendMessageVo) throws SQLException{
		List<SendMessageVo> list = new ArrayList<SendMessageVo>();
		list = sendMessageDao.selectSendMessageList(sendMessageVo);
		return list;
	}
	
}
