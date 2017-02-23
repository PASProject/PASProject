package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MainDao;
import com.app.pas.dto.MyPostBoardVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.QnaBoardVo;
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
	public List<QnaBoardVo> myPostBoard_Qna(QnaBoardVo qnaBoardVo) throws SQLException {
		List<QnaBoardVo> list = client.queryForList("myPostBoard_Qna",qnaBoardVo);
		return list;
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
	public List<SkillSharingBoardVo> myPostBoard_Skill(
			SkillSharingBoardVo skillSharingBoardVo) throws SQLException {
		List<SkillSharingBoardVo> list = client.queryForList("myPostBoard_Skill",skillSharingBoardVo);
		return list;
	}
	@Override
	public List<MyPostBoardVo> MyPostBoard(MyPostBoardVo myPostBoardVo)
			throws SQLException {
		List<MyPostBoardVo> list = client.queryForList("MyPostBoard",myPostBoardVo);
		return list;
	}

}
