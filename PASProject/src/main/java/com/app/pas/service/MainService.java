package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MainDao;
import com.app.pas.dto.MyPostBoardVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.dto.board.SkillSharingBoardReplyVo;
import com.app.pas.dto.board.SkillSharingBoardVo;

public class MainService {
	private MainDao mainDao;
	
	
	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	//내가 쓴 Qna게시물 보기 
	public QnaBoardVo myPostBoard_Qna(QnaBoardVo qnaBoardVo)throws SQLException{
		QnaBoardVo list = mainDao.myPostBoard_Qna(qnaBoardVo);
		return list;
		
	}
	//커뮤니티
	public List<FreeBoardVo>myPostBoard_frb(FreeBoardVo freeBoardVo) throws SQLException{
		List<FreeBoardVo> list = mainDao.myPostBoard_frb(freeBoardVo);
		return list;
	}
	//내가쓴 기술공유게시물 보기
	public SkillSharingBoardVo myPostBoard_Skill(SkillSharingBoardVo skillSharingBoardVo) throws SQLException{
		SkillSharingBoardVo skillSharingBoardVO = (SkillSharingBoardVo)mainDao.myPostBoard_Skill(skillSharingBoardVo); 
		return skillSharingBoardVO;
		
	}
	//내가쓴 기술 리플
	public SkillSharingBoardReplyVo selectSkillSharingBoardReply(int ssb_Article_Num)
	throws SQLException{
		SkillSharingBoardReplyVo skillSharingBoardReplyVO = (SkillSharingBoardReplyVo)mainDao.selectSkillSharingBoardReply(ssb_Article_Num);
	return skillSharingBoardReplyVO;
	
	}
	
	public List<MyPostBoardVo>MyPostBoard(MyPostBoardVo myPostBoardVo)throws SQLException{
		List<MyPostBoardVo>list = mainDao.MyPostBoard(myPostBoardVo);
		return list;
	}
	

}
