package com.app.pas.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.MessageDao;
import com.app.pas.dto.MessageVo;

public class MessageService {

	private MessageDao messageDao;

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	
	
	public List<MessageVo> selectMessageList(MessageVo messageVo) throws SQLException{
		List<MessageVo> list = new ArrayList<MessageVo>();
		list = messageDao.selectMessageList(messageVo);
		
		
		return list;
		
	}
}
