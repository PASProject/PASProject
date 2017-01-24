package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.FreeBoardDao;
import com.app.pas.dto.board.FreeBoardVo;

public class FreeBoardService {
	
	private FreeBoardDao freeboardDao;

	public void setFreeboardDao(FreeBoardDao freeboardDao) {
		this.freeboardDao = freeboardDao;
	}
	
	public List<FreeBoardVo> selectFreeBoardList(){
		List<FreeBoardVo> list= new ArrayList<FreeBoardVo>();
		try {
			list = freeboardDao.selectFreeBoardList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
 
	
}
