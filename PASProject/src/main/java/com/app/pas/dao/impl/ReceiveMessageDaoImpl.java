package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ReceiveMessageDao;
import com.app.pas.dto.ReceiveMessageVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ReceiveMessageDaoImpl implements ReceiveMessageDao {

	private SqlMapClient client;

	public void setSqlMapClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<ReceiveMessageVo> selectReceiveMessageList(
			ReceiveMessageVo receiveMessageVo) throws SQLException {
		List<ReceiveMessageVo> list = client.queryForList(
				"selectReceiveMessageList", receiveMessageVo);
		return list;
	}

	@Override
	public ReceiveMessageVo selectReceiveMessage(int rm_Article_Num)
			throws SQLException {
		ReceiveMessageVo receiveMessageVo = (ReceiveMessageVo) client.queryForObject("selectReceiveMessage", rm_Article_Num);
		
		return receiveMessageVo;
	}

	@Override
	public void insertReceiveMessage(ReceiveMessageVo receiveMessageVo)
			throws SQLException {
		client.insert("insertReceiveMessage", receiveMessageVo);

	}

	@Override
	public void deleteReceiveMessage(int rm_Article_Num) throws SQLException {
		client.delete("deleteReceiveMessage",rm_Article_Num);

	}

	@Override
	public void updateReceiveMessageReadYN(int rm_Article_Num)
			throws SQLException {
		client.update("updateReceiveMessageReadYN",rm_Article_Num);

	}

	@Override
	public void updateReceiveMessageDelYN(int rm_Article_Num)
			throws SQLException {
		client.update("updateReceiveMessageDelYN",rm_Article_Num);

	}

}
