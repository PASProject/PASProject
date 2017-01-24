package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.QnaBoardDao;
import com.app.pas.dto.board.QnaBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class QnaBoardDaoImpl implements QnaBoardDao{
	
	private SqlMapClient client;
	
	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<QnaBoardVo> selectQnaBoardList() throws SQLException {
		List<QnaBoardVo> list = client.queryForList("selectQnaBoardList");
		return list;
	}

	@Override
	public QnaBoardVo selectQnaBoard(int qb_Article_Num) throws SQLException {
		QnaBoardVo qnaBoardVo = (QnaBoardVo) client.queryForObject("selectQnaBoard",qb_Article_Num);
		return qnaBoardVo;
	}

	@Override
	public void insertQnaBoard(QnaBoardVo qnaBoardVo) throws SQLException {
		client.insert("insertQnaBoard",qnaBoardVo);
	}

	@Override
	public void updateQnaBoard(QnaBoardVo qnaBoardVo) throws SQLException {	
		client.update("updateQnaBoard",qnaBoardVo);
	}

	@Override
	public void deleteQnaBoard(int qb_Article_Num) throws SQLException {
		client.delete("deleteQnaBoard",qb_Article_Num);
	}
	
}
