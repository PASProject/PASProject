package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MemberDao;
import com.app.pas.dao.ProjectJoinDao;
import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemPositionViewVo;
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
	
	// 가입초대 수락 -> 조인테이블 업데이트
	public List<MemApplyViewVo> updateApplyAgree(int apply_Num) throws SQLException{
		
		// check 1로 업데이트 apply_commit_check
		memberDao.updateApplyCommitCheck(apply_Num);
		
		MemApplyViewVo memApplyViewVo = memberDao.selectMemApplyViewByApplyNum(apply_Num);
		ProjectJoinVo projectJoinVo = new ProjectJoinVo();
		projectJoinVo.setMem_Email(memApplyViewVo.getMem_Email());
		projectJoinVo.setProj_Num(memApplyViewVo.getProj_Num());
		projectJoinVo.setPjj_Per_Num(1);
		projectJoinVo.setPosition_Num(9);
		
		// 조인 pjj_per_num 업데이트
		projectJoinDao.updateProjectJoin(projectJoinVo);
		
		// 최신 알림 리스트 리턴
		List<MemApplyViewVo> list = memberDao.selectMemApplyViewByEmail(memApplyViewVo.getP_Mem_Email());
		return list;
	}

	// 가입초대 거부 
	public List<MemApplyViewVo> updateApplyReject(int apply_Num) throws SQLException{
		
		MemApplyViewVo memApplyViewVo = memberDao.selectMemApplyViewByApplyNum(apply_Num);
		ProjectJoinVo projectJoinVo = new ProjectJoinVo();
		projectJoinVo.setMem_Email(memApplyViewVo.getMem_Email());
		projectJoinVo.setProj_Num(memApplyViewVo.getProj_Num());
		// 프로젝트조인 테이블에서 삭제 
		projectJoinDao.deleteProjectJoin(projectJoinVo);
		// 초대 메세지 삭제
		memberDao.deleteApplyViewByApplyNum(apply_Num);
		// 최신 리스트 리턴
		List<MemApplyViewVo> list = memberDao.selectMemApplyViewByEmail(memApplyViewVo.getP_Mem_Email());
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
		
		public List<MemPositionViewVo> selectMemberListByProj(MemPositionViewVo memPositionViewVo) throws SQLException{
			List<MemPositionViewVo> memPositionViewVo1 =memberDao.selectMemberListByProj(memPositionViewVo);
		       return memPositionViewVo1;
		}
		
		public MemPositionViewVo selectMemberPosition(MemPositionViewVo memPositionViewVo) throws SQLException{
			MemPositionViewVo  memPositionViewVo1 = memberDao.selectMemberPosition(memPositionViewVo);
			return memPositionViewVo1;
		}
	



}
