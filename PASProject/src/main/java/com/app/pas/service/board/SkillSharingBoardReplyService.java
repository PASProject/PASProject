package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.SkillSharingBoardDao;
import com.app.pas.dto.board.SkillSharingBoardVo;

public class SkillSharingBoardReplyService {
	
	private SkillSharingBoardDao skillsharingboardDao;

	public void setSkillsharingboardDao(SkillSharingBoardDao skillsharingboardDao) {
		this.skillsharingboardDao = skillsharingboardDao;
	}
	
	public List<SkillSharingBoardVo> selectSkillSharingBoardList() throws SQLException{
		List<SkillSharingBoardVo> list= new ArrayList<SkillSharingBoardVo>();
		
			list = skillsharingboardDao.selectSkillSharingBoardList();
	
		return list;
	}
 
	public SkillSharingBoardVo selectSkillSharingBoardDetail(int ssb_Article_Num) throws SQLException{
		SkillSharingBoardVo skillSharingBoardVo = null;
		
			skillSharingBoardVo = skillsharingboardDao.selectSkillSharingBoard(ssb_Article_Num);
		
		return skillSharingBoardVo;
	}
	
	public List<SkillSharingBoardVo> selectSearchSsbTitle(String ssb_title) throws SQLException {
		List<SkillSharingBoardVo> SsbList= skillsharingboardDao.selectSearchSsbTitle(ssb_title);
		return SsbList;
	}
	
	public List<SkillSharingBoardVo> selectSearchSsbTitle() throws SQLException {
		List<SkillSharingBoardVo> SsbList= skillsharingboardDao.selectSearchSsbTitle();
		return SsbList;
	}
	
	public void insertSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo) throws SQLException{
		
			skillsharingboardDao.insertSkillSharingBoard(skillSharingBoardVo);
	
	}
	
	
	public void deleteSkillSharingBoard(int ssb_Article_Num) throws SQLException{
		
			skillsharingboardDao.deleteSkillSharingBoard(ssb_Article_Num);

	}
	
	public void updateSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo) throws SQLException{
		
			skillsharingboardDao.updateSkillSharingBoard(skillSharingBoardVo);
		
	}
	public int selectTotalCount() throws SQLException{
		int totalCount = skillsharingboardDao.selectSsbTotalCount();
		return totalCount;
	}
}
