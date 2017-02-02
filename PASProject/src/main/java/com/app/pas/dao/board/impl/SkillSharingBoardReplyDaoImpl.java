package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.SkillSharingBoardDao;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SkillSharingBoardReplyDaoImpl implements SkillSharingBoardDao {
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<SkillSharingBoardVo> selectSkillSharingBoardList()
			throws SQLException {
		List<SkillSharingBoardVo> list = client.queryForList("selectSkillSharingBoardList");
		return list;
	}

	@Override
	public SkillSharingBoardVo selectSkillSharingBoard(int ssb_Article_Num)
			throws SQLException {
		SkillSharingBoardVo skillSharingBoardVo = (SkillSharingBoardVo)client.queryForObject("selectSkillSharingBoard",ssb_Article_Num);
		return skillSharingBoardVo;
	}

	@Override
	public SkillSharingBoardVo selectSkillSharingBoardTitle(String ssb_Title)
			throws SQLException {
		SkillSharingBoardVo skillSharingBoardVo = (SkillSharingBoardVo)client.queryForObject("selectSkillSharingBoardTitle",ssb_Title);
		return skillSharingBoardVo;
	}
	
	@Override
	public void insertSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)
			throws SQLException {
		client.insert("insertSkillSharingBoard",skillSharingBoardVo);

	}

	@Override
	public void updateSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)
			throws SQLException {
		client.update("updateSkillSharingBoard",skillSharingBoardVo);

	}

	@Override
	public void deleteSkillSharingBoard(int ssb_Article_Num) throws SQLException {
		client.delete("deleteSkillSharingBoard",ssb_Article_Num);

	}

	@Override
	public int selectSsbTotalCount() throws SQLException {
		int totalCount = (Integer) client.queryForObject("selectTotalCountSharingBoard");
		return totalCount;
	}

	@Override
	public List<SkillSharingBoardVo> selectSearchSsbTitle(String ssb_title) throws SQLException {
		List<SkillSharingBoardVo> SsbList 
		= (List<SkillSharingBoardVo>)client.queryForList("selectSkillSharingBoardTitle",ssb_title);
		
		return SsbList;
		
	}

	@Override
	public List<SkillSharingBoardVo> selectSearchSsbTitle() throws SQLException {
		List<SkillSharingBoardVo> SsbList 
		= (List<SkillSharingBoardVo>)client.queryForList("selectSkillSharingBoardTitle",null);
		
		return SsbList;
	}

	


}
