package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MemberDao;
import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemberVo;

public class MemberService {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public MemberVo getMember(String memEmail){
		MemberVo member= null;
		try {
			member = memberDao.selectMember(memEmail);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}
	public void insertMember(MemberVo memberVo) throws SQLException{
		memberDao.insertMember(memberVo);
	}
	public List<MemberVo> selectMemberList() throws SQLException {
		List<MemberVo> list =  memberDao.selectMemberList();
		return list;
	}
	
	public void extraPwd(MemberVo memberVo) throws SQLException{
		memberDao.extraMemberPwd(memberVo);
	}
	
	public void AuthMember(String mem_Email) throws SQLException{
		memberDao.AuthMember(mem_Email);
	}
	
	public int selectCountMemApplyView(MemApplyViewVo memApplyViewVo) throws SQLException{
		int countMemApply =memberDao.selectCountMemApplyView(memApplyViewVo);
		return countMemApply;
	}
	

	public List<MemApplyViewVo> selectMemApplyViewByEmail(String p_Mem_Email) throws SQLException{
		List<MemApplyViewVo> list = memberDao.selectMemApplyViewByEmail(p_Mem_Email);
		return list;
	}

	// 여준영 부분
	
		public void updateMemberImg(MemberVo memberVo) throws SQLException{
			memberDao.updateMemberImg(memberVo);
			}
		
		
		public MemberVo searchEmail(MemberVo memberVo) throws SQLException{
			MemberVo memberVo1 = memberDao.searchEmail(memberVo);
			return memberVo1;
		}
	

}
