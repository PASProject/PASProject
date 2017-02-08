package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.InviteVo;
import com.app.pas.dto.ProjInviteViewVo;

public interface InviteDao {
	public List<InviteVo> selectInviteList()throws SQLException;
	public void insertInvite(InviteVo inviteVo)throws SQLException;
	public void updateInvite(InviteVo inviteVo)throws SQLException;
	public void deleteInvite(int invite_Num)throws SQLException;
	public List<ProjInviteViewVo> selectInviteList(ProjInviteViewVo projInviteViewVo)throws SQLException;
}
