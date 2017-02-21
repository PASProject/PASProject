package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MainDao;
import com.app.pas.dto.MyPostBoardVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.dto.board.SkillSharingBoardReplyVo;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.sun.security.ntlm.Client;

public class MainDaoImpl implements MainDao{
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
//내가쓴글 보기 Qna
	@Override
	public QnaBoardVo myPostBoard_Qna(QnaBoardVo qnaBoardVo) throws SQLException {
		QnaBoardVo qnaBoardVO = (QnaBoardVo)client.queryForObject("myPostBoard_Qna", qnaBoardVo);
		return qnaBoardVO;
	}
//커뮤니티
	@Override
	public List<FreeBoardVo> myPostBoard_frb(FreeBoardVo freeBoardVo)
			throws SQLException {
		List<FreeBoardVo> list = client.queryForList("myPostBoard_frb",freeBoardVo);
		return list;
	}
//기술공유
	@Override
	public SkillSharingBoardVo myPostBoard_Skill(
			SkillSharingBoardVo skillSharingBoardVo) throws SQLException {
		SkillSharingBoardVo skillSharingBoardVO = (SkillSharingBoardVo)client.queryForObject("myPostBoard_Skill",skillSharingBoardVo);
		return skillSharingBoardVO;
	}

	
	@Override
	public List<MyPostBoardVo> MyPostBoard(MyPostBoardVo myPostBoardVo)
			throws SQLException {
		List<MyPostBoardVo> list = client.queryForList("MyPostBoard",myPostBoardVo);
		return list;
	}
	@Override
	public SkillSharingBoardReplyVo selectSkillSharingBoardReply(
			int ssb_Article_Num)
			throws SQLException {
		SkillSharingBoardReplyVo skillSharingBoardReplyVO = (SkillSharingBoardReplyVo)
				client.queryForObject("selectSkillSharingBoardReply", ssb_Article_Num);
		return skillSharingBoardReplyVO;
	}

}
