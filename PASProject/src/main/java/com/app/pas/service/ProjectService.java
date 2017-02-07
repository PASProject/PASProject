package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.ApplyDao;
import com.app.pas.dao.MemberDao;
import com.app.pas.dao.ProjectDao;
import com.app.pas.dao.ProjectJoinDao;
import com.app.pas.dto.ApplyVo;
import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.ProjectJoinVo;
import com.app.pas.dto.ProjectVo;

public class ProjectService {

	private ProjectDao projectDao;
	private ApplyDao applyDao;
	private ProjectJoinDao projectJoinDao;
	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void setProjectJoinDao(ProjectJoinDao projectJoinDao) {
		this.projectJoinDao = projectJoinDao;
	}

	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}
	

	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}

	public List<ProjectVo> selectMyProjectListById(String mem_Email)
			throws SQLException {
		List<ProjectVo> list = projectDao.selectMyProjectListById(mem_Email);
		return list;
	}

	public List<ProjectVo> selectOtherProjectList() throws SQLException {
		List<ProjectVo> list = projectDao.selectProjectList();
		return list;

	}
	
	public List<MemPositionViewVo> selectMemPositionViewListByProjNum(int proj_Num) throws SQLException{
		List<MemPositionViewVo> list = projectDao.selectMemPositionViewListByProjNum(proj_Num);
		return list;
	}

	public List<ProjectVo> selectOtherProjectListById(String mem_Email) throws SQLException{
		List<ProjectVo> list = projectDao.selectOtherProjectListById(mem_Email);
		return list;
	}
	
	public MemApplyViewVo insertApply(ApplyVo applyVo,ProjectJoinVo projectJoinVo,MemApplyViewVo memApplyViewVo) throws SQLException{
		applyDao.insertApply(applyVo);
		projectJoinDao.insertProjectJoin(projectJoinVo);
		memApplyViewVo = memberDao.selectMemApplyViewByMemProj(memApplyViewVo);
		return memApplyViewVo;
	}
	
	public int insertProject(ProjectVo projectVo,ProjectJoinVo projectJoinVo) throws SQLException{
		projectDao.insertProject(projectVo);
		ProjectVo project = projectDao.selectLastInsertProject(projectVo.getMem_Email());
		projectJoinVo.setProj_Num(project.getProj_Num());
		projectJoinDao.insertProjectJoin(projectJoinVo);
		projectJoinDao.updateProjectJoin(projectJoinVo);
		return project.getProj_Num();
	}
}
