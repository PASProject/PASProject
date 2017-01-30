package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.TotalNoticeDao;
import com.app.pas.dto.board.TotalNoticeVo;
import com.ibatis.sqlmap.client.SqlMapException;

public class TotalNoticeService {
 
	private TotalNoticeDao totalnoticeDao;
	
	public void setTotalnoticeDao(TotalNoticeDao totalnoticeDao) {
		this.totalnoticeDao = totalnoticeDao;
	}

	public List<TotalNoticeVo> selectTotalNoticeList() throws SQLException{
		List<TotalNoticeVo> list = new ArrayList<TotalNoticeVo>();
		list = totalnoticeDao.selectTotalNoticeList(); 
		return list;
		
	}	
	
	public TotalNoticeVo selectTotalNoticeBoard(int ttnotice_Num )throws SQLException{
		TotalNoticeVo totalNoticeVo = null;
		totalNoticeVo=totalnoticeDao.selectTotalNotice(ttnotice_Num);
		
		return totalNoticeVo;
	}
	
	
}
