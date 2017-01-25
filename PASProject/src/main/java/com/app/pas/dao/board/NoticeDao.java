package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.NoticeVo;

public interface NoticeDao {
	
	public List<NoticeVo> selectNoticeList()throws SQLException;
	public List<NoticeVo> selectNotice(int proj_Num)throws SQLException;
	public void insertNotice(NoticeVo noticeVo)throws SQLException;
	public void updateNotice(NoticeVo noticeVo)throws SQLException;
	public void deleteNotice(int Notice_Num)throws SQLException;
	public int selectNoticeCount()throws SQLException;
}
