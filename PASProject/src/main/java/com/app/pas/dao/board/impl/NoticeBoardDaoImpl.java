package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.NoticeDao;
import com.app.pas.dto.board.NoticeVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class NoticeBoardDaoImpl implements NoticeDao{

	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	@Override
	public List<NoticeVo> selectNoticeList() throws SQLException {
		List<NoticeVo> list = client.queryForList("selectNoticeList");
		return list;
	}

	@Override
	public NoticeVo selectNotice(int NoticeNum) throws SQLException {
		NoticeVo noticeVo = (NoticeVo) client.queryForObject("selectNotice",NoticeNum); 
		return noticeVo;
	}

	@Override
	public void insertNotice(NoticeVo noticeVo) throws SQLException {
		client.insert("insertNotice",noticeVo);
	}

	@Override
	public void updateNotice(NoticeVo noticeVo) throws SQLException {
		client.update("updateNotice",noticeVo);
	}

	@Override
	public void deleteNotice(int NoticeNum) throws SQLException {
		client.delete("deleteNotice",NoticeNum);
	}

}