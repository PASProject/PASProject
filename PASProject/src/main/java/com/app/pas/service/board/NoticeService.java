package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.NoticeDao;
import com.app.pas.dto.board.NoticeVo;

public class NoticeService {

	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	public List<NoticeVo> getNoticeList(int proj_Num) throws SQLException {
		List<NoticeVo> list = null;

		list = (List<NoticeVo>) noticeDao.selectNotice(proj_Num);
		return list;
	}

}
