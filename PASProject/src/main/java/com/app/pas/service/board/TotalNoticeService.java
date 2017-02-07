package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.TotalNoticeDao;
import com.app.pas.dto.board.NoticeVo;
import com.app.pas.dto.board.TotalNoticeVo;

public class TotalNoticeService {
 
	private TotalNoticeDao totalnoticeDao;

	public void setTotalnoticeDao(TotalNoticeDao totalnoticeDao) {
		this.totalnoticeDao = totalnoticeDao;
	}
	//토탈 노티스 List 
	public List<TotalNoticeVo> selectTotalNoticeList() throws SQLException{
		List<TotalNoticeVo> list = new ArrayList<TotalNoticeVo>();
		list = totalnoticeDao.selectTotalNoticeList();
				
		return list; 
		
	}

	
}
