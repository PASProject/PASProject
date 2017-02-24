package com.app.pas.dao.impl;

import java.sql.SQLException;

import com.app.pas.dao.MemberLogDao;
import com.app.pas.dto.MemberLogVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class MemberLogDaoImpl implements MemberLogDao{
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	
	@Override
	public void insertMemberLog(MemberLogVo memberLogVo) throws SQLException {
		client.insert("insertMemberLog",memberLogVo);
	}

}
