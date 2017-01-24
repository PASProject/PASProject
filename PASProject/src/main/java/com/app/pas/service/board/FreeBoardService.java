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
 
	public FreeBoardVo selectFreeBoardDetail(int frb_Article_Num){
		FreeBoardVo freeBoardVo = null;
		try {
			freeBoardVo = freeboardDao.selectFreeBoardDetail(frb_Article_Num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return freeBoardVo;
	}
	
	public void insertFreeBoard(FreeBoardVo freeBoardVo){
		try {
			freeboardDao.insertFreeBoard(freeBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void deleteFreeBoard(int frb_Article_Num){
		try {
			freeboardDao.deleteFreeBoard(frb_Article_Num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateFreeBoard(FreeBoardVo freeBoardVo){
		try {
			freeboardDao.updateFreeBoard(freeBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
