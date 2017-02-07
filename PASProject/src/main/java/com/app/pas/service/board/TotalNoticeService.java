package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.TotalNoticeDao;
import com.app.pas.dto.board.NoticeVo;
import com.app.pas.dto.board.TotalNoticeVo;
import com.sun.security.ntlm.Client;

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
	//전체공지사항 Detail
	public TotalNoticeVo selectTotalNoticeBoard(int ttnotice_Num) throws SQLException{
		
		TotalNoticeVo totalNoticeVo = totalnoticeDao.selectTotalNoticeBoard(ttnotice_Num);
		
		return totalNoticeVo;
	}
	//글쓰기
	public TotalNoticeVo insertTotalNotice(TotalNoticeVo totalNoticeVo)throws SQLException{
		totalnoticeDao.insertTotalNotice(totalNoticeVo);
		
		return totalNoticeVo;
	}
	
}
