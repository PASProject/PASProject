package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.FreeBoardReplyDao;
import com.app.pas.dto.board.FreeBoardReplyVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class FreeBoardReplyDaoImpl implements FreeBoardReplyDao {
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public List<FreeBoardReplyVo> selectFreeBoardReply(int frb_Article_Num)
			throws SQLException {
		List<FreeBoardReplyVo> list = client.queryForList("selectFreeBoardReply",frb_Article_Num);
		return list;
	}

	@Override
	public void insertFreeBoardReply(FreeBoardReplyVo freeBoardReplyVo)
			throws SQLException {
		client.insert("insertFreeBoardReply",freeBoardReplyVo);
	}

	@Override
	public void updateFreeBoardReply(FreeBoardReplyVo freeBoardReplyVo)
			throws SQLException {
		client.update("updateFreeBoardReply",freeBoardReplyVo);
		
	}

	@Override
	public void deleteFreeBoradReply(int frb_Reply_Num) throws SQLException {
		client.update("deleteFreeBoradReply",frb_Reply_Num);
	}

}