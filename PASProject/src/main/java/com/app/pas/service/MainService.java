package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MainDao;
import com.app.pas.dto.MyPostBoardVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.dto.board.SkillSharingBoardVo;

public class MainService {
	private MainDao mainDao;
	
	
	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	//내가쓴Qna게시물 보기 
	public List<QnaBoardVo> myPostBoard_Qna(QnaBoardVo qnaBoardVo)throws SQLException{
		List<QnaBoardVo> list = mainDao.myPostBoard_Qna(qnaBoardVo);
		return list;
		
	}
	//커뮤니티
	public List<FreeBoardVo>myPostBoard_frb(FreeBoardVo freeBoardVo) throws SQLException{
		List<FreeBoardVo> list = mainDao.myPostBoard_frb(freeBoardVo);
		return list;
	}
	//기술공유
	public List<SkillSharingBoardVo>myPostBoard_Skill(SkillSharingBoardVo skillSharingBoardVo) throws SQLException{
		List<SkillSharingBoardVo> list = mainDao.myPostBoard_Skill(skillSharingBoardVo); 
		return list;
		
	}
	
	public List<MyPostBoardVo>MyPostBoard(MyPostBoardVo myPostBoardVo)throws SQLException{
		List<MyPostBoardVo>list = mainDao.MyPostBoard(myPostBoardVo);
		return list;
	}
	

}
