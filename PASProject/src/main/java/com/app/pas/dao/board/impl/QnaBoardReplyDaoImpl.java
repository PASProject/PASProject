package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.QnaBoardReplyDao;
import com.app.pas.dto.board.QnaBoardReplyVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class QnaBoardReplyDaoImpl implements QnaBoardReplyDao {
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public QnaBoardReplyVo selectQnaReply(int qb_Article_Num)
			throws SQLException {
		QnaBoardReplyVo qnaBoardReplyVo = (QnaBoardReplyVo)client.queryForObject("selectQnaReply", qb_Article_Num);
		
		return qnaBoardReplyVo;
	}

	@Override
	public void insertQnaBoardReply(QnaBoardReplyVo qnaBoardReplyVo)
			throws SQLException {
		client.insert("insertQnaBoardReply", qnaBoardReplyVo);
		
	}

}
