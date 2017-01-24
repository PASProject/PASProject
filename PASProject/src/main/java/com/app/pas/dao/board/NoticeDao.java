package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.NoticeVo;

public interface NoticeDao {
	
	public List<NoticeVo> selectNoticeList()throws SQLException;
	public NoticeVo selectNotice(int Notice_Num)throws SQLException;
	public void insertNotice(NoticeVo noticeVo)throws SQLException;
	public void updateNotice(NoticeVo noticeVo)throws SQLException;
	public void deleteNotice(int Notice_Num)throws SQLException;
}
