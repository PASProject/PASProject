package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.SkillSharingBoardDao;
import com.app.pas.dto.board.SkillSharingBoardLikeVo;
import com.app.pas.dto.board.SkillSharingBoardVo;

public class SkillSharingBoardService {

	private SkillSharingBoardDao skillsharingboardDao;

	public void setSkillsharingboardDao(
			SkillSharingBoardDao skillsharingboardDao) {
		this.skillsharingboardDao = skillsharingboardDao;
	}

	public List<SkillSharingBoardVo> selectSkillLikeCountViewList(String ssb_Title)
			throws SQLException {
		List<SkillSharingBoardVo> list = new ArrayList<SkillSharingBoardVo>();

		list = skillsharingboardDao.selectSkillLikeCountViewList(ssb_Title);

		return list;
	}

	public SkillSharingBoardVo selectSkillSharingBoardDetail(int ssb_Article_Num)
			throws SQLException {
		SkillSharingBoardVo skillSharingBoardVo = null;

		skillSharingBoardVo = skillsharingboardDao
				.selectSkillSharingBoard(ssb_Article_Num);

		return skillSharingBoardVo;
	}

	public List<SkillSharingBoardVo> selectSearchSsbTitle(String ssb_title)
			throws SQLException {
		List<SkillSharingBoardVo> SsbList = skillsharingboardDao
				.selectSearchSsbTitle(ssb_title);
		return SsbList;
	}

	public List<SkillSharingBoardVo> selectSearchSsbTitle() throws SQLException {
		List<SkillSharingBoardVo> SsbList = skillsharingboardDao
				.selectSearchSsbTitle();
		return SsbList;
	}

	public void insertSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)
			throws SQLException {

		skillsharingboardDao.insertSkillSharingBoard(skillSharingBoardVo);

	}

	public void deleteSkillSharingBoard(int ssb_Article_Num)
			throws SQLException {

		skillsharingboardDao.deleteSkillSharingBoard(ssb_Article_Num);

	}

	public void updateSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo)
			throws SQLException {

		skillsharingboardDao.updateSkillSharingBoard(skillSharingBoardVo);

	}

	public void updateSkillSharingBoardCount(
			SkillSharingBoardVo skillSharingBoardVo) throws SQLException {

		skillsharingboardDao.updateSkillSharingBoardCount(skillSharingBoardVo);
	}
	
	public void updateSkillSharingBoardCountM(
			SkillSharingBoardVo skillSharingBoardVo) throws SQLException {

		skillsharingboardDao.updateSkillSharingBoardCountM(skillSharingBoardVo);
		
	}

	public void updateSkillSharingBoardLike(
			SkillSharingBoardVo skillSharingBoardVo) throws SQLException {

		skillsharingboardDao.updateSkillSharingBoardLike(skillSharingBoardVo);

	}

	public int selectTotalCount() throws SQLException {
		int totalCount = skillsharingboardDao.selectSsbTotalCount();
		return totalCount;
	}
	
	public int insertSkillSharingBoardLike(
			SkillSharingBoardVo skillSharingBoardVo, SkillSharingBoardLikeVo skillSharingBoardLikeVo,int ssb_Article_NumL)
			throws SQLException {

		skillsharingboardDao.insertSkillSharingBoardLike(skillSharingBoardLikeVo);
		skillsharingboardDao.updateSkillSharingBoardCountM(skillSharingBoardVo);
		int likeCount = skillsharingboardDao.selectCountSharingBoardLike(ssb_Article_NumL);
		return likeCount;
	}
	
	public int deleteSkillSharingBoardLike(SkillSharingBoardLikeVo skillSharingBoardLikeVo,int ssb_Article_NumL)
			throws SQLException {
		skillsharingboardDao.deleteSkillSharingBoardLike(skillSharingBoardLikeVo);
		int likeCount = skillsharingboardDao.selectCountSharingBoardLike(ssb_Article_NumL);
		return likeCount;
	}
	public int selectCountSharingBoardLike(int ssb_Article_Num) throws SQLException {
		int likeCount = skillsharingboardDao.selectCountSharingBoardLike(ssb_Article_Num);
		return likeCount;
	}
	
	public SkillSharingBoardLikeVo selectSkillSharingBoardLikeList(SkillSharingBoardLikeVo skillSharingBoardLikeVo)
			throws SQLException {
		SkillSharingBoardLikeVo skillSharingBoardLike = 
				skillsharingboardDao.selectSkillSharingBoardLikeList(skillSharingBoardLikeVo);

		return skillSharingBoardLike;
	}
	
}
