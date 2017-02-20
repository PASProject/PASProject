package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MemberDao;
import com.app.pas.dao.ProjectJoinDao;
import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberCommandVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.ProjectJoinVo;

public class MemberService {

	private MemberDao memberDao;
	private ProjectJoinDao projectJoinDao;
	
	
	public void setProjectJoinDao(ProjectJoinDao projectJoinDao) {
		this.projectJoinDao = projectJoinDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public MemberVo getMember(String memEmail) {
		MemberVo member = null;
		try {
			member = memberDao.selectMember(memEmail);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	public void insertMember(MemberVo memberVo) throws SQLException {
		memberDao.insertMember(memberVo);
	}

	public List<MemberVo> selectMemberList() throws SQLException {
		List<MemberVo> list = memberDao.selectMemberList();
		return list;
	}

	public void extraPwd(MemberVo memberVo) throws SQLException {
		memberDao.extraMemberPwd(memberVo);
	}

	public void AuthMember(String mem_Email) throws SQLException {
		memberDao.AuthMember(mem_Email);
	}

	public int selectCountMemApplyView(MemApplyViewVo memApplyViewVo)
			throws SQLException {
		int countMemApply = memberDao.selectCountMemApplyView(memApplyViewVo);
		return countMemApply;
	}

	public List<MemApplyViewVo> selectMemApplyViewByEmail(String p_Mem_Email)
			throws SQLException {
		List<MemApplyViewVo> list = memberDao
				.selectMemApplyViewByEmail(p_Mem_Email);
		return list;
	}
	
	public List<MemApplyViewVo> updateApplyAgree(int apply_Num) throws SQLException{
		
		memberDao.updateApplyCommitCheck(apply_Num);
		
		MemApplyViewVo memApplyViewVo = memberDao.selectMemApplyViewByApplyNum(apply_Num);
		ProjectJoinVo projectJoinVo = new ProjectJoinVo();
		projectJoinVo.setMem_Email(memApplyViewVo.getMem_Email());
		projectJoinVo.setProj_Num(memApplyViewVo.getProj_Num());
		projectJoinVo.setPjj_Per_Num(1);
		projectJoinVo.setPosition_Num(9);
		
		projectJoinDao.updateProjectJoin(projectJoinVo);
		
		List<MemApplyViewVo> list = memberDao.selectMemApplyViewByEmail(memApplyViewVo.getP_Mem_Email());
		return list;
	}

	// 媛��엯珥덈� 嫄곕� 
	public List<MemApplyViewVo> updateApplyReject(int apply_Num) throws SQLException{
		
		MemApplyViewVo memApplyViewVo = memberDao.selectMemApplyViewByApplyNum(apply_Num);
		ProjectJoinVo projectJoinVo = new ProjectJoinVo();
		projectJoinVo.setMem_Email(memApplyViewVo.getMem_Email());
		projectJoinVo.setProj_Num(memApplyViewVo.getProj_Num());
		
		projectJoinDao.deleteProjectJoin(projectJoinVo);
		
		memberDao.deleteApplyViewByApplyNum(apply_Num);
		
		List<MemApplyViewVo> list = memberDao.selectMemApplyViewByEmail(memApplyViewVo.getP_Mem_Email());
		return list;
		
	}
	

		public void updateMemberImg(MemberVo memberVo) throws SQLException{
			memberDao.updateMemberImg(memberVo);
			}
		
		
		public MemberVo searchEmail(MemberVo memberVo) throws SQLException{
			MemberVo memberVo1 = memberDao.searchEmail(memberVo);
			return memberVo1;
		}
		
		public List<MemPositionViewVo> selectMemberListByProj(MemPositionViewVo memPositionViewVo) throws SQLException{
			List<MemPositionViewVo> memPositionViewVo1 =memberDao.selectMemberListByProj(memPositionViewVo);
		       return memPositionViewVo1;
		}
		
		public MemPositionViewVo selectMemberPosition(MemPositionViewVo memPositionViewVo) throws SQLException{
			MemPositionViewVo  memPositionViewVo1 = memberDao.selectMemberPosition(memPositionViewVo);
			return memPositionViewVo1;
		}
		public int selectMemberTotalCount() throws SQLException {
			int totalCount = memberDao.selectMemberTotalCount();
			return totalCount;
		}
	
		public int selectCountMemApplyViewByEmail(String p_Mem_Email) throws SQLException{
			int memApplyViewCount = memberDao.selectCountMemApplyViewByEmail(p_Mem_Email);
			return memApplyViewCount;
		}
	
		
		public int updateMember(MemberVo memberVo) throws SQLException{
		int result = memberDao.updateMember(memberVo);
		return result;
		}
		public void deleteMember(String mem_Email) throws SQLException {
			memberDao.deleteMember(mem_Email);
		}
	
		public List<MemberCommandVo> selectMemberEmailList(int proj_Num) throws SQLException{
			List<MemberCommandVo> list=memberDao.selectMemberEmailList(proj_Num);
			return list;
		}
		
		public String selectMemberPhone(String mem_Email) throws SQLException{
			String mem_Phone = memberDao.selectMemberPhone(mem_Email);
			return mem_Phone;
			
		}
		public int selectOtherProjectCount(String mem_Email) throws SQLException{
			 int result =memberDao.selectOtherProjectCount(mem_Email);
		     return result;
		}
	
		public MemPositionViewVo selectMemberPositionByEmail(MemPositionViewVo memPositionViewVo)throws SQLException{
			memPositionViewVo = memberDao.selectMemberPositionByEmail(memPositionViewVo);
			return memPositionViewVo;
		}

}
