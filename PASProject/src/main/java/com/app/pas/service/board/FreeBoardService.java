package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.app.pas.dao.board.FreeBoardDao;
import com.app.pas.dto.board.FreeBoardVo;

public class FreeBoardService {
	
	private FreeBoardDao freeboardDao;

	public void setFreeboardDao(FreeBoardDao freeboardDao) {
		this.freeboardDao = freeboardDao;
	}
	
	public List<FreeBoardVo> selectFreeBoardList() throws SQLException{
		List<FreeBoardVo> list= new ArrayList<FreeBoardVo>();
		list = freeboardDao.selectFreeBoardList();
		return list;
	}
 
	
	public FreeBoardVo selectFreeBoardDetail(int frb_Article_Num)throws SQLException{
		FreeBoardVo freeBoardVo = null;
			freeBoardVo = freeboardDao.selectFreeBoardDetail(frb_Article_Num);
		return freeBoardVo;
	}
	
	
	public void insertFreeBoard(FreeBoardVo freeBoardVo) throws SQLException{
				freeboardDao.insertFreeBoard(freeBoardVo);
	}
	

	public void deleteFreeBoard(int frb_Article_Num)throws SQLException{
		
			freeboardDao.deleteFreeBoard(frb_Article_Num);
		
	}
	
	public void updateFreeBoard(FreeBoardVo freeBoardVo)throws SQLException{
		
			freeboardDao.updateFreeBoard(freeBoardVo);
	
	}
	
	public int selectTotalCount() throws SQLException{
		int totalCount = freeboardDao.selectTotalCount();
		return totalCount;
	}
}
