package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.SkillSharingBoardDao;
import com.app.pas.dto.board.SkillSharingBoardVo;

public class SkillSharingBoardService {
	
	private SkillSharingBoardDao skillsharingboardDao;

	public void setSkillsharingboardDao(SkillSharingBoardDao skillsharingboardDao) {
		this.skillsharingboardDao = skillsharingboardDao;
	}
	
	public List<SkillSharingBoardVo> selectSkillSharingBoardList(){
		List<SkillSharingBoardVo> list= new ArrayList<SkillSharingBoardVo>();
		try {
			list = skillsharingboardDao.selectSkillSharingBoardList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
 
	public SkillSharingBoardVo selectSkillSharingBoardDetail(int ssb_Article_Num){
		SkillSharingBoardVo skillSharingBoardVo = null;
		try {
			skillSharingBoardVo = skillsharingboardDao.selectSkillSharingBoard(ssb_Article_Num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return skillSharingBoardVo;
	}
	
	public SkillSharingBoardVo selectSkillSharingBoardTitle(String ssb_Title){
		SkillSharingBoardVo skillSharingBoardVo = null;
		try {
			skillSharingBoardVo = skillsharingboardDao.selectSkillSharingBoardTitle(ssb_Title);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return skillSharingBoardVo;
	}
	
	public void insertSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo){
		try {
			skillsharingboardDao.insertSkillSharingBoard(skillSharingBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void deleteSkillSharingBoard(int ssb_Article_Num){
		try {
			skillsharingboardDao.deleteSkillSharingBoard(ssb_Article_Num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateSkillSharingBoard(SkillSharingBoardVo skillSharingBoardVo){
		try {
			skillsharingboardDao.updateSkillSharingBoard(skillSharingBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
