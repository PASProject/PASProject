package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.InviteDao;
import com.app.pas.dto.InviteVo;
import com.app.pas.dto.ProjInviteViewVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class InviteDaoImpl implements InviteDao{
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<InviteVo> selectInviteList() throws SQLException {
		List<InviteVo> list = client.queryForList("selectInviteList");
		return list;
	}

	@Override
	public void insertInvite(InviteVo inviteVo) throws SQLException {
		client.insert("insertInvite",inviteVo);
	}

	@Override
	public void updateInvite(InviteVo inviteVo) throws SQLException {
		client.update("updateInvite",inviteVo);
	}

	@Override
	public void deleteInvite(int invite_Num) throws SQLException {
		client.update("deleteInvite",invite_Num);
	}

	@Override
	public List<ProjInviteViewVo> selectInviteList(ProjInviteViewVo projInviteViewVo) throws SQLException {
		List<ProjInviteViewVo> list =client.queryForList("selectInviteList", projInviteViewVo);
		return list;
	}
}
