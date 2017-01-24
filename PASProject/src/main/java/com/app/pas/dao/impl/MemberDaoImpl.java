package com.app.pas.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.MemberDao;
import com.app.pas.dto.MemberVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class MemberDaoImpl implements MemberDao {
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<MemberVo> selectMemberList() throws SQLException {
		List<MemberVo> list = client.queryForList("selectMemberList");
		return list;
	}

	@Override
	public MemberVo selectMember(String mem_Email) throws SQLException {
		MemberVo memberVo = (MemberVo) client.queryForObject("selectMember",mem_Email);
		return memberVo;
	}

	@Override
	public void insertMember(MemberVo memberVo) throws SQLException {
		client.insert("insertMember",memberVo);
	}

	@Override
	public void updateMember(MemberVo memberVo) throws SQLException {
		client.update("updateMember",memberVo);
	}

	@Override
	public void deleteMember(String mem_Email) throws SQLException {
		client.update("deleteMember",mem_Email);
	}

	@Override
	public int selectMemberById(String mem_Email) throws SQLException {
		int result =(Integer) client.queryForObject("selectMemberById",mem_Email);
		return result;
	}
}
