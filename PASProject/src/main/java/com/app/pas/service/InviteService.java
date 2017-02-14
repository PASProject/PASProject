package com.app.pas.service;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.InviteDao;
import com.app.pas.dto.InviteVo;
import com.app.pas.dto.ProjInviteViewVo;

public class InviteService {
	
	private InviteDao inviteDao;

	public void setInviteDao(InviteDao inviteDao) {
		this.inviteDao = inviteDao;
	}
	
	public List<ProjInviteViewVo> selectInviteList(ProjInviteViewVo projInviteViewVo) throws SQLException{
       List<ProjInviteViewVo> list = inviteDao.selectInviteList(projInviteViewVo); 
		return list;
		
	}
	
	public void insertInvite(InviteVo inviteVo) throws SQLException{
		inviteDao.insertInvite(inviteVo);
	}
	
	public void deleteInvite(InviteVo inviteVo) throws SQLException {
		inviteDao.deleteInvite(inviteVo);
	}
	

}
